//
//  CharacterBank.swift
//  Wawai
//
//  Created by Rivaldo Fernandes on 23/04/22.
//

import SwiftUI


struct CharacterItem: Identifiable {
    let id = UUID()
    let title: String
    let image: String
}

struct Line {
    var points = [CGPoint]()
    var color: Color = .red
    var lineWidth: Double = 5.0
}


struct ChoiceQuiz {
    let img: String
    let question: String
    let answer: Int
    let choice : [ChoiceItem]
}

struct ChoiceItem: Identifiable {
    let id = UUID()
    let img: String
    let text: String
    let itemColor: Color
}

