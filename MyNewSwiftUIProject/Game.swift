import Foundation

enum GameGenre {
    case mmorpg, rpg, looter, fps, tps, strategy, unset
}

struct Game: Identifiable, Hashable {
    let name: String
    let id: UUID = UUID()
    let genre: GameGenre
    let coverName : String?
    
    static var emptyGame = Game(name: "", genre: .unset, coverName: nil)
}

// Hesitez pas mettre vos propres jeux dans la liste
let availableGames = [
    Game(name: "Halo", genre: .fps, coverName: nil),
    Game(name: "Résistance", genre: .fps, coverName: nil),
    Game(name: "Killzone", genre: .fps, coverName: nil),
    Game(name: "Legendary", genre: .fps, coverName: nil),
    Game(name: "Bioshock", genre: .fps, coverName: nil)
]
