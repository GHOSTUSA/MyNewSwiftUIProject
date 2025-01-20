import SwiftUI

struct AdditemView: View {
    @EnvironmentObject var inventory: Inventory
    
    @State private var name = ""
    @State private var rarity: Rarity = .common
    @State private var type: ItemType = .magic // Choisir un type par défaut pour l'exemple
    @State private var game: Game = .emptyGame // Jeu par défaut

    var body: some View {
        Form {
            Section {
                TextField("Nom de l'objet", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Picker("Rareté", selection: $rarity) {
                    ForEach(Rarity.allCases) { rarity in
                        Text(rarity.rawValue).tag(rarity)
                    }
                }
                
                Picker("Type d'objet", selection: $type) {
                    ForEach(ItemType.allCases) { itemType in
                        Text(itemType.rawValue).tag(itemType)
                    }
                }
            }
            
            Button(action: {
                let newItem = LootItem(
                    name: name,
                    type: type,
                    rarity: rarity,
                    attackStrength: nil, // Vous pouvez ajuster la force d'attaque selon le type
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
