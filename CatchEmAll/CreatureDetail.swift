//
//  CreatureDetail.swift
//  CatchEmAll
//
//  Created by Daniel Harris on 27/03/2025.
//

import Foundation
@Observable // Will watch objects for changes so that SwiftUI will redraw the interface when needed
class CreatureDetail {
    private struct Returned: Codable {
        var height: Double
        var weight: Double
        var sprites: Sprite
    }
    
    struct Sprite: Codable {
        var other: Other
    }
    
    struct Other: Codable {
        var officialArtwork: OfficialArtwork
        
        enum CodingKeys: String, CodingKey {
            case officialArtwork = "official-artwork"
        }
    }
    
    struct OfficialArtwork: Codable {
        var front_default: String? // This might return null, which is nil in Swift
    }

    var urlString = ""
    var height = 0.0
    var weight = 0.0
    var imageURL = ""
    
    func getData() async {
        print("🕸️ We are accessing the URL \(urlString)")
        
        // Create a URL
        guard let url = URL(string: urlString) else {
            print("😡 ERROR: Could not create a URL from \(urlString)")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url) // If you have a complex API that you need to look at _ value, then naming it response is good.
            
            //Try to decode JSON data into our own data structures
            guard let returned = try? JSONDecoder().decode(Returned.self, from: data) else {
                print("😡 JSON ERROR: Could not decode returned JSON data")
                return
            }
            self.height = returned.height
            self.weight = returned.weight
            self.imageURL = returned.sprites.other.officialArtwork.front_default ?? "n/a"
             
        
        } catch {
            print("😡 ERROR: Could not get data from URL from \(urlString)")
        }
    }
}


