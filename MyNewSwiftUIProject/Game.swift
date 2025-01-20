import Foundation
import SwiftUI

enum GameGenre {
    case mmorpg, rpg, looter, fps, tps, strategy, unset
}

struct Game: Identifiable, Hashable {
    let name: String
    let id: UUID = UUID()
    let genre: GameGenre
    let coverName: String? // Nom de l'image associée au jeu
    
    static var emptyGame = Game(name: "", genre: .unset, coverName: nil)
}

let availableGames = [
    Game(name: "Halo", genre: .fps, coverName: "https://images.igdb.com/igdb/image/upload/t_cover_big/co2qtv.webp"),
    Game(name: "Résistance", genre: .fps, coverName: "https://images.igdb.com/igdb/image/upload/t_cover_big/co2b4m.webp"),
    Game(name: "Killzone", genre: .fps, coverName: "https://images.igdb.com/igdb/image/upload/t_cover_big/co3j9z.webp"),
    Game(name: "Legendary", genre: .fps, coverName: "https://images.igdb.com/igdb/image/upload/t_cover_big/co2gib.webp"),
    Game(name: "Bioshock", genre: .fps, coverName: "https://images.igdb.com/igdb/image/upload/t_cover_big/co54xg.webp")
]
