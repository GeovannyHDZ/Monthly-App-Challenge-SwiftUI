//
//  ConncetFourModel.swift
//  ConnectFour
//
//  Created by Angel Hernández Alegría on 10/06/22.
//

import Foundation

struct Conn4 {
    private var piecesBox: Set<Piece> = [Piece(col: 0, row: 0, player: .yellow)]
    
    func dropAt(col: Int){  }
    
    func piencesAt(col: Int, row: Int) -> Piece? {
        for piece in piecesBox {
            if piece.col == col && piece.row == row {
                return piece
            }
        }
        return nil
    }
    
    enum Player {
        case red
        case yellow
    }
    
    struct Piece : Hashable {
        var col : Int
        var row : Int
        var player : Player
    }
}
