import Foundation

struct Property: Codable, Identifiable {
    let id = UUID()
    let name, nameFontStyle, rating, ratingFontStyle, image: String

    private enum CodingKeys: String, CodingKey {
        case name, nameFontStyle, rating, ratingFontStyle, image
    }

    var nameTextStyle: TextStyle {
        return TextStyle(rawValue: nameFontStyle) ?? .medium
    }

    var ratingTextStyle: TextStyle {
        return TextStyle(rawValue: ratingFontStyle) ?? .medium
    }
}
