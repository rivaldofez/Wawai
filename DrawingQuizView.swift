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
    
    var body: some View {
        VStack {
            Canvas { context, size in
                for line in lines {
                    var path = Path()
                    path.addLines(line.points)
                    context.stroke(path, with: .color(line.color), lineWidth: line.lineWidth)
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
                ).mask{
                    Image("ca")
                        .resizable()
                }
            
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
        }.padding()
    }
}

struct DrawingQuizView_Previews: PreviewProvider {
    static var previews: some View {
        DrawingQuizView()
    }
}

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
