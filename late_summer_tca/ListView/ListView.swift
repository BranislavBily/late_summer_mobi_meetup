import ComposableArchitecture
import SwiftUI

struct ListView: View {

	let items: IdentifiedArrayOf<ListItemModel>

	var body: some View {
		ForEach(items) { item in
			ListItemView(model: item)
		}
	}

}
