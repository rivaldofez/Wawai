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
    
    
    var mainCharacter: MainCharacterItem
    
    var body: some View {
        ZStack {
            Image("back")
                .resizable()
            
            VStack(alignment:.center) {
                
                GeometryReader{ reader in
                    Image(mainCharacter.image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 100)

                }
                
                Canvas { context, size in
                    for line in lines {
                        var path = Path()
                        path.addLines(line.points)
//                        context.stroke(path, with: .color(line.color), lineWidth: line.lineWidth)
                        context.stroke(path, with: .color(line.color), style: StrokeStyle(lineWidth: line.lineWidth, lineCap: .round))
                    }
                }.frame(minWidth: 400, minHeight: 400)
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
//                    .mask{
//                        Image("ca")
//                            .resizable()
//                    }
                
                HStack {
                    Text("Thickness")
                    Slider(value: $thickness, in: 1...20){
                    }.frame(maxWidth: 100)
                        .onChange(of: thickness){newThickness in
                            currentLine.lineWidth = newThickness
                        }
                    Divider()
                    ColorPickerView(selectedColor: $selectedColor).onChange(of: selectedColor){ newColor in
                        currentLine.color = newColor
                    }
                    Divider()
                    Button("Clear"){
                        self.lines = []
                        self.currentLine = Line(points: [], color: selectedColor, lineWidth: thickness)
                    }
                }.frame(maxHeight: 100)
            }
            
        }.ignoresSafeArea()
            .navigationTitle("Learn Main Character")
    }
}

//struct ExerciseCharacterView_Previews: PreviewProvider {
//    static var previews: some View {
//        ExerciseCharacterView(isShow: .constant(true), mainCharacter: <#T##MainCharacterItem#>)
//    }
//}
