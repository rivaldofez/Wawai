//
//  File.swift
//  Wawai
//
//  Created by Rivaldo Fernandes on 23/04/22.
//

import SwiftUI
struct ChoiceQuizView: View {
    
    @State var i : Int = 0
    @State var score : Int = 0
    
    
    var body: some View {
        let gridColumns = Array(repeating: GridItem(), count: 2)
        
        GeometryReader{reader in
            ZStack {
                Image("back")
                    .resizable()
                
                if(self.i < ChoiceQuizQuestionBank().questionList.count){
                    VStack {
                        Spacer()
                        Image("ka")
                            .resizable()
                            .scaledToFit()
                            .frame(width: reader.size.width * 0.4, height: reader.size.width * 0.4)
                        
                        Text("Animal Knowledge Quiz.....")
                            .font(.system(size: 50, weight: .bold, design: .rounded))
                            .foregroundColor(.black)
                            .padding()
                        
                        Spacer()
                        
//                        Text("Apa maksud dari")
//                            .font(.system(size: 25, weight: .bold, design: .rounded))
//                            .foregroundColor(.white)
//                            .shadow(color: .purple, radius: 2, x: 0, y: 3)
//                            .lineLimit(3)
//                            .frame(width: UIScreen.main.bounds.size.width - 20, height: 60, alignment: .center)
//                            .multilineTextAlignment(.center)
                        
                        LazyVGrid(columns: gridColumns, spacing: 10) {
                            
                            ForEach(0..<4, id: \.self) {_ in
                                Button(action: {}){
                                    ChoiceGridItemView()
                                }
                                .buttonStyle(ChoiceGridButtonStyle(cornerRadius: 20))
                            
                            }
                        }
                        .padding(.horizontal)
                        
                        
                        Button(action:{
                            self.i += 1
                        }){
                            Text("Next")
                        }
                        
                        Spacer()
                    }
                }
                else{
                    Text("Halaman Score")
                }
            }
            .navigationTitle("Multiple Choice Quiz")
            .navigationBarBackButtonHidden(true)
            
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
//    let mainChar : MainCharacterItem
    var body: some View {
        GeometryReader { reader in
            // make the ui more dynamic
            let fontSize = min(reader.size.width * 0.2, 28)
            let imageWidth: CGFloat = min(70, reader.size.width * 0.2)
            
            VStack(spacing: 5){
                Image(systemName: "a.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(Color.blue)
//                    .foregroundColor(item.imgColor)
//                    .shadow(color: Color(UIColor(red: 47/255, green: 47/255, blue: 47/255, alpha: 1)), radius: 1, x: 3, y: 2)
                    .frame(width: imageWidth)
                
                Text("The power of love")
                    .font(.system(size: fontSize, weight: .bold, design: .rounded))
                    .foregroundColor(Color.black.opacity(0.9))
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

struct ChoiceQuizView_Previews: PreviewProvider {
    static var previews: some View {
        ChoiceQuizView()
    }
}

