import Foundation

struct Item: Identifiable, Codable {
    var id = UUID()
    var name: String
    var created = Date()
}
