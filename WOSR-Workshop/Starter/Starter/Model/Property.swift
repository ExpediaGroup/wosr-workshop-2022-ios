import Foundation

struct Property: Codable, Identifiable {
    var id: UUID { UUID() }
    let name, rating, image: String
//    nameFontStyle, ratingFontStyle
    private enum CodingKeys: String, CodingKey {
        case name, rating, image
    }

// TODO: Add new field to places_to_stay.json to include "styles" --ADVANCED--
//    var nameTextStyle: TextStyle {
//        return TextStyle(rawValue: nameFontStyle) ?? .medium
//    }
//
//    var ratingTextStyle: TextStyle {
//        return TextStyle(rawValue: ratingFontStyle) ?? .medium
//    }
}
