//
//  File.swift
//  Wawai
//
//  Created by Rivaldo Fernandes on 23/04/22.
//

import SwiftUI

struct DrawingQuizView: View {
    
    @State private var currentLine = Line()
    @State private var lines: [Line] = []
    @State private var selectedColor: Color = .red
    @State private var thickness: Double = 0.0
    @State private var answerField: String = ""
    @State private var showingAlertEmpty = false
    @State private var showingAlertFinish = false
    @State private var showingAlertScratchEmpty = false
    @State private var score = 0
    @AppStorage("level") private var level: Int = 0
    @AppStorage("played") private var played: Int = 0
    @AppStorage("coin")  private var coin: Int = 0
    @Binding var isShow: Bool
    @State var indexQuestion: Int = 0
    
    
    var body: some View {
        
        GeometryReader{reader in
            ZStack {
                Image("back")
                    .resizable()
                
                if(self.indexQuestion < DrawingQuestionBank().questionList.count){
                    let currentQuestion = DrawingQuestionBank().questionList[indexQuestion]
                    VStack {
                        Text("Scratch The Canvas and Guest the Character")
                            .font(.system(size: 30, weight: .bold, design: .rounded))
                            .foregroundColor(.black)
                            .shadow(color: Constants.ColorPalette.khaki, radius: 2, x: 0, y: 3)
                            .padding()
                        
                        ZStack {
                            Canvas { context, size in
                                for line in lines {
                                    var path = Path()
                                    path.addLines(line.points)
                                    //                        context.stroke(path, with: .color(line.color), lineWidth: line.lineWidth)
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
                                .mask {
                                    Image(currentQuestion.img)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: reader.size.width * 0.5, height: reader.size.width * 0.5)
                                }
                        }.alert(isPresented: self.$showingAlertEmpty){
                            Alert(title: Text("Fill the answer first"), message: Text("you haven't drop your answer yet"))
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
                            Alert(title: Text("Congratulations !"), message: Text("You got \(score) Siger Coins"),dismissButton: .default(Text("OK"),action: {
                                self.coin += score
                                self.level += score/self.level
                                self.played += 1
                                self.isShow = false
                                
                                
                            }))
                        }
                        
                        
                        HStack(alignment: .center) {
                            TextField("Drop Your Answer Here", text: self.$answerField)
                                .onSubmit {
                                    
                                    if(currentQuestion.answer == answerField.lowercased()){
                                        print("Answer True")
                                    }else{
                                        print("Answer False")
                                    }
                                    self.indexQuestion += 1
                                    self.lines = []
                                }
                                .frame(width: reader.size.width * 0.4, height: 30)
                                .padding(10)
                                .background(Constants.ColorPalette.whitesmoke)
                                .clipShape(Capsule())
                            
                            Button(action: {
                                if(lines.isEmpty){
                                    showingAlertScratchEmpty = true
                                }
                                
                                if(self.answerField == ""){
                                    self.showingAlertEmpty = true
                                }
                                
                                if(currentQuestion.answer == answerField.lowercased()){
                                    self.score += 1
                                }
                                
                                if( indexQuestion + 1 >= ChoiceQuizQuestionBank().questionList.count){
                                    self.showingAlertFinish = true
                                }else{
                                    self.indexQuestion += 1
                                    self.lines.removeAll()
                                    self.answerField = ""
                                }
                                
                            }){
                                Text("Submit")
                                    .font(.system(.title2, design: .rounded))
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                            }
                            .frame(height: 30)
                            .padding(10)
                            .background(Color.green)
                            .clipShape(Capsule())
                        }
                        .alert(isPresented: self.$showingAlertScratchEmpty){
                            Alert(title: Text("Your Canvas is Empty"), message: Text("you haven't scratch yet"))
                        }
                        
                    }
                    
                }
            }.ignoresSafeArea()
                .navigationTitle("Guest it Quiz")
        }}
}

//struct DrawingQuizView_Previews: PreviewProvider {
//    static var previews: some View {
//        DrawingQuizView()
//    }
//}

struct ColorPickerView: View {
    let colors = [Color.red, Color.orange, Color.green, Color.blue, Color.purple]
    @Binding var selectedColor: Color
    
    var body: some View {
        HStack {
            ForEach(colors, id: \.self){ color in
                Image(systemName: selectedColor == color ? Constants.Icons.recordCircleFill: Constants.Icons.circleFill)
                    .foregroundColor(color)
                    .font(.system(size: 25))
                    .clipShape(Circle())
                    .onTapGesture {
                        selectedColor = color
                    }
            }
        }
    }
}

struct ColorListView_Previews: PreviewProvider {
    static var previews: some View {
        ColorPickerView(selectedColor: .constant(.blue))
    }
}
