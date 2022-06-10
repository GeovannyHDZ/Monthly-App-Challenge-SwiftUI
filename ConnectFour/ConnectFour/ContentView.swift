//
//  ContentView.swift
//  ConnectFour
//
//  Created by Angel Hernández Alegría on 10/06/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Board().stroke(Color.red, lineWidth: 1)
            Board().stroke(Color.cyan, lineWidth: 2)
            Board().stroke(Color.pink, lineWidth: 3)
            Board().stroke(Color.purple, lineWidth: 4)
        }
    }
}

// Create an Struct for create an shape
struct Board: Shape{
    func path(in rect: CGRect) -> Path {
        var path = Path()
        // Horizontal Lines
        for row in 0..<6{
            path.move(to: CGPoint(x: 20, y: 30 + row * 20))
            path.addLine(to: CGPoint(x: 140, y: 30 + row * 20))
        }
        
        // Vertical Lines
        for colum in 0..<7{
            path.move(to: CGPoint(x: 20 + colum * 20, y: 30))
            path.addLine(to: CGPoint(x: 20 + colum * 20, y: 30 + 5 * 20))
        }
        return path
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
