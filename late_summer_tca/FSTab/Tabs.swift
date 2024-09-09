import ComposableArchitecture
import SwiftUI

struct Tabs: View {

	private let store: StoreOf<TabsReducer>

	public init(store: StoreOf<TabsReducer>) {
		self.store = store
	}

	public var body: some View {
		HStack {
			ForEach(store.components) { tab in
				TabItem(text: tab.title, active: tab.selected)
					.onTapGesture {
						store.send(.tabSelected(tabId: tab.id))
					}
			}
			.animation(.default, value: store.components)

			Image(systemName: store.favouritesSelected ? "heart.fill" : "heart")
				.onTapGesture {
					store.send(.buttonClicked)
				}
		}
	}

}

#if DEBUG
struct Tabs_Preview: PreviewProvider {

	static var previews: some View {
		example
		example.preferredColorScheme(.dark)
	}

	static var example: some View {
		VStack {
			Tabs(store: .init(
				initialState: .init(
					id: "1",
					components: IdentifiedArray(uniqueElements: [
						TabModel(selected: true, title: "All"),
						TabModel(selected: false, title: "Players"),
						TabModel(selected: false, title: "Teams"),
					]),
					favouritesSelected: false
				),
				reducer: { TabsReducer() }
			))
			Tabs(store: .init(
				initialState: .init(
					id: "2",
					components: IdentifiedArray(uniqueElements: [
						TabModel(selected: true, title: "All"),
						TabModel(selected: false, title: "Players"),
						TabModel(selected: false, title: "Teams"),
					]),
					favouritesSelected: true
				),
				reducer: { TabsReducer() }
			))
		}
	}

}
#endif
