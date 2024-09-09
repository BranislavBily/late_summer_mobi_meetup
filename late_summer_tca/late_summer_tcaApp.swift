import ComposableArchitecture
import SwiftUI

@main
struct late_summer_tcaApp: App {
	var body: some Scene {
		WindowGroup {
			AppView(store: .init(
				initialState: .init(
					tabs: .init(
						id: "0",
						components: IdentifiedArray(uniqueElements: [
							TabModel(selected: true, title: "All"),
							TabModel(selected: false, title: "Players"),
							TabModel(selected: false, title: "Teams"),
						]),
						favouritesSelected: false
					),
					selectedTab: "All",
					favourite: false,
					listItems: .init()
				),
				reducer: { AppReducer() }
			))
			.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
		}
	}
}
