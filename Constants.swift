//
//  File.swift
//  Wawai
//
//  Created by Rivaldo Fernandes on 23/04/22.
//

import SwiftUI


struct Constants{
    struct ColorPalette {
        static let khaki = Color(red: 255/255, green: 203/255, blue: 116/255)
        static let deepgray = Color(red: 46/255, green: 46/255, blue: 46/255)
        static let whitesmoke = Color(red: 246/255, green: 246/255, blue: 246/255)
        static let dimgray = Color(red: 111/255, green: 111/255, blue: 111/255)
        static let lightgray = Color(red: 215/255, green: 214/255, blue: 214/255)
        static let choco = Color(red: 152/255, green: 127/255, blue: 85/255)
        static let gainsboro = Color(red: 223/255, green: 223/255, blue: 223/255)
        static let silver = Color(red: 185/255, green: 185/255, blue: 185/255)
        static let ch1 = Color(red: 172/255, green: 212/255, blue: 223/255)
        static let ch2 = Color(red: 200/255, green: 213/255, blue: 158/255)
        static let ch3 = Color(red: 224/255, green: 164/255, blue: 139/255)
        static let ch4 = Color(red: 244/255, green: 222/255, blue: 86/255)
        
        
    }
    
    struct Icons {
        static let plusCircle = "plus.circle"
        static let line3HorizontalCircleFill = "line.3.horizontal.circle.fill"
        static let circle = "circle"
        static let circleInsetFilled = "circle.inset.filled"
        static let exclaimationMarkCircle = "exclamationmark.circle"
        static let recordCircleFill = "tray.circle.fill"
        static let circleFill = "circle.fill"
    }
}

class SubCharacterBank {
    var subCharacterList = [CharacterItem]()
    init() {
        subCharacterList.append(contentsOf: [
            CharacterItem(title: "k(-i)", image: "sb_i"),
            CharacterItem(title: "k(-e)", image: "sb_e"),
            CharacterItem(title: "k(-è)", image: "sb_ee"),
            CharacterItem(title: "k(-ar)", image: "sb_r"),
            CharacterItem(title: "k(-ang)", image: "sb_ng"),
            CharacterItem(title: "k(-an)", image: "sb_n"),
            CharacterItem(title: "k(-u)", image: "sb_u"),
            CharacterItem(title: "k(-o)", image: "sb_o"),
            CharacterItem(title: "k(-au)", image: "sb_au"),
            CharacterItem(title: "k(-ai)", image: "sb_ai"),
            CharacterItem(title: "k(-ah)", image: "sb_ah"),
            CharacterItem(title: "k", image: "sb_end")
        ])
    }
}

class PuncCharacterBank {
    var puncCharacterList = [CharacterItem]()
    init() {
        puncCharacterList.append(contentsOf: [
            CharacterItem(title: "Intro", image: "tb_intro"),
            CharacterItem(title: "Comma", image: "tb_comma"),
            CharacterItem(title: "Period", image: "tb_period"),
            CharacterItem(title: "Question", image: "tb_question"),
            CharacterItem(title: "Exclamation", image: "tb_exclamation"),
            CharacterItem(title: "Quotation", image: "tb_quotation"),
        ])
    }
}

class MainCharacterBank {
    var mainCharacterList = [CharacterItem]()
    init() {
        mainCharacterList.append(contentsOf: [
            CharacterItem(title: "Ka", image: "ka"),
            CharacterItem(title: "Ga", image: "ga"),
            CharacterItem(title: "Nga", image: "nga"),
            CharacterItem(title: "Pa", image: "pa"),
            CharacterItem(title: "Ba", image: "ba"),
            CharacterItem(title: "Ma", image: "ma"),
            CharacterItem(title: "Ta", image: "ta"),
            CharacterItem(title: "Da", image: "da"),
            CharacterItem(title: "Na", image: "na"),
            CharacterItem(title: "Ca", image: "ca"),
            CharacterItem(title: "Ja", image: "ja"),
            CharacterItem(title: "Nya", image: "nya"),
            CharacterItem(title: "Ya", image: "ya"),
            CharacterItem(title: "A", image: "a"),
            CharacterItem(title: "La", image: "la"),
            CharacterItem(title: "Ra", image: "ra"),
            CharacterItem(title: "Sa", image: "sa"),
            CharacterItem(title: "Wa", image: "wa"),
            CharacterItem(title: "Ha", image: "ha"),
            CharacterItem(title: "Gha", image: "gha"),
        ])
    }
}


class ChoiceQuizQuestionBank {
    var questionList = [ChoiceQuiz]()
    
    init() {
        questionList.append(contentsOf: [
            ChoiceQuiz(img: "q_love", question: "The above character means...", answer: 0, choice: [
                ChoiceItem(img: "a.circle.fill", text: "love", itemColor: Constants.ColorPalette.ch1),
                ChoiceItem(img: "b.circle.fill", text: "are", itemColor: Constants.ColorPalette.ch2),
                ChoiceItem(img: "c.circle.fill", text: "be", itemColor: Constants.ColorPalette.ch3),
                ChoiceItem(img: "d.circle.fill", text: "the", itemColor: Constants.ColorPalette.ch4),
            ]),
            ChoiceQuiz(img: "q_hai", question: "The above character means...", answer: 1, choice: [
                ChoiceItem(img: "a.circle.fill", text: "the", itemColor: Constants.ColorPalette.ch1),
                ChoiceItem(img: "b.circle.fill", text: "hai", itemColor: Constants.ColorPalette.ch2),
                ChoiceItem(img: "c.circle.fill", text: "be", itemColor: Constants.ColorPalette.ch3),
                ChoiceItem(img: "d.circle.fill", text: "love", itemColor: Constants.ColorPalette.ch4),
            ]),
            ChoiceQuiz(img: "q_big", question: "The above character means...", answer: 2, choice: [
                ChoiceItem(img: "a.circle.fill", text: "hai", itemColor: Constants.ColorPalette.ch1),
                ChoiceItem(img: "b.circle.fill", text: "are", itemColor: Constants.ColorPalette.ch2),
                ChoiceItem(img: "c.circle.fill", text: "big", itemColor: Constants.ColorPalette.ch3),
                ChoiceItem(img: "d.circle.fill", text: "the", itemColor: Constants.ColorPalette.ch4),
            ]),
            ChoiceQuiz(img: "q_many", question: "The above character means...", answer: 3, choice: [
                ChoiceItem(img: "a.circle.fill", text: "big", itemColor: Constants.ColorPalette.ch1),
                ChoiceItem(img: "b.circle.fill", text: "hai", itemColor: Constants.ColorPalette.ch2),
                ChoiceItem(img: "c.circle.fill", text: "be", itemColor: Constants.ColorPalette.ch3),
                ChoiceItem(img: "d.circle.fill", text: "many", itemColor: Constants.ColorPalette.ch4),
            ]),
            ChoiceQuiz(img: "q_how", question: "The above character means...", answer: 0, choice: [
                ChoiceItem(img: "a.circle.fill", text: "how", itemColor: Constants.ColorPalette.ch1),
                ChoiceItem(img: "b.circle.fill", text: "are", itemColor: Constants.ColorPalette.ch2),
                ChoiceItem(img: "c.circle.fill", text: "you", itemColor: Constants.ColorPalette.ch3),
                ChoiceItem(img: "d.circle.fill", text: "here", itemColor: Constants.ColorPalette.ch4),
            ]),
            ChoiceQuiz(img: "q_care", question: "The above character means...", answer: 1, choice: [
                ChoiceItem(img: "a.circle.fill", text: "like", itemColor: Constants.ColorPalette.ch1),
                ChoiceItem(img: "b.circle.fill", text: "care", itemColor: Constants.ColorPalette.ch2),
                ChoiceItem(img: "c.circle.fill", text: "big", itemColor: Constants.ColorPalette.ch3),
                ChoiceItem(img: "d.circle.fill", text: "the", itemColor: Constants.ColorPalette.ch4),
            ]),
            ChoiceQuiz(img: "q_apple", question: "The above character means...", answer: 2, choice: [
                ChoiceItem(img: "a.circle.fill", text: "care", itemColor: Constants.ColorPalette.ch1),
                ChoiceItem(img: "b.circle.fill", text: "how", itemColor: Constants.ColorPalette.ch2),
                ChoiceItem(img: "c.circle.fill", text: "apple", itemColor: Constants.ColorPalette.ch3),
                ChoiceItem(img: "d.circle.fill", text: "the", itemColor: Constants.ColorPalette.ch4),
            ]),
            ChoiceQuiz(img: "q_yes", question: "The above character means...", answer: 3, choice: [
                ChoiceItem(img: "a.circle.fill", text: "love", itemColor: Constants.ColorPalette.ch1),
                ChoiceItem(img: "b.circle.fill", text: "are", itemColor: Constants.ColorPalette.ch2),
                ChoiceItem(img: "c.circle.fill", text: "be", itemColor: Constants.ColorPalette.ch3),
                ChoiceItem(img: "d.circle.fill", text: "yes", itemColor: Constants.ColorPalette.ch4),
            ]),
            ChoiceQuiz(img: "q_like", question: "The above character means...", answer: 0, choice: [
                ChoiceItem(img: "a.circle.fill", text: "like", itemColor: Constants.ColorPalette.ch1),
                ChoiceItem(img: "b.circle.fill", text: "are", itemColor: Constants.ColorPalette.ch2),
                ChoiceItem(img: "c.circle.fill", text: "we", itemColor: Constants.ColorPalette.ch3),
                ChoiceItem(img: "d.circle.fill", text: "love", itemColor: Constants.ColorPalette.ch4),
            ]),
            ChoiceQuiz(img: "q_no", question: "The above character means...", answer: 1, choice: [
                ChoiceItem(img: "a.circle.fill", text: "me", itemColor: Constants.ColorPalette.ch1),
                ChoiceItem(img: "b.circle.fill", text: "no", itemColor: Constants.ColorPalette.ch2),
                ChoiceItem(img: "c.circle.fill", text: "like", itemColor: Constants.ColorPalette.ch3),
                ChoiceItem(img: "d.circle.fill", text: "big", itemColor: Constants.ColorPalette.ch4),
            ]),
        ])
    }
}


class DrawingQuestionBank {
    var questionList = [DrawQuiz]()
    
    init() {
        questionList.append(contentsOf: [
            DrawQuiz(img: "q_am", answer: "am"),
            DrawQuiz(img: "q_is", answer: "is"),
            DrawQuiz(img: "q_in", answer: "in"),
            DrawQuiz(img: "q_on", answer: "on"),
            DrawQuiz(img: "q_be", answer: "be"),
            DrawQuiz(img: "q_no", answer: "no"),
            DrawQuiz(img: "q_yes", answer: "yes"),
            DrawQuiz(img: "q_are", answer: "are"),
            DrawQuiz(img: "q_hai", answer: "hai"),
            DrawQuiz(img: "q_gha", answer: "gha"),
        ])
    }
}
