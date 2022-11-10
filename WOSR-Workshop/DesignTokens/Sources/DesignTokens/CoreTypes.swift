import Foundation
import SwiftUI

public protocol FontLoader {
    func font(size: CGFloat, weight: Font.Weight) -> Font
}

public protocol CustomFontProvider {
    var boldFont: String { get }
    var lightFont: String { get }
    var mediumFont: String { get }
    var regularFont: String { get }
    func font(weight: Font.Weight) -> String
}
