import ComposableArchitecture
import XCTest
@testable import late_summer_tca

@MainActor
final class FSTabReducerTests: XCTestCase {
	typealias SUT = FSTabReducer

	private var store: TestStoreOf<SUT>!

	private enum Constants {
		static var favouritesSelected = false
	}

	override func setUp() async throws {
		try await super.setUp()

		setupSUT()
	}

	private func setupSUT() {
		store = TestStore(
			initialState: SUT.State(
				id: "componentId",
				components: [],
				favouritesSelected: false
			),
			reducer: { SUT() },
			withDependencies: { reducer in

			}
		)
		store.exhaustivity = .off
	}

	func testTabSelected() async {
		let tapTabId = "3"
		store = TestStore(
			initialState: SUT.State(
				id: "componentId",
				components: [
					.init(id: "1", selected: true, title: "All"),
					.init(id: "2", selected: false, title: "Player"),
					.init(id: tapTabId, selected: false, title: "Teams"),
				],
				favouritesSelected: Constants.favouritesSelected
			),
			reducer: { SUT() },
			withDependencies: { reducer in

			}
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
		await store.send(.buttonClicked)

		await store.receive(.changeFavourites(!Constants.favouritesSelected))
	}

	func testChangeFavourites() async {
		await store.send(.changeFavourites(!Constants.favouritesSelected)) {
			$0.favouritesSelected = !Constants.favouritesSelected
		}
	}
}
