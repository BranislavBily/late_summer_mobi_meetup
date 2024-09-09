import SwiftUI

struct TabItem: View {

	let text: String
	let active: Bool

	var body: some View {
		Text(text)
			.font(.title3)
			.padding(8)
			.frame(minWidth: 28)
			.foregroundColor(active ? .white : .gray)
			.background(active ? .red : .black)
			.cornerRadius(8)
			.fixedSize(horizontal: true, vertical: false)
	}

}
