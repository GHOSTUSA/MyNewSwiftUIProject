import SwiftUI

enum Rarity: String, CaseIterable, Identifiable {
    case common = "Commun"
    case rare = "Rare"
    case legendary = "Légendaire"
    case only9 = "Seulement 9"
    case unique = "Unique"
    
    var id: String { self.rawValue }
}

struct AdditemView: View {
    @EnvironmentObject var inventory: Inventory
    
    @State private var name = ""
    @State private var rarity: Rarity = .common
    
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
            }
            
            Button(action: {
                let newItem = "\(name)"
                inventory.addItem(item: newItem)
                name = ""
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
