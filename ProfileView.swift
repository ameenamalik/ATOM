import Foundation

struct ProfileView: Identifiable {
    var id = UUID()
    var name: String
    var bio: String
    var image: String // Assuming you have images named in your assets
}
