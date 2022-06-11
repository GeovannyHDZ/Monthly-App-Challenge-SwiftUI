//
//  ConnectFourVM.swift
//  ConnectFour
//
//  Created by Angel Hernández Alegría on 10/06/22.
//

import SwiftUI

class Conn4VM: ObservableObject{
    @Published private var game = Conn4()
    
    func reset() {
        game.reset()
    }
    
    func piencesAt(col: Int, row: Int) -> Conn4.Piece? {
        game.piencesAt(col: col, row: row)
    }
    
    func dropAt(col: Int) {
        game.dropAt(col: col)
    }
    
    
}
