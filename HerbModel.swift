import Foundation

struct Herb: Identifiable, Codable {
    let id: String
    let name: String
    let scientificName: String
    let uses: [String]
    let properties: String
    let categories: [String]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case scientificName = "scientific_name"
        case uses
        case properties
        case categories
    }
}
