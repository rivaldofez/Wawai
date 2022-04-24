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
                    Spacer()
                    
                    Text("Dashboard")
                        .font(.system(size: 40, weight: .bold, design: .rounded))
                    
                    HStack {
                        Spacer()
                        CardDashboardItem(image: "star.fill", title: "Level.", value: 100)
                        Spacer()
                        CardDashboardItem(image: "gamecontroller.fill", title: "Played.", value: 10)
                        Spacer()
                        CardDashboardItem(image: "florinsign.circle.fill", title: "Coin.", value: 5000)
                        Spacer()
                    }
                    Spacer()
                    
                    Text("Explore")
                        .font(.system(size: 40, weight: .bold, design: .rounded))
                    
                    Button(action:{
                        
                    }){
                        CardExploreItem(image: "ka", title: "Learn Main Character")
                    }
                    
                    Button(action:{}){
                        CardExploreItem(image: "ga", title: "Learn Sub Character")
                    }
                    
                    Button(action:{}){
                        CardExploreItem(image: "nga", title: "Play a Quiz")
                    }
                    
                    Button(action:{}){
                        CardExploreItem(image: "nga", title: "Guest it")
                    }
                    
                    Button(action:{}){
                        CardExploreItem(image: "nga", title: "Guest it")
                    }
                    
//                    Spacer()
                   
                       
                }
            }.ignoresSafeArea()
        }
    }
}


struct CardExploreItem: View {
    var image: String
    var title: String
    
    var body: some View {
        HStack {
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(width: 70, height: 70)
                .padding()
                .background(Constants.ColorPalette.deepgray)
                .foregroundColor(Constants.ColorPalette.khaki)
                .clipShape(Circle())
                .padding()
            
            VStack {
                Text(title)
                    .font(.system(size: 30, weight: .regular, design: .rounded))
            }.padding()
            Spacer()
    }
    .background(Constants.ColorPalette.choco)
        .foregroundColor(Constants.ColorPalette.khaki)
        .clipShape(Capsule())
        .padding()
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
                    .font(.system(size: 30, weight: .regular, design: .rounded))
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
