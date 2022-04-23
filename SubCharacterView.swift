//
//  File.swift
//  Wawai
//
//  Created by Rivaldo Fernandes on 23/04/22.
//

import SwiftUI


struct SubCharacterView: View {
    @State private var showExerciseView = false
    @State private var currentChar = MainCharacterBank().mainCharacterList[0]
    
    var body: some View {
        let gridColumns = Array(repeating: GridItem(), count: 3)
        ZStack {
            Image("back")
                .resizable()
            
            VStack {
                Spacer()
                Text("Lampungnese Main Character")
                    .font(.system(.largeTitle,design: .rounded))
                    .fontWeight(.bold)
                    .padding()
                
                LazyVGrid(columns: gridColumns, spacing: 10) {
                    ForEach(SubCharacterBank().subCharacterList){ character in
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
                
                Spacer()
                
                Text("Lampungnese Main Character")
                    .font(.system(.largeTitle,design: .rounded))
                    .fontWeight(.bold)
                    .padding()
                
                LazyVGrid(columns: gridColumns, spacing: 10) {
                    ForEach(PuncCharacterBank().puncCharacterList){ character in
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
                
                Spacer()
            }
        }.ignoresSafeArea()
        
    }
}

struct SubCharacterView_Previews: PreviewProvider {
    static var previews: some View {
        SubCharacterView()
    }
}





