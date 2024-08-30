import SwiftUI

struct ListItemView: View {

	let model: ListItemModel

	var body: some View {
		HStack(spacing: 8) {
			Text(model.text)
			Text("Type is \(model.type.rawValue)")
			Image(systemName: model.hearted ? "heart.fill" : "heart")
		}
		.frame(maxWidth: .infinity, alignment: .leading)
	}

}
