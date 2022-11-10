import SwiftUI
import UIKit

public class TokensEntryPoint {
  public static var tokensSource: TokensSourceable = TokensSource()
}

// Activate brand and parent brand's tokens to this brand's definitions
public struct DefaultTokenActivator {
  public static func activate() {
   TokensEntryPoint.tokensSource = TokensSource()
  }
}

// Brand token source
struct TokensSource: TokensSourceable {
  let fontTokens: FontTokensSourceable
  let colorTokens: ColorTokensSourceable = ColorTokens()

  init(fontLoader: FontLoader = DefaultFontLoader()) {
    fontTokens = FontTokens(fontLoader: fontLoader)
  }
}

// Font definitions
public protocol FontTokensSourceable {
    var large: Font { get }
    var medium: Font { get }
    var small: Font { get }
    var subText: Font { get }
    var buttonText: Font { get }
}

// Default Font token vlaues for brand
struct FontTokens: FontTokensSourceable {
    let large: Font
    let medium: Font
    let small: Font
    let subText: Font
    let buttonText: Font

    init(fontLoader: FontLoader) {
        self.large = fontLoader.font(size: 20, weight: .regular)
        self.medium = fontLoader.font(size: 12.0, weight: .bold)
        self.small = fontLoader.font(size: 12.0, weight: .regular)
        self.subText = fontLoader.font(size: 12.0, weight: .light)
        self.buttonText = fontLoader.font(size: 12.0, weight: .bold)
    }
}

// Font loader for brand configuration
struct DefaultFontLoader: FontLoader {
  private var customFontProvider: CustomFontProvider?
  init() {
  }
  func font(size: CGFloat, weight: Font.Weight) -> Font {
    return Font.system(size: size, weight: weight)
  }
}

// Default Color definitions
public protocol ColorTokensSourceable {
    var primaryBackground: Color { get }
    var secondaryBackground: Color { get }
    var headingText: Color { get }
    var subText: Color { get }
}

// Color token values for brand
struct ColorTokens: ColorTokensSourceable {
    let primaryBackground = Color("#FFFFFF-#000000", bundle: .tokensDefaultModule)
    let secondaryBackground = Color("#F5F5F5-#000000", bundle: .tokensDefaultModule)
    let headingText = Color("#1F1F1F-#FFFFFF", bundle: .tokensDefaultModule)
    let subText = Color("#1F1F1F-#FFFFFF", bundle: .tokensDefaultModule)
}
