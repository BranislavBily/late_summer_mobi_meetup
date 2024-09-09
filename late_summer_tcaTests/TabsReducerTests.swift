import ComposableArchitecture
import XCTest
@testable import late_summer_tca

@MainActor
final class TabsReducerTests: XCTestCase {

	private var store: TestStoreOf<TabsReducer>!

	private enum Constants {
		static var favouritesSelected = false
	}

	func testTabSelected() async {
		let tapTabId = "3"
		store = TestStore(
			initialState: TabsReducer.State(
				id: "componentId",
				components: [
					.init(id: "1", selected: true, title: "All"),
					.init(id: "2", selected: false, title: "Player"),
					.init(id: tapTabId, selected: false, title: "Teams"),
				],
				favouritesSelected: Constants.favouritesSelected
			),
			reducer: { TabsReducer() },
			withDependencies: { _ in }
		)

		await store.send(.tabSelected(tabId: tapTabId, tabTitle: "Teams")) {
			$0.components = [
				.init(id: "1", selected: false, title: "All"),
				.init(id: "2", selected: false, title: "Player"),
				.init(id: tapTabId, selected: true, title: "Teams"),
			]
		}
	}

	func testButtonClicked() async {
		store = TestStore(
			initialState: TabsReducer.State(
				id: "componentId",
				components: [],
				favouritesSelected: false
			),
			reducer: { TabsReducer() },
			withDependencies: { _ in }
		)
		await store.send(.buttonClicked)

		await store.receive(.changeFavourites(!Constants.favouritesSelected))
	}

}
