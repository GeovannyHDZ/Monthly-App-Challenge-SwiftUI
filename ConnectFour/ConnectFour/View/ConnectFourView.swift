//
//  ContentView.swift
//  ConnectFour
//
//  Created by Angel Hernández Alegría on 10/06/22.
//

import SwiftUI

struct ConnectFourView: View {
    var body: some View {
        VStack{
            Board(conn4VM: Conn4VM())
                .padding()
        }
        
    }
}

struct Board: View{
    @ObservedObject var conn4VM: Conn4VM
    var body: some View{
        VStack {
            ScoreBoard()
            HStack {
                ForEach (0..<7){ col in
                    VStack {
                        ForEach (0..<6) { i in
                            Cell(piece: conn4VM.piencesAt(col: col, row: 5 - i))
                        }
                    }.contentShape(Rectangle())
                        .onTapGesture {
                            conn4VM.dropAt(col: col)
                        }
                }
            }
        }
        Button("Reset") {  conn4VM.reset()  }
        .font(.title)
    }
}

struct Cell: View{
    var piece: Conn4.Piece?
    var body: some View{
        ZStack{
            if let piece = piece {
                if piece.player == .red{
                    Circle().fill(Color.red)
                } else{
                    Circle().fill(Color.yellow)
                }
            }
            Circle().stroke(lineWidth: 2)
        }
        
    }
}

struct ScoreBoard: View{
    var score = Conn4VM()
    var body: some View{
        VStack {
            HStack{
                VStack {
                    Text("Red")
                        .font(.title)
                        .fontWeight(.bold)
                    Text(String(score.game.winningCountRed))
                        .fontWeight(.bold)
                }
                Image(systemName: "dice.fill").foregroundColor(Color.red)
                Spacer()
                Image(systemName: "dice.fill").foregroundColor(Color.yellow)
                VStack {
                    Text("Yellow")
                        .font(.title)
                        .fontWeight(.bold)
                    Text(String(score.game.winningCountYellow))
                        .fontWeight(.bold)
                }
                
            }.padding()
            HStack {
                Text("Turn")
                    .font(.headline)
                .fontWeight(.light)
                Image(systemName: "circle.circle").foregroundColor(.green)
            }
               
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ConnectFourView()
    }
}

// Create an flexible shape
//struct Cover : Shape{
//    func path(in rect: CGRect) -> Path {
//        var path = Path()
//
//        path.addRect(CGRect(x: 0 * rect.height, y: 0 * rect.height, width: 1 * rect.width, height: 1 * rect.height))
//
//        return path
//    }
//
//
//}
//
//
//
// Create an Struct for create an shape
//struct Board: Shape{
//    func path(in rect: CGRect) -> Path {
//        var path = Path()
//        // Horizontal Lines
//        for row in 0..<6{
//            path.move(to: CGPoint(x: 20, y: 30 + row * 20))
//            path.addLine(to: CGPoint(x: 140, y: 30 + row * 20))
//        }
//
//        // Vertical Lines
//        for colum in 0..<7{
//            path.move(to: CGPoint(x: 20 + colum * 20, y: 30))
//            path.addLine(to: CGPoint(x: 20 + colum * 20, y: 30 + 5 * 20))
//        }
//        return path
//    }
//}
