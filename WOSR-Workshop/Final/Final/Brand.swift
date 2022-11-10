import DesignTokens

enum Brand: String, CaseIterable {

    case brandA
    case brandB

    func setup() {
        switch self {
        case .brandA:
            BrandATokenActivator.activate()
        case .brandB:
            DefaultTokenActivator.activate()
        }

        TokenConfigurator.initializeTokens(with: TokensEntryPoint.tokensSource)
    }
}
