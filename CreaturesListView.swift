//
//  CreaturesListView.swift
//  CatchEmAll
//
//  Created by Daniel Harris on 24/03/2025.
//

import SwiftUI

struct CreaturesListView: View {
    @State var creatures = Creatures()
    
    var body: some View {
        NavigationStack{
            List(0..<creatures.creaturesArray.count, id: \.self) {index in
                LazyVStack {
                    NavigationLink{
                        DetailView(creature: creatures.creaturesArray[index])
                    } label: {
                        Text("\(index+1).\(creatures.creaturesArray[index].name.capitalized)")
                            .font(.title2)
                    }
                }
                .task{
                    guard let lastCreature = creatures.creaturesArray.last else { return }
                    if creatures.creaturesArray[index].name == lastCreature.name && creatures.urlString.hasPrefix("http") {
                        await creatures.getData()
                        
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Pokémon")
            .toolbar {
                ToolbarItem(placement: .status) {
                    Text("\(creatures.creaturesArray.count) of \(creatures.count) creatures")
                }
            }
            
        }
        .task {
            await creatures.getData()
        }
    }
}

#Preview {
    CreaturesListView()
}
