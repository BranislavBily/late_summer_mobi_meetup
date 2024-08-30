import ComposableArchitecture
import SwiftUI

struct FSTab: View {

	private let store: StoreOf<FSTabReducer>

	public init(store: StoreOf<FSTabReducer>) {
		self.store = store
	}

	public var body: some View {
		HStack {
			ForEach(store.components) { tab in
				Tab(text: tab.title, active: tab.selected)
					.onTapGesture {
						store.send(.tabSelected(tabId: tab.id))
					}
			}
			
			Image(systemName: store.favouritesSelected ? "heart.fill" : "heart")
				.onTapGesture {
					store.send(.buttonClicked)
				}
		}
	}

}

#if DEBUG
struct Tabs_Secondary_Preview: PreviewProvider {

	static var previews: some View {
		example
		example.preferredColorScheme(.dark)
	}

	static var example: some View {
		VStack {
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
			FSTab(store: .init(
				initialState: .init(
					components: IdentifiedArray(uniqueElements: [
						FSTabModel(id: "1", selected: true, title: "All"),
						FSTabModel(id: "2", selected: false, title: "Players"),
						FSTabModel(id: "3", selected: false, title: "Teams"),
					]),
					favouritesSelected: true
				),
				reducer: { FSTabReducer() }
			))
		}
	}

}
#endif
