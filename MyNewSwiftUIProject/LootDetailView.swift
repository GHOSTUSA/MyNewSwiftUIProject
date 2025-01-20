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
            //Text(item.name)
             //   .font(.largeTitle)
              //  .padding()
            
            Form {
                Section(header: Text("INFORMATIONS")) {
                    HStack {
                        // Colonne 1 : Image
                        if let coverName = item.game.coverName, let url = URL(string: coverName) {
                            AsyncImage(url: url) { phase in
                                switch phase {
                                case .empty:
                                    ProgressView()
                                        .progressViewStyle(CircularProgressViewStyle())
                                case .success(let image):
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100, height: 100) // Taille de l'image
                                        .cornerRadius(10)
                                        .padding(.trailing, 10) // Espacement à droite
                                case .failure:
                                    Text("Image non disponible") // Si l'image ne se charge pas
                                        .font(.headline)
                                        .foregroundColor(.gray)
                                        .frame(width: 100, height: 100) // Taille fixe
                                        .background(Color.gray.opacity(0.2))
                                        .cornerRadius(10)
                                        .padding(.trailing, 10)
                                @unknown default:
                                    EmptyView()
                                }
                            }
                        } else {
                            // Si pas de coverName (URL), afficher une image de remplacement
                            Text("Image non disponible")
                                .font(.headline)
                                .foregroundColor(.gray)
                                .frame(width: 100, height: 100) // Taille fixe
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(10)
                                .padding(.trailing, 10)
                        }
                        
                        // Colonne 2 : Texte
                        VStack(alignment: .leading) {
                            Text("\(item.game.name.isEmpty ? "Inconnu" : item.game.name)")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        .padding(.vertical) // Ajout de l'espacement vertical pour la colonne de texte
                    }
                    .padding() // Padding général pour le HStack
                }
                
                
                Text("\(item.rarity.rawValue)")
                    .foregroundColor(item.rarity.color)
                
                if let attackStrength = item.attackStrength {
                    Text("Force d'attaque: \(attackStrength)")
                }
                
                Text("Quantité : \(item.quantity)")
                
            }
        }
        .navigationTitle(item.name)
    }
}

#Preview {
    LootDetailView(item: LootItem(name: "M6D Pistol", type: .magic, rarity: .common, attackStrength: 10, game: .emptyGame))
}
