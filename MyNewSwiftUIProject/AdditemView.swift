import SwiftUI

enum Rarity: String, CaseIterable, Identifiable {
    case common = "Commun"
    case rare = "Rare"
    case legendary = "Légendaire"
    
    var id: String { self.rawValue }
}

struct AdditemView: View {
    @State private var name = ""
    @State private var rarity: Rarity = .common
    
    var body: some View {
        Form {
            Section {
                TextField("Nom de l'objet", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Picker("Rarete", selection: $rarity) {
                    ForEach(Rarity.allCases) { rarity in
                        Text(rarity.rawValue).tag(rarity)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            Button(action: {}, label: {
                Text("Ajouter")
            })
        }
        .navigationTitle("Ajouter un objet")
    }
}

#Preview {
    AdditemView()
}
