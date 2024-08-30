import ComposableArchitecture
import SwiftUI

@main
struct late_summer_tcaApp: App {
	var body: some Scene {
		WindowGroup {
			FSTab(store: .init(
				initialState: .init(
					components: IdentifiedArray(uniqueElements: [
						FSTabModel(id: "1", selected: true, title: "All"),
						FSTabModel(id: "2", selected: false, title: "Players"),
						FSTabModel(id: "3", selected: false, title: "Teams"),
					]),
					favouritesSelected: false
				),
				reducer: { FSTabReducer() }
			))
		}
	}
}
