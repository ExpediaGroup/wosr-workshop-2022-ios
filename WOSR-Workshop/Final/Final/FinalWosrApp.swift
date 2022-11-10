import SwiftUI

@main
struct FinalWosrApp: App {

    init() {
        Brand.brandA.setup()
    }

    var body: some Scene {
        WindowGroup {
            BrandView()
        }
    }
}
