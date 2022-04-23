//
//  CharacterBank.swift
//  Wawai
//
//  Created by Rivaldo Fernandes on 23/04/22.
//

import SwiftUI


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

struct MultipleChoice {
    let choiceA : String
    let choiceB : String
    let choiceC : String
    let choiceD : String
}

struct Line {
    var points = [CGPoint]()
    var color: Color = .red
    var lineWidth: Double = 5.0
}
