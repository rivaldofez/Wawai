//
//  File.swift
//  Wawai
//
//  Created by Rivaldo Fernandes on 23/04/22.
//

import SwiftUI


struct SubCharacterView: View {
    let subCharacters = [
        SubCharacterItem(title: "-i", image: "sb_i"),
        SubCharacterItem(title: "-u", image: "sb_u"),
        SubCharacterItem(title: "-e", image: "sb_e"),
        SubCharacterItem(title: "-è", image: "sb_ee"),
        SubCharacterItem(title: "-o", image: "sb_o"),
        SubCharacterItem(title: "-ai", image: "sb_ai"),
        SubCharacterItem(title: "-au", image: "sb_au"),
        SubCharacterItem(title: "-r", image: "sb_r"),
        SubCharacterItem(title: "-ng", image: "sb_ng"),
        SubCharacterItem(title: "-n", image: "sb_n"),
        SubCharacterItem(title: "-end", image: "sb_end"),
    ]
    
    let punctuation = [
    
    
    ]
    
    var body: some View {
        let gridColumns = Array(repeating: GridItem(), count: 4)
        ZStack {
            Image("back")
                .resizable()
            
            VStack {
                Text("Learn Lampungnese Sub Character")
                
                LazyVGrid(columns: gridColumns, spacing: 10) {
                    ForEach(subCharacters){ character in
                        Button(action: {}){
                            SubCharGridItemView(subChar: character)
                        }
                        .buttonStyle(MainGridButtonStyle(cornerRadius: 20))
                    }
                }
                .padding(.horizontal)
                
                Text("Learn Lampungnese Punctuation")
                
                LazyVGrid(columns: gridColumns, spacing: 10) {
                    ForEach(subCharacters){ character in
                        Button(action: {}){
                            SubCharGridItemView(subChar: character)
                        }
                        .buttonStyle(MainGridButtonStyle(cornerRadius: 20))
                    }
                }
                .padding(.horizontal)
            }
        }.ignoresSafeArea()
        
    }
}

struct SubCharacterView_Previews: PreviewProvider {
    static var previews: some View {
        SubCharacterView()
    }
}

struct SubCharGridItemView: View {
    let subChar : SubCharacterItem
    var body: some View {
        GeometryReader { reader in
            // make the ui more dynamic
            let fontSize = min(reader.size.width * 0.2, 28)
            let imageWidth: CGFloat = min(100, reader.size.width * 0.6)
            
            VStack(spacing: 5){
                Image(subChar.image)
                    .resizable()
                    .scaledToFit()
//                    .foregroundColor(item.imgColor)
//                    .shadow(color: Color(UIColor(red: 47/255, green: 47/255, blue: 47/255, alpha: 1)), radius: 1, x: 3, y: 2)
                    .frame(width: imageWidth)
                
                Text(subChar.title)
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
