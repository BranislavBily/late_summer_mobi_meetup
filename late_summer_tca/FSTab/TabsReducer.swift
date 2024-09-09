import ComposableArchitecture

@Reducer
public struct TabsReducer {

	@ObservableState
	public struct State: Equatable, Identifiable {
		public var id: String
		public var components: IdentifiedArrayOf<TabModel>
		public var favouritesSelected: Bool
	}

	public enum Action: Equatable {
		case tabSelected(tabId: State.ID)
		case buttonClicked
		case changeFavourites(Bool)
	}

	public var body: some ReducerOf<Self> {
		Reduce { state, action in
			switch action {
			case let .tabSelected(tabId):
				state.components = IdentifiedArray(uniqueElements: state.components.map { tab in
					TabModel(selected: false, title: tab.title)
				})
				state.components[id: tabId]?.selected = true
				return .none

			case .buttonClicked:
				return .run { [favourite = state.favouritesSelected] send in
					await send(.changeFavourites(!favourite))
				}

			case let .changeFavourites(value):
				state.favouritesSelected = value
				return .none
			}
		}
	}

	public init() {}

}
