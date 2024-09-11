import SwiftUI

struct ListItemView: View {

	let model: ListItemModel

	var body: some View {
		HStack(spacing: 8) {
			Image(systemName: model.type == .Player ? "person.fill" : "figure.2.and.child.holdinghands")
				.frame(width: 24, height: 24)
			Text(model.text)
			Image(systemName: model.hearted ? "heart.fill" : "heart")
				.frame(maxWidth: .infinity, alignment: .trailing)
		}
		.frame(maxWidth: .infinity, alignment: .leading)
	}

}
