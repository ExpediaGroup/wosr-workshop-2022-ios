import SwiftUI

@main
struct StarterApp: App {

    init() {
        Brand.brandA.setup()
    }

    var body: some Scene {
        WindowGroup {
            BrandView()
        }
    }
}
