//
//  DatosPokemon.swift
//  Pokedex
//
//  Created by Jorge Rivera on 29/11/22.
//

import Foundation


struct Pokemon: Decodable, Identifiable {
    let id: Int
    let attack: Int
    let defense: Int
    let description: String
    let name: String
    let imageUrl: String
    let type: String
    
    
}
