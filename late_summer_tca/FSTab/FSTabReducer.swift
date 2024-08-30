import ComposableArchitecture

@Reducer
public struct FSTabReducer {

	@ObservableState
	public struct State: Equatable {
		public var components: IdentifiedArrayOf<FSTabModel>
		public var favouritesSelected: Bool
	}

	public enum Action: Equatable {
		case tabSelected(tabId: String)
		case buttonClicked
	}

	public var body: some ReducerOf<Self> {
		Reduce { state, action in
			switch action {

			case let .tabSelected(tabId):
				state.components = IdentifiedArray(uniqueElements: state.components.map { tab in
					FSTabModel(id: tab.id, selected: false, title: tab.title)
				})
				state.components[id: tabId]?.selected = true
				return .none
			case .buttonClicked:
				return .none
			}
		}
	}

	public init() {}

}
