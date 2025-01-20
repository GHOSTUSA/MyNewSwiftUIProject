import SwiftUI

struct AdditemView: View {
    @EnvironmentObject var inventory: Inventory
    
    @State private var name = ""
    @State private var quantity = 1
    @State private var rarity: Rarity = .common
    @State private var type: ItemType = .magic
    @State private var game: Game = .emptyGame
    @State private var isAttaque = false
    @State private var attackStrength: Int = 0

    var body: some View {
        Form {
            Section {
                TextField("Nom de l'objet", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
                Picker("Rareté", selection: $rarity) {
                    ForEach(Rarity.allCases) { rarity in
                        Text(rarity.rawValue).tag(rarity)
                            .foregroundColor(rarity.color)
                    }
                }
            Section {
                Toggle("Objet d'attaque", isOn: $isAttaque)
                
                // Si c'est un objet d'attaque, afficher le Stepper pour la force d'attaque
                if isAttaque {
                    Stepper("Attaque : \(attackStrength)", value: $attackStrength, in: 0...100)
                }
            }
            Section {
                Picker("Jeu", selection: $game) {
                    ForEach(availableGames, id: \.id) { game in
                        Text(game.name).tag(game)
                    }
                }
            }
            
            Section {
                Stepper("Quantité : \(quantity)", value: $quantity, in: 1...100)
            }
                Picker("Type d'objet", selection: $type) {
                    ForEach(ItemType.allCases) { itemType in
                        Text(itemType.rawValue).tag(itemType)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            
            
            Button(action: {
                let newItem = LootItem(
                    name: name,
                    type: type,
                    rarity: rarity,
                    attackStrength: isAttaque ? attackStrength : nil, // Utiliser `attackStrength` seulement si c'est un objet d'attaque
                    game: game
                )
                inventory.addItem(item: newItem)
                name = "" // Réinitialiser le champ de texte après l'ajout
            }) {
                Text("Ajouter")
            }
            .disabled(name.isEmpty)
        }
        .navigationTitle("Ajouter un objet")
    }
}

#Preview {
    AdditemView()
        .environmentObject(Inventory())
}
