//
//  File.swift
//  Wawai
//
//  Created by Rivaldo Fernandes on 24/04/22.
//

import SwiftUI

struct ExerciseCharacterView: View {
    @Binding var isShow: Bool
    @State private var currentLine = Line()
    @State private var lines: [Line] = []
    @State private var selectedColor: Color = .red
    @State private var thickness: Double = 5.0
    @State private var showingAlertFinish: Bool = false
    @State private var showingAlertEmpty: Bool = false
    @AppStorage("level") private var level: Int = 0
    @AppStorage("played") private var played: Int = 0
    @AppStorage("coin")  private var coin: Int = 0
    @State var indexQuestion : Int = 0
    @State var score : Int = 0
    
    var mainCharacter: CharacterItem
    
    var body: some View {
        GeometryReader{reader in
            
            
            ZStack {
                Image("back")
                    .resizable()
                
                VStack {
                    Text("Draw \"\(mainCharacter.title)\" Character")
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                        .foregroundColor(.black)
                        .shadow(color: Constants.ColorPalette.khaki, radius: 2, x: 0, y: 3)
                        .padding()
                    
                    ZStack {
                        Image(mainCharacter.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: reader.size.width * 0.3, height: reader.size.width * 0.3)
                        
                        Canvas { context, size in
                            for line in lines {
                                var path = Path()
                                path.addLines(line.points)
                                context.stroke(path, with: .color(line.color), style: StrokeStyle(lineWidth: line.lineWidth, lineCap: .round))
                            }
                        }.frame(width: reader.size.width * 0.5, height: reader.size.height * 0.5)
                            .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
                                .onChanged({value in
                                    let newPoint = value.location
                                    currentLine.points.append(newPoint)
                                    self.lines.append(currentLine)
                                })
                                    .onEnded({Value in
                                        self.lines.append(currentLine)
                                        self.currentLine = Line(points: [], color: selectedColor, lineWidth: thickness)
                                    })
                            )
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                    }
                    
                    HStack {
                        HStack {
                            Text("Thickness")
                                .font(.system(.title2, design: .rounded))
                                .fontWeight(.bold)
                            Slider(value: $thickness, in: 1...20){
                            }.frame(maxWidth: 100)
                                .onChange(of: thickness){newThickness in
                                    currentLine.lineWidth = newThickness
                                }
                            
                        }
                        .padding(10)
                        .background(Constants.ColorPalette.whitesmoke)
                        .clipShape(Capsule())
                        
                        HStack {
                            ColorPickerView(selectedColor: $selectedColor).onChange(of: selectedColor){ newColor in
                                currentLine.color = newColor
                            }
                        }
                        .padding(10)
                        .background(Constants.ColorPalette.whitesmoke)
                        .clipShape(Capsule())
                        
                        
                        Button(action: {
                            self.lines = []
                            self.currentLine = Line(points: [], color: selectedColor, lineWidth: thickness)
                        }){
                            Text("Clear")
                                .font(.system(.title2, design: .rounded))
                                .fontWeight(.bold)
                        }
                        .padding(10)
                        .background(Constants.ColorPalette.whitesmoke)
                        .clipShape(Capsule())
                    }
                    .alert(isPresented: self.$showingAlertFinish){
                        Alert(title: Text("Congratulation !"), message: Text("You got 1 Siger Coins"),dismissButton: .default(Text("OK"),action: {
                            self.coin += 1
                            self.level += score/self.level
                            self.played += 1
                            self.isShow = false
                            
                        }))
                    }
                    
                    Button(action:{
                        if(lines.isEmpty){
                            self.showingAlertEmpty = true
                        }else{
                            self.showingAlertFinish = true
                        }
                    }){
                        Text("Finish Drawing")
                            .font(.system(size: 30, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                            .padding()
                    }
                    .background(Color.green)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding(.top)
                    .alert(isPresented: self.$showingAlertEmpty){
                        Alert(title: Text("Your Canvas is Empty"), message: Text("you haven't drawn any character yet"))
                    }
                }
            }
            .ignoresSafeArea()
            .navigationTitle("Exercise")
        }
    }
}
