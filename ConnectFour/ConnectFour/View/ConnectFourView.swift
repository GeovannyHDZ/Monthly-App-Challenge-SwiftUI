//
//  ContentView.swift
//  ConnectFour
//
//  Created by Angel Hernández Alegría on 10/06/22.
//

import SwiftUI

struct ConnectFourView: View {
    var body: some View {
        ZStack {
            Board()
            
            
            
        }
    }
}

struct Board: View{
    var body: some View{
        HStack {
            ForEach (0..<7){ _ in
                VStack {
                    ForEach (0..<6) { _ in
                            ZStack {
                                Circle().stroke()
                            }
                    }
                }
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
//// Create an Struct for create an shape
////struct Board: Shape{
////    func path(in rect: CGRect) -> Path {
////        var path = Path()
////        // Horizontal Lines
////        for row in 0..<6{
////            path.move(to: CGPoint(x: 20, y: 30 + row * 20))
////            path.addLine(to: CGPoint(x: 140, y: 30 + row * 20))
////        }
////
////        // Vertical Lines
////        for colum in 0..<7{
////            path.move(to: CGPoint(x: 20 + colum * 20, y: 30))
////            path.addLine(to: CGPoint(x: 20 + colum * 20, y: 30 + 5 * 20))
////        }
////        return path
////    }
////}
