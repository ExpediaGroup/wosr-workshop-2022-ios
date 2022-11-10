import Foundation
import SwiftUI

// Brand token source
struct BrandATokenSource: TokensSourceable {
    let fontTokens: FontTokensSourceable
    let colorTokens: ColorTokensSourceable = BrandAColorTokens()

    init(fontLoader: FontLoader = BrandAFontLoader()) {
        fontTokens = BrandAFontTokens(fontLoader: fontLoader)
    }
}

// Activate brand and parent brand's tokens to this brand's definitions
public struct BrandATokenActivator {
    public static func activate() {
        TokensEntryPoint.tokensSource = BrandATokenSource()
    }
}

// Color token values for brand
struct BrandAColorTokens: ColorTokensSourceable {
    let primaryBackground = Color("#F5F5F5-#0B4256", bundle: .tokensDefaultModule)
    let secondaryBackground = Color("##F5F5F5-#000000", bundle: .tokensDefaultModule)
    let headingText = Color("#0D7066-#BAEBB1", bundle: .tokensDefaultModule)
    let subText = Color("#1F1F1F-#FFFFFF", bundle: .tokensDefaultModule)
}

// Font loader for brand configuration
struct BrandAFontLoader: FontLoader {
    func font(size: CGFloat, weight: Font.Weight) -> Font {
        return Font.system(size: size, weight: weight)
    }
}

// Font token vlaues for brand
struct BrandAFontTokens: FontTokensSourceable {
    let large: Font
    let medium: Font
    let small: Font
    let subText: Font
    let buttonText: Font

    init(fontLoader: FontLoader) {
        self.large = fontLoader.font(size: 20, weight: .black)
        self.medium = fontLoader.font(size: 12.0, weight: .bold)
        self.small = fontLoader.font(size: 12.0, weight: .ultraLight)
        self.subText = fontLoader.font(size: 12.0, weight: .light)
        self.buttonText = fontLoader.font(size: 12.0, weight: .bold)
    }
}
