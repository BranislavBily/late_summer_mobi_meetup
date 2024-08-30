struct DataSource {

	private let data: [ListItemModel] = [
		.init(hearted: true, text: "Player1", type: .Player),
		.init(hearted: true, text: "Team1", type: .Team),
		.init(hearted: false, text: "Player2", type: .Player),
		.init(hearted: false, text: "Team2", type: .Team),
		.init(hearted: true, text: "Player3", type: .Player),
	]

	func getData(type: String,_ hearted: Bool) async -> [ListItemModel] {
		try? await Task.sleep(nanoseconds: 1 * 1_000_000_000)

		// Simulate returning some data
		return data.filter { item in
			switch type {
			case "All" where item.hearted == hearted: true

			case "Players" where item.hearted == hearted : item.type == .Player

			case "Teams" where item.hearted == hearted: item.type == .Team

			default: false

			}
		}
	}

}
