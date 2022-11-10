import Combine
import DesignTokens
import SwiftUI

struct TripView: View {
    @StateObject var viewModel: PlaceToStayViewModel = PlaceToStayViewModel()
    let brand: Brand
    @State var darkToggle = false

    var body: some View {

        NavigationView {
            VStack(alignment: .leading) {
                Toggle(isOn: $darkToggle) {
                    Text("Dark mode switcher")
                }
                Spacer()
                // TODO: Refactor this block to make it reusable and easier to read --START--
                VStack(alignment: .leading) {
                    Text("Recently Viewed")
                        .styleText(with: .large)
                        .padding(.leading, 10)

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 6.0) {

                            ForEach(viewModel.recentlyViewed) { place in
                                VStack(alignment: .leading) {
                                    RoundedImage(imageName: place.image)
                                    Text(place.name)
                                        .styleText(with: .medium)
                                    Text(place.rating)
                                        .styleText(with: .small)
                                }
                                .frame(width: 120)
                                .redacted(reason: viewModel.isLoading ? .placeholder : [])
                            }
                        }
                        .padding(.leading, 10)

                    }
                    .frame(maxWidth: .infinity, maxHeight: 200)
                }

                VStack(alignment: .leading) {

                    Text("Recommended stays")
                        .styleText(with: .large)
                        .padding(.leading, 10)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 6.0) {

                            ForEach(viewModel.recommendedStays) { place in
                                VStack(alignment: .leading) {
                                    RoundedImage(imageName: place.image)
                                    Text(place.name)
                                        .styleText(with: .medium)
                                    Text(place.rating)
                                        .styleText(with: .small)
                                }
                                .frame(width: 120)
                                .redacted(reason: viewModel.isLoading ? .placeholder : [])
                            }
                        }
                        .padding(.leading, 10)
                    }
                    .frame(maxWidth: .infinity, maxHeight: 200)
                }
                // TODO: Refactor this block to make it reusable and easier to read --END--
            }
            .navigationBarTitle("Find A Place To Stay")
            .navigationBarTitleTextColor(Color.headingText)
            .frame(maxHeight: .infinity)
            .padding()
            .background(Color.primaryBackground)
        }
        .navigationBarTitle(Text(""), displayMode: .inline)
        .onAppear {
            viewModel.getPlacesToStay()
        }
        .preferredColorScheme(darkToggle ? .dark : .light)
    }
}

struct TripView_Previews: PreviewProvider {

    static var previews: some View {
        TripView(brand: .brandA)
        TripView(brand: .brandB)
    }
}
