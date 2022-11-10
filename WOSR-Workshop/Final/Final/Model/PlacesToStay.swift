import Foundation

struct PlacesToStay: Codable {
    let places: Places
}

struct Places: Codable {
    let recentlyViewed, recommendedStays: [Property]

    enum CodingKeys: String, CodingKey {
        case recentlyViewed, recommendedStays
    }
}
