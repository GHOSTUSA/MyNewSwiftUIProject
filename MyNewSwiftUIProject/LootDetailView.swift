import SwiftUI

struct LootDetailView: View {
    var item: LootItem  // Le paramètre item de type LootItem
    
    var body: some View {
        VStack {
            Text(item.type.rawValue)
                            .font(.system(size: 78))
                            .foregroundColor(item.rarity.color)
                            .padding()
                            .background(item.rarity.color.opacity(0.2))
                            .cornerRadius(12)
                            .shadow(radius: 10)
            Text(item.name)
                .font(.largeTitle)
                .padding()
            
            Text("Rareté: \(item.rarity.rawValue)")
                .foregroundColor(item.rarity.color)
            
            if let attackStrength = item.attackStrength {
                Text("Force d'attaque: \(attackStrength)")
            }
            
            Text("Jeu: \(item.game.name.isEmpty ? "Inconnu" : item.game.name)")
        }
        .navigationTitle(item.name)
    }
}

#Preview {
    LootDetailView(item: LootItem(name: "M6D Pistol", type: .magic, rarity: .common, attackStrength: 10, game: .emptyGame))
}

