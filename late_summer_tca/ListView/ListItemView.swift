import SwiftUI

struct ListItemView: View {

	let model: ListItemModel

	var body: some View {
		Text(model.text)
	}

}
