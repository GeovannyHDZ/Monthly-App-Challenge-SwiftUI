//
//  ConncetFourModel.swift
//  ConnectFour
//
//  Created by Angel Hernández Alegría on 10/06/22.
//

import Foundation

struct Conn4 {
    private var piecesBox: Set<Piece> = []
    private var whoseTurn: Player = .red
    
    mutating func dropAt(col: Int){
        let numPiecesAtCol = numPieces(at: col)
        piecesBox.insert(Piece(col: col, row: numPiecesAtCol, player: whoseTurn))
        whoseTurn = whoseTurn == .red ? .yellow : .red
        
        if verticalCount(col: col, row: numPiecesAtCol, player: whoseTurn) == 4{
            print("Game won by \(whoseTurn)")
        }
    }
    func verticalCount(col: Int, row: Int, player: Player) -> Int{
        if piencesAt(col: col, row: row)?.player != player{
            return 0
        }
        if row == 0 {
            return 0
        }
        return 1 + verticalCount(col: col, row: row - 1, player: player)
    }
    
    func piencesAt(col: Int, row: Int) -> Piece? {
        for piece in piecesBox {
            if piece.col == col && piece.row == row {
                return piece
            }
        }
        return nil
    }
    func numPieces(at col: Int) -> Int {
        var count = 0
        for piece in piecesBox {
            if piece.col == col {
                count += 1
            }
        }
        return count
    }
    mutating func reset(){
        piecesBox.removeAll()
        whoseTurn = .red
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
