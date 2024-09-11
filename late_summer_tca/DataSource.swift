struct DataSource {

	private let data: [ListItemModel] = [
		.init(hearted: true, text: "Lionel Messi", type: .Player),
		.init(hearted: true, text: "FC Barcelona", type: .Team),
		.init(hearted: false, text: "Cristiano Ronaldo", type: .Player),
		.init(hearted: false, text: "Tatran Prešov", type: .Team),
		.init(hearted: true, text: "Erling Haaland", type: .Player),
	]

	func getData(type: String, _ hearted: Bool) async -> [ListItemModel] {
		try? await Task.sleep(nanoseconds: 1 * 250_000_000)

		return data.filter { item in
			switch type {
			case "All" where item.hearted == hearted || !hearted: true

			case "Players" where item.hearted == hearted || !hearted: item.type == .Player

			case "Teams" where item.hearted == hearted || !hearted: item.type == .Team

			default: false
			}
		}
	}

}
