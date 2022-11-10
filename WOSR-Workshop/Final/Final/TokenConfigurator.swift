import DesignTokens

public class TokenConfigurator {
    public static func initializeTokens(with source: TokensSourceable) {
        TokensEntryPoint.tokensSource = source
    }
}
