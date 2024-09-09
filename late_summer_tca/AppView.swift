import ComposableArchitecture
import SwiftUI

struct AppView: View {

	private let store: StoreOf<AppReducer>

	public init(store: StoreOf<AppReducer>) {
		self.store = store
	}

    var body: some View {
		VStack(spacing: 16) {
			Tabs(store: store.scope(state: \.tabs, action: \.tabs))
			ListView(items: store.listItems)
        }
		.frame(alignment: .top)
        .padding()
		.task { await store.send(.start).finish() }
    }
}
