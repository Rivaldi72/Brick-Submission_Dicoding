import Foundation
import SwiftUI

public struct GamesResponse: Codable {
    let results: [GameResponse]
    
    enum CodingKeys: String, CodingKey {
        case results = "results"
    }
}

public struct GameResponse: Codable {
    let name: String?
    let released: String?
    let backgroundImage: String?
    let rating: Double?
    let ratingTop, id: Int?
    let clip: Clip?
    let saturatedColor, dominantColor: String?
    let shortScreenshots: [ShortScreenshot]?
    let parentPlatforms: [ParentPlatform]?
    let genres: [Genre]?
    
    enum CodingKeys: String, CodingKey {
        case name, released
        case backgroundImage = "background_image"
        case rating
        case ratingTop = "rating_top"
        case id, clip
        case saturatedColor = "saturated_color"
        case dominantColor = "dominant_color"
        case shortScreenshots = "short_screenshots"
        case parentPlatforms = "parent_platforms"
        case genres
    }
}

public struct Clip: Codable {
    let clip: String?
    let clips: Clips?
    let video: String?
    let preview: String?
}

public struct Clips: Codable {
    let the320, the640, full: String?
    
    enum CodingKeys: String, CodingKey {
        case the320 = "320"
        case the640 = "640"
        case full
    }
}

public struct Genre: Codable {
    let id: Int
    let name, slug: String?
}

public struct ParentPlatform: Codable {
    let platform: Genre?
}

public struct ShortScreenshot: Codable {
    let id: Int
    let image: String?
}
