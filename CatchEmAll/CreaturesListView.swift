//
//  CreaturesListView.swift
//  CatchEmAll
//
//  Created by Daniel Harris on 24/03/2025.
//

import SwiftUI

struct CreaturesListView: View {
    
    var creatures: [String] = ["Pikachu", "Squirtle", "Charizard", "Snorlax"]
    
    var body: some View {
        NavigationStack{
            List(creatures, id: \.self) {
                creature in
                Text(creature)
                    .font(.title2)
            }
            .listStyle(.plain)
            .navigationTitle("Pokémon")
            
        }
    }
}

#Preview {
    CreaturesListView()
}
