//
//  File.swift
//  Wawai
//
//  Created by Rivaldo Fernandes on 24/04/22.
//

import SwiftUI

struct DashboardView: View {
    @State private var showMainCharacterView = false
    @State private var showSubCharacterView = false
    @State private var showQuizView = false
    @State private var showDrawingQuizView = false
    @State private var showShopView = false
    @AppStorage("level") private var level: Int = 0
    @AppStorage("played") private var played: Int = 0
    @AppStorage("coin")  private var coin: Int = 0
    
    var body: some View {
        GeometryReader{reader in
            ZStack {
                Image("back")
                    .resizable()
                
                VStack {
                    Spacer()
                    
                    Text("Summary")
                        .font(.system(size: 40, weight: .bold, design: .rounded))
                    
                    HStack {
                        Spacer()
                        CardDashboardItem(image: "star.fill", title: "Level.", value: level)
                        Spacer()
                        CardDashboardItem(image: "gamecontroller.fill", title: "Played.", value: played)
                        Spacer()
                        CardDashboardItem(image: "florinsign.circle.fill", title: "Coin.", value: coin)
                        Spacer()
                    }
                    Spacer()
                    
                    Text("Explore")
                        .font(.system(size: 40, weight: .bold, design: .rounded))
                    
                    NavigationLink(destination: MainCharacterView(isShow: self.$showMainCharacterView), isActive: self.$showMainCharacterView){
                        Button(action: {
                            self.showMainCharacterView = true
                        }){
                            CardExploreItem(image: "ka", title: "Learn Main Character")
                        }
                    }
                    
                    NavigationLink(destination: SubCharacterView(isShow: self.$showSubCharacterView), isActive: self.$showSubCharacterView){
                        Button(action: {
                            self.showSubCharacterView = true
                        }){
                            CardExploreItem(image: "tb_intro", title: "Learn Sub Character")
                        }
                    }
                    
                    NavigationLink(destination: ChoiceQuizView(isShow: self.$showQuizView), isActive: self.$showQuizView){
                        Button(action: {
                            self.showQuizView = true
                        }){
                            CardExploreItem(image: "mchoice", title: "Play a Quiz")
                        }
                    }
                    
                    NavigationLink(destination: DrawingQuizView(isShow: self.$showDrawingQuizView), isActive: self.$showDrawingQuizView){
                        Button(action: {
                            self.showDrawingQuizView = true
                        }){
                            CardExploreItem(image: "scratch", title: "Guest it Game")
                        }
                    }
                    Spacer()
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
                .padding(5)
                .frame(width: 70, height: 70)
                .padding()
                .background(Constants.ColorPalette.deepgray)
                .foregroundColor(Constants.ColorPalette.khaki)
                .clipShape(Circle())
                .padding()
            
            VStack {
                Text(title)
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .foregroundColor(Color.black)
            }.padding()
            Spacer()
    }
        .background(Constants.ColorPalette.gainsboro)
        .clipShape(Capsule())
        .shadow(color: Constants.ColorPalette.silver, radius: 5, x: 3, y: 2)
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
        .frame(minWidth: 200)
        .padding()
        .background(Constants.ColorPalette.gainsboro)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: Constants.ColorPalette.silver, radius: 2, x: 2, y: 1)

    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
