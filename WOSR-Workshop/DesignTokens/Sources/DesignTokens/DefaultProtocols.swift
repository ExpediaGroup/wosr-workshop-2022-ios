import SwiftUI
import UIKit

public protocol TokensSourceable {
  var fontTokens: FontTokensSourceable { get }
  var colorTokens: ColorTokensSourceable { get }
}
