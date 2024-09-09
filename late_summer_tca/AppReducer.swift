import ComposableArchitecture

@Reducer
public struct AppReducer {

	@ObservableState
	public struct State: Equatable {
		var tabs: TabsReducer.State
		var selectedTab: TabsReducer.State.ID
		var favourite: Bool
		var listItems: IdentifiedArrayOf<ListItemModel>
	}

	public enum Action: Equatable {
		case start
		case tabs(TabsReducer.Action)
		case dataReceived([ListItemModel])
	}

	public var body: some ReducerOf<Self> {
		Scope(state: \State.tabs, action: \Action.Cases.tabs) {
			TabsReducer()
		}

		Reduce { state, action in
			switch action {
			case .start:
				return getData(&state)

			case let .tabs(.tabSelected(tabId: tabID)):
				state.selectedTab = tabID
				return getData(&state)

			case let .tabs(.changeFavourites(favourite)):
				state.favourite = favourite
				return getData(&state)

			case .tabs(.buttonClicked):
				return .none

			case let .dataReceived(newItems):
				state.listItems = .init(uniqueElements: newItems)
				return .none
			}
		}
		._printChanges()
	}

	private func getData(_ state: inout State) -> Effect<Action> {
		return .run { [tab = state.selectedTab, favourite = state.favourite] send in
			let items = await DataSource().getData(type: tab, favourite)
			await send(.dataReceived(items), animation: .default)
		}
	}

	public init() {}

}
