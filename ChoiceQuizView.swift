//
//  File.swift
//  Wawai
//
//  Created by Rivaldo Fernandes on 23/04/22.
//

import SwiftUI
struct ChoiceQuizView: View {
    var body: some View {
        ZStack {
            Image("back")
                .resizable()
                .aspectRatio(contentMode: ContentMode.fill)
                .ignoresSafeArea()
            
            VStack {
                Text("Animal Knowledge Quiz")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .foregroundColor(.black)
                    .shadow(color: ColorPalette.khaki, radius: 2, x: 0, y: 3)
                    .padding()
                
                Text("Apa maksud dari")
                    .font(.system(size: 25, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .shadow(color: .purple, radius: 2, x: 0, y: 3)
                    .lineLimit(3)
                    .frame(width: UIScreen.main.bounds.size.width - 20, height: 60, alignment: .center)
                    .multilineTextAlignment(.center)
                
            }
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
//        .overlay(RoundedRectangle(cornerRadius: 50).stroke(ColorPalette.khaki, lineWidth: 5))
//        .border(ColorPalette.khaki, width: 2)
        .clipShape(RoundedRectangle(cornerRadius: 50))

//        .shadow(color: Color.black.opacity(0.2), radius: 10, y: 5)
    }
}

struct ChoiceQuizView_Previews: PreviewProvider {
    static var previews: some View {
        ChoiceQuizView()
    }
}

