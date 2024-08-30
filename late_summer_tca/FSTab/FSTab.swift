import ComposableArchitecture
import SwiftUI


struct FSTab: View {

	private let store: StoreOf<FSTabReducer>

	public init(store: StoreOf<FSTabReducer>) {
		self.store = store
	}

	public var body: some View {
		HStack(spacing: 8) {
			WithPerceptionTracking {
				ForEach(store.components) { tab in
					Tab(text: tab.title, active: tab.selected)
						.onTapGesture {
							store.send(.tabSelected(tabId: tab.id))
						}
				}

//				Atoms.NavigationBar.Item(model: .init(type: .favoritesEditOrder, action: {
//					store.send(.buttonClicked)
//				}))
//				.foregroundColor(.fs.contentTertiary)
//				.padding(.trailing, 16)
//				.padding(.vertical, 16)
//				.tag(Tag.actionButton)
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
		EmptyView()
	}

}
#endif
