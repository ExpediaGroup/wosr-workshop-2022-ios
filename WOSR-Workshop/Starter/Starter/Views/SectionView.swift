import SwiftUI

struct SectionView: View {
    let sectionName: Text
    let places: [Property]
    let isLoading: Bool

    var body: some View {
        VStack(alignment: .leading) {
            sectionName
                .styleText(with: .large)// TODO: INTERACTIVE create a styling modifier for reuse and ease.
                .padding(.leading, 10)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 6.0) {
                    ForEach(places) { place in
                        // TODO: START lets refactor this logic to into a "cell"
                        VStack(alignment: .leading) {
                            RoundedImage(imageName: place.image)
                            Text(place.name)
                                .styleText(with: .medium)
                            Text(place.rating)
                                .styleText(with: .small)
                        }
                        .frame(width: 120)
                        .redacted(reason: isLoading ? .placeholder : [])
                        // TODO: END
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
                // TODO: use tokens and modifiers to customize this... --SIMPLE--
                // TODO: use tokens with modifier but do this using SDUI --ADVANCED--
                Text(place.name)
                Text(place.rating)
            }
            // TODO: set accessibility priorities
        }
        .frame(width: 120)
        .redacted(reason: isLoading ? .placeholder : [])
        // TODO: group accessibility elements correctly
    }
}

struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        SectionView(sectionName: Text("Recently viewed"), places: recentlyViewed, isLoading: false)
        SectionView(sectionName: Text("Recommended stays"), places: recommendedStays, isLoading: false)
    }
}
