//
//  Coffee.swift
//  Crema
//
//  Created by Chris Matthews on 02/02/2025.
//

import Foundation
import SwiftData
import SwiftUI

@Model
final class Coffee {
    var id: UUID
    
    var roaster: String
    
    var name: String
    
    @Attribute(.externalStorage)
    var pictureData: Data?
    
    var tastingNotes: String
    
    var rating: Double
    
    init (roaster: String, name: String, pictureData: Data? = nil, tastingNotes: String = "No tasting notes available.", rating: Double = 0.0) {
        self.id = UUID()
        self.roaster = roaster
        self.name = name
        self.pictureData = pictureData
        self.tastingNotes = tastingNotes
        self.rating = rating
    }
    
    static let sampleData = [
        Coffee(roaster: "200 Degrees", name: "Brazilian Love Affair", tastingNotes: "Chocolate, Caramel, Hazelnut", rating: 6.0),
        Coffee(roaster: "Workshop Coffee", name: "La Magdalena", tastingNotes: "Caramelised sugars, panela, and a hint of vanilla", rating: 9.0),
        Coffee(roaster: "Limini Coffee", name: "Limini Blend", tastingNotes: "Smooth rich notes of caramel and dark chocolate", rating: 5.0),
        Coffee(roaster: "Dark Arts Coffee Roasters", name: "The Devil Looks After His Own", tastingNotes: "Blackcurrant, Green apple, Prune", rating: 7.0)
    ]
}
