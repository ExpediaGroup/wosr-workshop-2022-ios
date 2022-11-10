import SwiftUI
import DesignTokens

public enum TextStyle: String {
    case large
    case medium
    case small
    case subText
    case buttonText
}

// TODO: Create a modifier to help style text, use token values.
extension Text {
    public func styleText(with style: TextStyle) -> some View {
        self.modifier(HeadingTextStyle(style: style))
    }
}

struct HeadingTextStyle: ViewModifier {
    var style: TextStyle

    func body(content: Content) -> some View {
        switch style {
        case .large:
            content
            // TODO: add font text for text style
            // TODO: add foreground color for large text style
                .lineLimit(1)
        case .medium:
            content
                .font(Font.medium)
                .foregroundColor(Color.subText)
        case .small:
            content
            // TODO: add font text for text style
                .foregroundColor(Color.subText)
        case .subText:
            content
            // TODO: add font text for text style
                .foregroundColor(Color.headingText)
        case .buttonText:
            content
            // TODO: add font text for text style
                .foregroundColor(Color.headingText)
                .lineLimit(1)
        }
    }
}
