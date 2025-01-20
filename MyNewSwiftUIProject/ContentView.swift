import SwiftUI

class Inventory: ObservableObject {
    @Published var loot = ["Epée", "Bouclier", "Armure"]
    
    func addItem(item: String) {
        loot.append(item)
    }
}

struct ContentView: View {
    @StateObject var inventory = Inventory()
    
    @State var showAddItemView = false

    var body: some View {
        NavigationStack {
            List {
                Button(action: {
                    inventory.addItem(item: "Magie de feu")
                }, label: {
                    Text("Ajouter")
                })
                ForEach(inventory.loot, id: \.self) { item in
                    Text(item)
                }
            }
            .navigationTitle("Loot")
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
