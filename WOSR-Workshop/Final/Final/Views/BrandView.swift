import SwiftUI
import DesignTokens

struct BrandView: View {
    @State private var chosenBrand: Brand = Brand.brandA
    var brands = Brand.allCases

    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Choose your brand",
                           selection: $chosenBrand.onChange(brandSelected)) {
                        ForEach(brands, id: \.self) {
                            Text($0.rawValue).tag($0.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)
                }

                NavigationLink(
                    destination: TripView(brand: chosenBrand),
                    label: {
                        Text("See your trips with \(chosenBrand.rawValue) styling")
                    }
                )
            }
            .frame(maxWidth: .infinity)
            .navigationTitle("Brands")
        }
        .frame(maxWidth: .infinity)
    }

    /// Activate tokens and set up styling for rest of the app
    private func brandSelected(to value: Brand) {
            chosenBrand.setup()
       }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BrandView()
    }
}
