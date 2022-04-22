//
//  CharacterBank.swift
//  Wawai
//
//  Created by Rivaldo Fernandes on 23/04/22.
//

import Foundation


struct MainCharacterItem: Identifiable {
    let id = UUID()
    let title: String
    let image: String
}

struct SubCharacterItem: Identifiable {
    let id = UUID()
    let title: String
    let image: String
}

struct PunctuationCharacterItem: Identifiable {
    let id = UUID()
    let title: String
    let image: String
}
