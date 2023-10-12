# Juego4
Parte del juego para iniciar
//
//  dragtest.swift
//  app señas mk. 1
//
//  Created by Alumno on 12/10/23.
//

import SwiftUI

struct dragtest: View {
    
    @State private var usedWords = ("prueba")
    @State private var draggedColor: Color?
    @State private var colors: [Color] = [.purple, .blue, .cyan, .green, .yellow, .orange, .red]
    
    var body: some View {
        VStack(spacing: 10) {
            
            Text("Deletrea la siguiente palabra con la seña correspondiente")
            
            
            
            Image("smile")
                .resizable()
                .frame(width: 170.0, height: 170.0)
            
            
            HStack{
                
                Text("A")
                Text("B")
                Text("C")
                Text("D")
                Text("E")
            }
            
            
            HStack{
                
                ForEach(colors, id: \.self) { color in
                    DragBlock(backgroundColor: color)
                        .onDrag {
                            self.draggedColor = color
                            return NSItemProvider()
                        }
                        .onDrop(of: [.text],
                                delegate: DropViewDelegate(destinationItem: color, colors: $colors, draggedItem: $draggedColor)
                        )
                }
                
            }
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 10) {
                    Spacer()
                        .frame(height: 40)
                    
                    ForEach(colors, id: \.self) { color in
                        DragBlock(backgroundColor: color)
                            .onDrag {
                                self.draggedColor = color
                                return NSItemProvider()
                            }
                            .onDrop(of: [.text],
                                    delegate: DropViewDelegate(destinationItem: color, colors: $colors, draggedItem: $draggedColor)
                            )
                    }
                    
                    Spacer()
                }
                .padding(.horizontal, 20)
            }
            
        }
    }
}



struct DragBlock: View {
    let backgroundColor: Color
    var body: some View {
        HStack {
            Spacer()
            Text("letra")
            Spacer()
        }
        .padding(.vertical, 40)
        .background(backgroundColor)
        .cornerRadius(20)
    }
}

struct DropViewDelegate: DropDelegate {
    let destinationItem: Color
    @Binding var colors: [Color]
    @Binding var draggedItem: Color?
    
    func dropUpdated(info: DropInfo) -> DropProposal? {
        return DropProposal(operation: .move)}
    
    func performDrop(info: DropInfo) -> Bool {
        draggedItem = nil
        return true}
    
    func dropEntered(info: DropInfo) {
        // Swap Items
        if let draggedItem {
            let fromIndex = colors.firstIndex(of: draggedItem)
            if let fromIndex {
                let toIndex = colors.firstIndex(of: destinationItem)
                if let toIndex, fromIndex != toIndex {
                    withAnimation {
                        self.colors.move(fromOffsets: IndexSet(integer: fromIndex), toOffset: (toIndex > fromIndex ? (toIndex + 1) : toIndex))
}}}}}}


struct dragtest_Previews: PreviewProvider {
    static var previews: some View {
        dragtest()
    }
}
