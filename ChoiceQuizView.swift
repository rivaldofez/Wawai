//
//  File.swift
//  Wawai
//
//  Created by Rivaldo Fernandes on 23/04/22.
//

import SwiftUI
struct ChoiceQuizView: View {
    
    @State var indexQuestion : Int = 0
    @State var score : Int = 0
    @Binding var isShow: Bool
    
    
    var body: some View {
        let gridColumns = Array(repeating: GridItem(), count: 2)
        
        GeometryReader{reader in
            ZStack {
                Image("back")
                    .resizable()
                if(self.indexQuestion < ChoiceQuizQuestionBank().questionList.count){
                    let currentQuestion = ChoiceQuizQuestionBank().questionList[indexQuestion]
                    VStack {
                        Spacer()
                        Image(currentQuestion.img)
                            .resizable()
                            .scaledToFit()
                            .frame(width: reader.size.width * 0.4, height: reader.size.width * 0.4)
                        
                        Text(currentQuestion.question)
                            .font(.system(size: 50, weight: .bold, design: .rounded))
                            .foregroundColor(.black)
                            .padding()
                        
                        Spacer()
                        
                        LazyVGrid(columns: gridColumns, spacing: 10) {
                            
                            ForEach(0..<currentQuestion.choice.count, id: \.self) {i in
                                Button(action: {
                                    if(i == currentQuestion.answer){
                                        print("jawaban benar")
                                    }else{
                                        print("jawaban salah")
                                    }
                                    self.indexQuestion += 1
                                    
                                }){
                                    ChoiceGridItemView(choice: currentQuestion.choice[i])
                                }
                                .buttonStyle(ChoiceGridButtonStyle(cornerRadius: 20))
                                
                            }
                        }
                        .padding(.horizontal)
                        
                        
                        Button(action:{
                            self.indexQuestion += 1
                        }){
                            Text("Next")
                        }
                        
                        Spacer()
                    }
                    .animation(.easeIn, value: true)
                }
                else{
                    Text("Halaman Score")
                }
            }
            .navigationTitle("Multiple Choice Quiz")
            .ignoresSafeArea()
        }
    }
}

struct ChoiceGridButtonStyle : ButtonStyle {
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

struct ChoiceGridItemView: View {
    let choice : ChoiceItem
    var body: some View {
        GeometryReader { reader in
            let fontSize = min(reader.size.width * 0.2, 28)
            let imageWidth: CGFloat = min(70, reader.size.width * 0.2)
            
            VStack(spacing: 5){
                Image(systemName: choice.img)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(choice.itemColor)
                    .frame(width: imageWidth)
                
                Text(choice.text)
                    .font(.system(size: fontSize, weight: .bold, design: .rounded))
                    .foregroundColor(Color.black.opacity(0.9))
            }
            .frame(width: reader.size.width, height: reader.size.height)
            .background(Constants.ColorPalette.whitesmoke)
        }
        .frame(height:150)
        .clipShape(RoundedRectangle(cornerRadius: 50))
    }
}
