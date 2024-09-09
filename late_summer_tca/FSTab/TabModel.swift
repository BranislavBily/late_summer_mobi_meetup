
public struct TabModel: Equatable, Identifiable {
	public var id: String {
		title
	}
	var selected: Bool
	let title: String
}
