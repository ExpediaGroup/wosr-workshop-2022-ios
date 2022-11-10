import Foundation
import Combine

class PlaceToStayViewModel: ObservableObject {

    private var cancellables = Set<AnyCancellable>()
    @Published private var placesToStay: PlacesToStay?

    private let loadingPlaces = Array(repeating: Property(name: "Hotel beach",
                                                          rating: "very good",
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
            // TODO: Refactor this using combine modifiers.
            .delay(for: 0.2, scheduler: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                }
            }, receiveValue: { [weak self] place in
                self?.placesToStay = place
        })
        .store(in: &cancellables)

    }
}
