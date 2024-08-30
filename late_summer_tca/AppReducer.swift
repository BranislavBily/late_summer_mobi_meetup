import ComposableArchitecture

@Reducer
public struct AppReducer {

	@ObservableState
	public struct State: Equatable {
		var tabs: FSTabReducer.State
		var currentTab: String
		var favourite: Bool
		var listItems: [ListItemModel]
	}

	public enum Action: Equatable {
		case start
		case tabs(FSTabReducer.Action)
		case dataReceived([ListItemModel])
	}

	public var body: some ReducerOf<Self> {
		Scope(state: \State.tabs, action: \Action.Cases.tabs) {
			FSTabReducer()
		}

		Reduce { state, action in
			switch action {
			case .start:
				return getData(&state)

			case let .tabs(.tabSelected(tabId: _, tabTitle: tabTitle)):
				state.listItems = []
				state.currentTab = tabTitle
				return getData(&state)

			case let .tabs(.favouritesChanged(favourite)):
				state.listItems = []
				state.favourite = favourite
				return getData(&state)

			case .tabs(.buttonClicked):
				return .none

			case let .dataReceived(newItems):
				state.listItems = newItems
				return .none
			}
		}
	}

	private func getData(_ state: inout State) -> Effect<Action> {
		return .run { [tab = state.currentTab, favourite = state.favourite] send in
			let items = await DataSource().getData(type: tab, favourite)
			await send(.dataReceived(items))
		}
	}

	public init() {}

}
