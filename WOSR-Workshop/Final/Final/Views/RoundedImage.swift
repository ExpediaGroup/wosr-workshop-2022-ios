import SwiftUI

struct RoundedImage: View {
    let imageName: String
    @State var isSelected: Bool = false

    var body: some View {
        ZStack(alignment: .topTrailing) {
            Image(imageName)
                .resizable()
                .scaledToFill() /// same as effect .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 100)
                .cornerRadius(radius: 8.0, corners: .allCorners)
                .accessibilityHidden(true)
            favorite
                .cornerRadius(radius: 8.0, corners: .topRight)
        }
    }

    @ViewBuilder
    private var favorite: some View {
        Toggle(isOn: $isSelected, label: { })
            .toggleStyle(FavoriteToggleStyle())
            .onTapGesture {
                isSelected.toggle()
            }
    }
}

/// Create a toggle style to extend the toggle class.
private struct FavoriteToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        favoriteIcon(configuration: configuration)
        .frame(width: 24, height: 24, alignment: .topLeading)
    }

    @ViewBuilder
    private func favoriteIcon(configuration: Configuration) -> some View {
        if configuration.isOn {
            selectedFavoriteIcon
        } else {
            unselectedFavoriteIcon
        }
    }

    private var selectedFavoriteIcon: some View {
        Image("favorite")
            .frame(width: 24, height: 24, alignment: .center)
            .foregroundColor(Color.red) /// some token colors here!
            .accessibilityLabel("Remove from favourites")
    }

    private var unselectedFavoriteIcon: some View {
       Image("empty_heart")
            .frame(width: 24, height: 24, alignment: .center)
            .foregroundColor(Color.red)
            .accessibilityLabel("Add to favourites")
    }
}

struct RoundedImage_Previews: PreviewProvider {
    static var previews: some View {
        RoundedImage(imageName: "stay1")
    }
}
