import SwiftUI
import DesignTokens

public enum TextStyle: String {
    case large
    case medium
    case small
    case subText
    case buttonText
}

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
                .font(Font.large)
                .foregroundColor(Color.headingText)
                .lineLimit(1)
        case .medium:
            content
                .font(Font.medium)
                .foregroundColor(Color.subText)
        case .small:
            content
                .font(Font.small)
                .foregroundColor(Color.subText)
        case .subText:
            content
                .font(Font.subText)
                .foregroundColor(Color.headingText)
        case .buttonText:
            content
                .font(Font.buttonText)
                .foregroundColor(Color.headingText)
                .lineLimit(1)
        }
    }
}
