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
            CharacterItem(title: "-i", image: "sb_i"),
            CharacterItem(title: "-u", image: "sb_u"),
            CharacterItem(title: "-e", image: "sb_e"),
            CharacterItem(title: "-è", image: "sb_ee"),
            CharacterItem(title: "-o", image: "sb_o"),
            CharacterItem(title: "-ai", image: "sb_ai"),
            CharacterItem(title: "-au", image: "sb_au"),
            CharacterItem(title: "-r", image: "sb_r"),
            CharacterItem(title: "-ng", image: "sb_ng"),
            CharacterItem(title: "-n", image: "sb_n"),
            CharacterItem(title: "-end", image: "sb_end")
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
            ChoiceQuiz(img: "ka", question: "Ka adalah", answer: "a", choice: Choice(choiceA: "Ka", choiceB: "Kb", choiceC: "Kc", choiceD: "Kd")),
            ChoiceQuiz(img: "ga", question: "Ga adalah", answer: "b", choice: Choice(choiceA: "Ka", choiceB: "Kb", choiceC: "Kc", choiceD: "Kd")),
            ChoiceQuiz(img: "nga", question: "Nga adalah", answer: "c", choice: Choice(choiceA: "Ka", choiceB: "Kb", choiceC: "Kc", choiceD: "Kd"))
            
        ])
    }
}
