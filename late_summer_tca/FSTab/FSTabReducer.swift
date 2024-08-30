import ComposableArchitecture

@Reducer
public struct FSTabReducer {

	@ObservableState
	public struct State: Equatable, Identifiable {
		public let id: String
		public var components: IdentifiedArrayOf<FSTabModel>
		public var favouritesSelected: Bool
	}

	public enum Action: Equatable {
		case tabSelected(tabId: String, tabTitle: String)
		case buttonClicked
	}

	public var body: some ReducerOf<Self> {
		Reduce { state, action in
			switch action {

			case let .tabSelected(tabId, _):
				state.components = IdentifiedArray(uniqueElements: state.components.map { tab in
					FSTabModel(id: tab.id, selected: false, title: tab.title)
				})
				state.components[id: tabId]?.selected = true
				return .none
			case .buttonClicked:
				state.favouritesSelected = !state.favouritesSelected
				return .none
			}
		}
	}

	public init() {}

}
