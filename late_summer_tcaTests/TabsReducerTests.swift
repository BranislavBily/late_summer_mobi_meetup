import ComposableArchitecture
@testable import late_summer_tca
import XCTest

@MainActor
final class TabsReducerTests: XCTestCase {

	private var store: TestStoreOf<TabsReducer>!

	private enum Constants {
		static var favouritesSelected = false
	}

	func testTabSelected() async {
		let tapTabId = "Teams"
		store = TestStore(
			initialState: TabsReducer.State(
				id: "componentId",
				components: IdentifiedArray(uniqueElements: [
					TabModel(selected: true, title: "All"),
					TabModel(selected: false, title: "Players"),
					TabModel(selected: false, title: "Teams"),
				]),
				favouritesSelected: Constants.favouritesSelected
			),
			reducer: { TabsReducer() }
		)

		await store.send(.tabSelected(tabId: tapTabId)) 
	}

	func testButtonClicked() async {
		store = TestStore(
			initialState: TabsReducer.State(
				id: "componentId",
				components: [],
				favouritesSelected: false
			),
			reducer: { TabsReducer() }
		)
		await store.send(.buttonClicked)

		await store.receive(.changeFavourites(!Constants.favouritesSelected))
	}

}
