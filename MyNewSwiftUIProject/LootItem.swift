import Foundation
import SwiftUI

// Définition de l'énumération ItemType
enum ItemType: String, CaseIterable, Identifiable {
    case magic = "⭐️"
    case fire = "🔥"
    case ice = "❄️"
    case wind = "💨"
    case poison = "☠️"
    case thunder = "⚡️"
    case dagger = "🗡️"
    case shield = "🛡️"
    case bow = "🏹"
    case ring = "💍"
    case unknown = "🎲"
    
    var id: String { self.rawValue }
}

enum Rarity: String, CaseIterable, Identifiable {
    case common = "Commun"
    case rare = "Rare"
    case legendary = "Légendaire"
    case only9 = "Seulement 9"
    case unique = "Unique"
    
    var id: String { self.rawValue }
    
    // Propriété calculée pour renvoyer une couleur en fonction de la rareté
        var color: Color {
            switch self {
            case .common:
                return .gray
            case .rare:
                return .green
            case .legendary:
                return .yellow
            case .only9:
                return .pink
            case .unique:
                return .orange
            }
        }
    }


// Définition de la structure LootItem
struct LootItem: Identifiable {
    var id = UUID() // Identifiant unique pour chaque objet
    var quantity: Int = 1 // Valeur par défaut à 1
    var name: String
    var type: ItemType
    var rarity: Rarity
    var attackStrength: Int? // Peut être nil si l'attaque n'est pas applicable
    var game: Game

    // Vous pouvez ajouter des méthodes ou des calculs supplémentaires si nécessaire
}
