import Foundation
import Combine

class PlaceToStayViewModel: ObservableObject {

    private var cancellables = Set<AnyCancellable>()
    @Published private var placesToStay: PlacesToStay?

    private let loadingPlaces = Array(repeating: Property(name: "Hotel beach",
                                                          nameFontStyle: "medium",
                                                          rating: "very good",
                                                          ratingFontStyle: "medium",
                                                          image: "stay1"), count: 3)

    var isLoading: Bool {
        return placesToStay == nil
    }

    var recommendedStays: [Property] {
        placesToStay?.places.recommendedStays ?? loadingPlaces
    }

    var recentlyViewed: [Property] {
        placesToStay?.places.recentlyViewed ?? loadingPlaces
    }

    func getPlacesToStay() {
        Bundle.main.decodeable(fileName: "places_to_stay.json")
            .delay(for: 0.2, scheduler: DispatchQueue.main) // fake async call
            .replaceError(with: nil) // this is a programming error if it fails in this case, so ignore
            .assign(to: &$placesToStay)

            // MARK: INTERACTIVE - refactor?
//            .sink(receiveCompletion: { completion in
//                switch completion {
//                case .finished:
//                    break
//                case .failure(let error):
//                    print("Error: \(error.localizedDescription)")
//                }
//            }, receiveValue: { (place: PlaceToStay) [weak self] in
//                self?.placesToStay = place
//        })
//        .store(in: &cancellables)

    }
}
