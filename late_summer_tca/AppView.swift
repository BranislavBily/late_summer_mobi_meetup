import ComposableArchitecture
import SwiftUI

struct AppView: View {

	private let store: StoreOf<AppReducer>

	public init(store: StoreOf<AppReducer>) {
		self.store = store
	}

    var body: some View {
        VStack {
			FSTab(store: store.scope(state: \.tabs, action: \.tabs))
			ListView(items: store.listItems)
        }
        .padding()
    }
}
