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

struct Choice {
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


struct ChoiceQuiz {
    let img: String
    var question: String
    var answer: String
    var choice: Choice
}
