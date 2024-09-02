import ComposableArchitecture
import XCTest
@testable import late_summer_tca

@MainActor
final class AppReducerTests: XCTestCase {
	typealias SUT = AppReducer

	private var store: TestStoreOf<SUT>!

	override func setUp() async throws {
		try await super.setUp()

		setupSUT()
	}

	private func setupSUT() {
		store = TestStore(
			initialState: SUT.State(
				tabs: .init(id: "componentId",
							components: [],
							favouritesSelected: false
			    ),
				currentTab: "All",
				favourite: false,
				listItems: []
			),
			reducer: { SUT() },
			withDependencies: { reducer in

			}
		)
	}
}
