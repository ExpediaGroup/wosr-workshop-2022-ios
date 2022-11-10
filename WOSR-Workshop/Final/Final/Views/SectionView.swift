import SwiftUI

struct SectionView: View {
    let sectionName: Text
    let places: [Property]
    let isLoading: Bool

    var body: some View {
        VStack(alignment: .leading) {
            sectionName
                .styleText(with: .large)// MARK: INTERACTIVE a styling modifier for section text
                .padding(.leading, 10)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 6.0) {
                    ForEach(places) { place in
                        // MARK: INTERACTIVE lets abstract this logic to into a "cell"
                        propertyView(place, isLoading: isLoading)
//                                                VStack(alignment: .leading) {
//                                                    RoundedImage(imageName: place.image)
//                                                    Text(place.name)
//                                                        .styleText(with: .medium)
//                                                    Text(place.rating)
//                                                        .styleText(with: .small)
//                                                }
//                                                .frame(width: 120)
//                                                .redacted(reason: isLoading ? .placeholder : [])
                    }
                }
                .padding(.leading, 10)
            }
            .frame(maxWidth: .infinity, maxHeight: 200)
        }
    }

    @ViewBuilder
    private func propertyView(_ place: Property, isLoading: Bool = false) -> some View {
        VStack(alignment: .leading) {
            RoundedImage(imageName: place.image)
            VStack(alignment: .leading) {
                Text(place.name)
                // MARK: Interactive show the tokens and how we can customize the json. (SDUI principals here)
                    .styleText(with: place.nameTextStyle)
                Text(place.rating)
                    .styleText(with: place.ratingTextStyle)
            }

            .accessibility(sortPriority: 1)
        }
        .frame(width: 120)
        .redacted(reason: isLoading ? .placeholder : [])
        .accessibilityElement(children: .contain)
    }
}

struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        SectionView(sectionName: Text("Recently viewed"), places: recentlyViewed, isLoading: false)
        SectionView(sectionName: Text("Recommended stays"), places: recommendedStays, isLoading: false)
    }
}
