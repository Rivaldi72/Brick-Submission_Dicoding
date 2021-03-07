import Foundation

public struct GameDomainModel: Equatable, Identifiable {
    public let id: Int
    public let name: String
    public let released: String
    public let backgroundImage: String
    public let rating: Double
    public let ratingTop: Int
    public var show: Bool
    public var isFavorite: Bool
    //  let genre: []
    
    public init(id: Int, name: String, released: String, backgroundImage: String, rating: Double, ratingTop: Int, show: Bool, isFavorite: Bool) {
        self.id = id
        self.name = name
        self.released = released
        self.backgroundImage = backgroundImage
        self.rating = rating
        self.ratingTop = ratingTop
        self.show = show
        self.isFavorite = isFavorite
    }
}
