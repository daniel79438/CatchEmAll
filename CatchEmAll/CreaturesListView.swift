//
//  CreaturesListView.swift
//  CatchEmAll
//
//  Created by Daniel Harris on 24/03/2025.
//

import SwiftUI

struct CreaturesListView: View {
    var creatures = Creatures()
    
   // var creatures: [String] = ["Pikachu", "Squirtle", "Charizard", "Snorlax"]
    
    var body: some View {
        NavigationStack{
            Text("Come back and fix this") //TODO: Uncomment below
//            List(creatures, id: \.self) {
//                creature in
//                Text(creature)
//                    .font(.title2)
//            }
//                  .listStyle(.plain)
//                    .navigationTitle("Pokémon")
            
        }
        .task {
            await creatures.getData()
        }
    }
}

#Preview {
    CreaturesListView()
}
