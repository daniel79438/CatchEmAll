//
//  Creatures.swift
//  CatchEmAll
//
//  Created by Daniel Harris on 24/03/2025.
//

import Foundation

@Observable // Will watch objects for changes so that SwiftUI will redraw the interface when needed
class Creatures {
    private struct Returned: Codable{
        var count: Int
        var next: String //TODO: We want to change this to an optional
        var results: [Result]
    }
    
    struct Result: Codable {
        var name: String
        var url: String // url for detail on Pokemon
    }

    var urlString = "https://pokeapi.co/api/v2/pokemon"
    var count = 0
    var creaturesArray: [Result] = []
    
    
    func getData() async {
        print("🕸️ We are accessing the URL \(urlString)")
        
        // Create a URL
        guard let url = URL(string: urlString) else {
            print("😡 Could not create a URL from \(urlString)")
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url) // If you have a complex API that you need to look at _ value, then naming it response is good.
            
            //Try to decode JSON data into our own data structures
            guard let returned = try? JSONDecoder().decode(Returned.self, from: data) else {
                print("😡 Could not decode returned JSON data")
                return
            }
            self.count = returned.count
            self.urlString = returned.next
            self.creaturesArray = returned.results
        } catch {
            print("😡 Could not get data from URL from \(urlString)")
        }
    }
}
