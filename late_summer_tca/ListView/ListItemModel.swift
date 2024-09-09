public struct ListItemModel: Identifiable, Equatable {
	public var id: String {
		text
	}
	let hearted: Bool
	let text: String
	let type: ItemType
}
