//
//  File.swift
//  Wawai
//
//  Created by Rivaldo Fernandes on 23/04/22.
//

import SwiftUI


struct MainCharacterView: View {
    @State private var showSubCharacterView = false
    @State private var showChoiceQuizView = false
    @State private var showExerciseView = false
    @State private var numOfGridColumns = 4
    @State private var currentChar = MainCharacterBank().mainCharacterList[0]
    
    let gridSpacing: CGFloat = 10
    
    
    var body: some View {
        let gridColumns = Array(repeating: GridItem(), count: numOfGridColumns)
        
        
        ZStack {
            Image("back")
                .resizable()
            
            VStack {
                Text("Lampungnese Main Character")
                    .font(.system(.largeTitle,design: .rounded))
                    .fontWeight(.bold)
                    .padding()
                //                    NavigationLink(destination: SubCharacterView(), isActive: self.$showSubCharacterView){
                //                        Button(action:{
                //                            self.showSubCharacterView = true
                //                            print(self)
                //                        }){
                //                            Text("Next To Lampungnese Sub Character")
                //                        }.buttonStyle(.bordered)
                //
                //                    }
                //
                
                LazyVGrid(columns: gridColumns, spacing: gridSpacing) {
                    ForEach(MainCharacterBank().mainCharacterList, id: \.id){ character in
                        NavigationLink(destination: ExerciseCharacterView(isShow: self.$showExerciseView, mainCharacter: currentChar), isActive: self.$showExerciseView){
                            
                            Button(action: {
                                currentChar = character
                                self.showExerciseView = true
                            }){
                                GridItemView(character: character)
                            }
                            .buttonStyle(GridButtonStyle(cornerRadius: 20))
                        }
                        
                    }
                }
                .padding(.horizontal)
            }
            
        }.ignoresSafeArea()
    }
}

struct GridButtonStyle : ButtonStyle {
    let cornerRadius: CGFloat
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            configuration.label
            
            if configuration.isPressed {
                Color.black.opacity(0.2)
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 50))
        .shadow(color: Color.black.opacity(0.2), radius: 10, y: 5)
    }
}

struct GridItemView: View {
    let character : CharacterItem
    var body: some View {
        GeometryReader { reader in
            // make the ui more dynamic
            let fontSize = min(reader.size.width * 0.2, 28)
            let imageWidth: CGFloat = min(100, reader.size.width * 0.6)
            
            VStack(spacing: 5){
                Spacer()
                Image(character.image)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(Constants.ColorPalette.khaki)
                    .shadow(color: Color(UIColor(red: 47/255, green: 47/255, blue: 47/255, alpha: 1)), radius: 1, x: 3, y: 2)
                    .frame(width: imageWidth)
                Spacer()
                Text(character.title)
                    .font(.system(size: fontSize, weight: .bold, design: .rounded))
                    .foregroundColor(Color.black.opacity(0.9))
                Spacer()
            }
            .frame(width: reader.size.width, height: reader.size.height)
            .background(Constants.ColorPalette.whitesmoke)
        }
        .frame(height:150)
        //        .overlay(RoundedRectangle(cornerRadius: 50).stroke(Constants.ColorPalette.khaki, lineWidth: 5))
        //        .border(Constants.ColorPalette.khaki, width: 2)
        .clipShape(RoundedRectangle(cornerRadius: 50))
        
        //        .shadow(color: Color.black.opacity(0.2), radius: 10, y: 5)
    }
}
