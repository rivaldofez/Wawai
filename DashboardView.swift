//
//  File.swift
//  Wawai
//
//  Created by Rivaldo Fernandes on 24/04/22.
//

import SwiftUI

struct DashboardView: View {
    var body: some View {
        GeometryReader{reader in
            ZStack {
                Image("back")
                    .resizable()
                
                VStack {
                    HStack {
                        CardDashboardItem(image: "star.fill", title: "Level", value: 100)
                        CardDashboardItem(image: "gamecontroller.fill", title: "Played", value: 10)
                    }
                }
            }.ignoresSafeArea()
        }
    }
}


struct CardDashboardItem: View {
    var image: String
    var title: String
    var value: Int
    
    
    var body: some View {
        VStack{
            Image(systemName: image)
                .resizable()
                .scaledToFit()
                .frame(width: 70, height: 70)
                .padding()
                .background(Constants.ColorPalette.deepgray)
                .foregroundColor(Constants.ColorPalette.khaki)
                .clipShape(Circle())
            
            HStack(alignment: .center){
                Text(title)
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                Text("\(value)")
                    .font(.system(size: 40, weight: .bold, design: .rounded))
            }
        }
        .padding()
        .background(Constants.ColorPalette.whitesmoke)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: Constants.ColorPalette.lightgray, radius: 2, x: 2, y: 1)
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
