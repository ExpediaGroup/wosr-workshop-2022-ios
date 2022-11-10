import SwiftUI
import UIKit

public extension Color {
     static var primaryBackground: Color {
        return TokensEntryPoint.tokensSource.colorTokens.primaryBackground
    }
     static var secondaryBackground: Color {
        return TokensEntryPoint.tokensSource.colorTokens.secondaryBackground
    }
    static var headingText: Color {
        return TokensEntryPoint.tokensSource.colorTokens.headingText
    }
    static var subText: Color {
        return TokensEntryPoint.tokensSource.colorTokens.subText
    }
}

public extension Font {
    static var large: Font {
        return TokensEntryPoint.tokensSource.fontTokens.large
    }
    static var medium: Font {
        return TokensEntryPoint.tokensSource.fontTokens.medium
    }
    static var small: Font {
        return TokensEntryPoint.tokensSource.fontTokens.small
    }
    static var subText: Font {
        return TokensEntryPoint.tokensSource.fontTokens.subText
    }
    static var buttonText: Font {
        return TokensEntryPoint.tokensSource.fontTokens.buttonText
    }
}

private class CurrentBundleFinder {}
// This is a workaround for a bug that crashes the SwiftUI Preview when leveraging Swift Packages containing resources.

extension Foundation.Bundle {
    static var tokensDefaultModule: Bundle = {
        /* The name of your local package, prepended by "LocalPackages_" for iOS and "PackageName_" for macOS. You may have same PackageName and TargetName*/
        let bundleName = "DesignTokens_DesignTokens"
        let candidates = [
              /* Bundle should be present here when the package is linked into an App. */
              Bundle.main.resourceURL,
              /* Bundle should be present here when the package is linked into a framework. */
              Bundle(for: CurrentBundleFinder.self).resourceURL,
              /* Bundle should be present here when the package is used in UI Tests. */
              Bundle(for: CurrentBundleFinder.self).resourceURL?.deletingLastPathComponent(),
              /* For command-line tools. */
              Bundle.main.bundleURL,
              /* Bundle should be present here when running previews from a different package (this is the path to "…/Debug-iphonesimulator/"). */
              Bundle(for: CurrentBundleFinder.self).resourceURL?.deletingLastPathComponent().deletingLastPathComponent().deletingLastPathComponent(),
              Bundle(for: CurrentBundleFinder.self).resourceURL?.deletingLastPathComponent().deletingLastPathComponent()
        ]
        for candidate in candidates {
            let bundlePath = candidate?.appendingPathComponent(bundleName + ".bundle")
            if let bundle = bundlePath.flatMap(Bundle.init(url:)) {
                return bundle
            }
        }
        fatalError("Unable to load resource bundle for DesignTokens.")
    }()
}
