import ComposableArchitecture
import SwiftUI

struct ListView: View {

	let items: IdentifiedArrayOf<ListItemModel>

	var body: some View {
		List {
			ForEach(items) { item in
				ListItemView(model: item)
			}
		}
		.background(Color.clear)
	}

}
