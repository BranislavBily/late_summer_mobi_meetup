import ComposableArchitecture
import SwiftUI

struct ListView: View {

	let items: [ListItemModel]

	var body: some View {
		ForEach(items, id: \.self) { item in
			ListItemView(model: item)
		}
	}

}
