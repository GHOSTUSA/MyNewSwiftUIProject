import SwiftUI

class Inventory: ObservableObject {
    @Published var loot: [LootItem]
      
    init() {
        loot = [
            // Halo
            LootItem(name: "M6D Pistol", type: .magic, rarity: .common, attackStrength: 10, game: availableGames.first(where: { $0.name == "Halo" }) ?? .emptyGame),
            LootItem(name: "Energy Sword", type: .wind, rarity: .legendary, attackStrength: 50, game: availableGames.first(where: { $0.name == "Halo" }) ?? .emptyGame),
            LootItem(name: "Battle Rifle", type: .fire, rarity: .rare, attackStrength: 25, game: availableGames.first(where: { $0.name == "Halo" }) ?? .emptyGame),
            
            // Bioshock
            LootItem(name: "Wrench", type: .magic, rarity: .common, attackStrength: 15, game: availableGames.first(where: { $0.name == "Bioshock" }) ?? .emptyGame),
            LootItem(name: "Shotgun", type: .fire, rarity: .rare, attackStrength: 40, game: availableGames.first(where: { $0.name == "Bioshock" }) ?? .emptyGame),
            LootItem(name: "Machine Gun", type: .ice, rarity: .common, attackStrength: 20, game: availableGames.first(where: { $0.name == "Bioshock" }) ?? .emptyGame),
            
            // Killzone
            LootItem(name: "StA-52 Assault Rifle", type: .fire, rarity: .common, attackStrength: 30, game: availableGames.first(where: { $0.name == "Killzone" }) ?? .emptyGame),
            LootItem(name: "M82 Sniper Rifle", type: .thunder, rarity: .legendary, attackStrength: 70, game: availableGames.first(where: { $0.name == "Killzone" }) ?? .emptyGame),
            LootItem(name: "Machete", type: .poison, rarity: .rare, attackStrength: 10, game: availableGames.first(where: { $0.name == "Killzone" }) ?? .emptyGame),
            
            // Résistance
            LootItem(name: "M4A1 Carbine", type: .fire, rarity: .common, attackStrength: 35, game: availableGames.first(where: { $0.name == "Résistance" }) ?? .emptyGame),
            LootItem(name: "Auger", type: .ice, rarity: .legendary, attackStrength: 60, game: availableGames.first(where: { $0.name == "Résistance" }) ?? .emptyGame),
            LootItem(name: "Splicer", type: .thunder, rarity: .rare, attackStrength: 45, game: availableGames.first(where: { $0.name == "Résistance" }) ?? .emptyGame),

            // Legendary
            LootItem(name: "Laser Rifle", type: .fire, rarity: .common, attackStrength: 25, game: availableGames.first(where: { $0.name == "Legendary" }) ?? .emptyGame),
            LootItem(name: "Gravity Hammer", type: .wind, rarity: .legendary, attackStrength: 80, game: availableGames.first(where: { $0.name == "Legendary" }) ?? .emptyGame),
            LootItem(name: "Sword of Justice", type: .magic, rarity: .unique, attackStrength: 100, game: availableGames.first(where: { $0.name == "Legendary" }) ?? .emptyGame)

        ]
    }
    
    func addItem(item: LootItem) {
        loot.append(item)
    }
}

struct ContentView: View {
    @StateObject var inventory = Inventory()
    @State var showAddItemView = false

    var body: some View {
        NavigationStack {
            List {
                ForEach(inventory.loot) { item in
                    NavigationLink {
                        LootDetailView(item: item)
                    } label: {
                        VStack(alignment: .leading) {
                            HStack {
                                // Colonne gauche : Informations
                                VStack(alignment: .leading) {
                                    Text(item.name)
                                        .font(.headline)
                                    Text("Type: \(item.type.rawValue)")
                                    Text("\(item.rarity.rawValue)")
                                        .foregroundColor(item.rarity.color)
                                    
                                    if let attackStrength = item.attackStrength {
                                        Text("Attaque: \(attackStrength)")
                                    }
                                }
                                
                                Spacer() // Un espace qui pousse le contenu suivant vers la droite
                                
                                // Colonne droite : Informations sur le jeu et nom
                                VStack(alignment: .trailing) {
                                    Text("\(item.game.name.isEmpty ? "Inconnu" : item.game.name)")
                                        .font(.headline)
                                        .frame(maxWidth: .infinity, alignment: .trailing) // Aligner à droite
                                }
                            }
                            .padding()
                        }
                    }
                }
            }
            .navigationTitle("Armes")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showAddItemView.toggle()
                    }) {
                        Image(systemName: "plus.circle.fill")
                    }
                }
            }
            .sheet(isPresented: $showAddItemView) {
                AdditemView()
                    .environmentObject(inventory)
            }
        }
    }
}

#Preview {
    ContentView()
}
