import SwiftUI

class HerbViewModel: ObservableObject {
    @Published var herbs: [Herb] = []
    @Published var selectedHerb: Herb?
    @Published var searchText = ""
    @Published var selectedCategory: String?
    
    // Sample data
    init() {
        herbs = [
            Herb(id: "chamomile",
                 name: "Chamomile",
                 scientificName: "Matricaria chamomilla",
                 uses: ["Sleep aid", "Digestive health", "Anti-inflammatory"],
                 properties: "Calming and soothing herb with anti-inflammatory properties",
                 categories: ["calming", "digestive", "medicinal"]),
            
            Herb(id: "cinnamon",
                 name: "Cinnamon",
                 scientificName: "Cinnamomum verum",
                 uses: ["warming energy", "love drawing", "sacred fire", "vitality"],
                 properties: "Hot, sweet, moving, activating",
                 categories: ["warming", "spice", "love", "sacred"]),
            
            Herb(id: "ginger",
                 name: "Ginger",
                 scientificName: "Zingiber officinale",
                 uses: ["sacred fire", "passion awakening", "energy movement", "grounding"],
                 properties: "Hot, spicy, moving, energizing",
                 categories: ["warming", "root", "movement", "sacred"])
        ]
    }
    
    var filteredHerbs: [Herb] {
        herbs.filter { herb in
            let matchesSearch = searchText.isEmpty || 
                herb.name.localizedCaseInsensitiveContains(searchText) ||
                herb.scientificName.localizedCaseInsensitiveContains(searchText)
            
            let matchesCategory = selectedCategory == nil ||
                herb.categories.contains(selectedCategory!)
            
            return matchesSearch && matchesCategory
        }
    }
    
    var categories: [String] {
        Array(Set(herbs.flatMap { $0.categories })).sorted()
    }
}
