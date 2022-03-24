import Foundation

struct DogBreed: Codable {
    let name: String
    let temperament: String?
    let image: Image

    // Non-json properties
    var imageData: Data?
}

struct Image: Codable {
    let id: String
    let url: String
    let height: Int?
    let width: Int?
}
