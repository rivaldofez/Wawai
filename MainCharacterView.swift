//
//  File.swift
//  Wawai
//
//  Created by Rivaldo Fernandes on 23/04/22.
//

import SwiftUI


struct MainCharacterView: View {
    let mainCharacters = [
        MainCharacterItem(title: "Ka", image: "ka"),
        MainCharacterItem(title: "Ga", image: "ga"),
        MainCharacterItem(title: "Nga", image: "nga"),
        MainCharacterItem(title: "Pa", image: "pa"),
        MainCharacterItem(title: "Ba", image: "ba"),
        MainCharacterItem(title: "Ma", image: "ma"),
        MainCharacterItem(title: "Ta", image: "ta"),
        MainCharacterItem(title: "Da", image: "da"),
        MainCharacterItem(title: "Na", image: "na"),
        MainCharacterItem(title: "Ca", image: "ca"),
        MainCharacterItem(title: "Ja", image: "ja"),
        MainCharacterItem(title: "Nya", image: "nya"),
        MainCharacterItem(title: "Ya", image: "ya"),
        MainCharacterItem(title: "A", image: "a"),
        MainCharacterItem(title: "La", image: "la"),
        MainCharacterItem(title: "Ra", image: "ra"),
        MainCharacterItem(title: "Sa", image: "sa"),
        MainCharacterItem(title: "Wa", image: "wa"),
        MainCharacterItem(title: "Ha", image: "ha"),
        MainCharacterItem(title: "Gha", image: "gha"),
    ]
    
    @State private var showSubCharacterView = false
    @State private var numOfGridColumns = 4
    let gridSpacing: CGFloat = 10
    
    
    var body: some View {
        let gridColumns = Array(repeating: GridItem(), count: numOfGridColumns)
        
        ZStack {
            Image("back")
                .resizable()
            
            VStack {
                Text("Learn Lampungnese Main Character")
                NavigationLink(destination: SubCharacterView(), isActive: self.$showSubCharacterView){
                    Button(action:{
                        self.showSubCharacterView = true
                        print(self)
                    }){
                        Text("Next To Lampungnese Sub Character")
                    }.buttonStyle(.bordered)
                    
                }
                
                
                LazyVGrid(columns: gridColumns, spacing: gridSpacing) {
                    ForEach(mainCharacters){ character in
                        Button(action: {}){
                            MainGridItemView(mainChar: character)
                        }
                        .buttonStyle(MainGridButtonStyle(cornerRadius: 20))
                    }
                }
                .padding(.horizontal)
            }
        }.ignoresSafeArea()
    }
}

struct MainGridButtonStyle : ButtonStyle {
    let cornerRadius: CGFloat
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            configuration.label
            
            if configuration.isPressed {
                Color.black.opacity(0.2)
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: Color.black.opacity(0.2), radius: 10, y: 5)
    }
}

struct MainGridItemView: View {
    let mainChar : MainCharacterItem
    var body: some View {
        GeometryReader { reader in
            // make the ui more dynamic
            let fontSize = min(reader.size.width * 0.2, 28)
            let imageWidth: CGFloat = min(100, reader.size.width * 0.6)
            
            VStack(spacing: 5){
                Image(mainChar.image)
                    .resizable()
                    .scaledToFit()
//                    .foregroundColor(item.imgColor)
//                    .shadow(color: Color(UIColor(red: 47/255, green: 47/255, blue: 47/255, alpha: 1)), radius: 1, x: 3, y: 2)
                    .frame(width: imageWidth)
                
                Text(mainChar.title)
                    .font(.system(size: fontSize, weight: .bold, design: .rounded))
                    .foregroundColor(Color.black.opacity(0.9))
            }
            .frame(width: reader.size.width, height: reader.size.height)
            .background(ColorPalette.whitesmoke)
        }
        .frame(height:150)
        .overlay(RoundedRectangle(cornerRadius: 20).stroke(ColorPalette.khaki, lineWidth: 5))
//        .border(ColorPalette.khaki, width: 2)
//        .clipShape(RoundedRectangle(cornerRadius: 20))

//        .shadow(color: Color.black.opacity(0.2), radius: 10, y: 5)
    }
}
