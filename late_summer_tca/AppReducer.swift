import ComposableArchitecture

@Reducer
public struct AppReducer {

	@ObservableState
	public struct State: Equatable {
		var tabs: FSTabReducer.State
		var listItems: [ListItemModel]
	}

	public enum Action: Equatable {
		case tabs(FSTabReducer.Action)
	}

	public var body: some ReducerOf<Self> {
		Scope(state: \State.tabs, action: \Action.Cases.tabs) {
			FSTabReducer()
		}

		Reduce { state, action in
			switch action {
			case let .tabs(.tabSelected(tabId: _, tabTitle: tabTitle)):
				print("BBB \(tabTitle)")
				return .none
			case .tabs(.buttonClicked):
				print("BBB buttonClicked")
				return .none
			}
		}
	}

	public init() {}

}
