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
    var winningCountRed: Int = 2
    var winningCountYellow: Int = 3
    
    
    mutating func dropAt(col: Int){
        let numPiecesAtCol = numPieces(at: col)
        piecesBox.insert(Piece(col: col, row: numPiecesAtCol, player: whoseTurn))
        
        if verticalCount(col: col, row: numPiecesAtCol, player: whoseTurn) == 4 {
            print("game won vertically by player: \(whoseTurn)")
            sumScore()
            print(winningCountRed); print(winningCountYellow)
        } else if leftCount(col: col, row: numPiecesAtCol, player: whoseTurn) + rightCount(col: col, row: numPiecesAtCol, player: whoseTurn) - 1 == 4 {
            print("game won horizontally by player: \(whoseTurn)")
            sumScore()
        } else if leftCountBL2TR(col: col, row: numPiecesAtCol, player: whoseTurn) + rightCountBL2TR(col: col, row: numPiecesAtCol, player: whoseTurn) - 1 == 4 {
            print("game won diagonally BL-TR by player: \(whoseTurn)")
            sumScore()
        } else if leftCountTL2BR(col: col, row: numPiecesAtCol, player: whoseTurn) + rightCountTL2BR(col: col, row: numPiecesAtCol, player: whoseTurn) - 1 == 4 {
            print("game won diagonally TL-BR by player: \(whoseTurn)")
            sumScore()
        }
        
        whoseTurn = whoseTurn == .red ? .yellow : .red
    }
    
    mutating func sumScore(){
        if whoseTurn == .red{  winningCountRed += 1  } else {  winningCountYellow += 1  }
    }
    
    
    
    /*
     bottom left to top right
     */
    func leftCountBL2TR(col: Int, row: Int, player: Player) -> Int {
        if piencesAt(col: col, row: row)?.player != player {
            return 0
        }
        if col == 0 || row == 0 {
            return 1
        }
        return 1 + leftCountBL2TR(col: col - 1, row: row - 1, player: player)
    }
    
    func rightCountBL2TR(col: Int, row: Int, player: Player) -> Int {
        if piencesAt(col: col, row: row)?.player != player {
            return 0
        }
        if col == 6 || row == 5 {
            return 1
        }
        return 1 + rightCountBL2TR(col: col + 1, row: row + 1, player: player)
    }
    
    /*
     top left to bottom right
     */
    func leftCountTL2BR(col: Int, row: Int, player: Player) -> Int {
        if piencesAt(col: col, row: row)?.player != player {
            return 0
        }
        if col == 0 || row == 5 {
            return 1
        }
        return 1 + leftCountTL2BR(col: col - 1, row: row + 1, player: player)
    }
    
    func rightCountTL2BR(col: Int, row: Int, player: Player) -> Int {
        if piencesAt(col: col, row: row)?.player != player {
            return 0
        }
        if col == 6 || row == 0 {
            return 1
        }
        return 1 + rightCountTL2BR(col: col + 1, row: row - 1, player: player)
    }
    
    func leftCount(col: Int, row: Int, player: Player) -> Int {
        if piencesAt(col: col, row: row)?.player != player {
            return 0
        }
        if col == 0 {
            return 1
        }
        return 1 + leftCount(col: col - 1, row: row, player: player)
    }
    
    func rightCount(col: Int, row: Int, player: Player) -> Int {
        if piencesAt(col: col, row: row)?.player != player {
            return 0
        }
        if col == 6 {
            return 1
        }
        return 1 + rightCount(col: col + 1, row: row, player: player)
    }
    
    func verticalCount(col: Int, row: Int, player: Player) -> Int {
        if piencesAt(col: col, row: row)?.player != player {
            return 0
        }
        if row == 0 {
            return 1
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
        winningCountRed = 0
        winningCountYellow = 0
    }
    
    enum Player {
        case red
        case yellow
        
        var isRed: Bool{
            self == .red
        }
    }
    
    struct Piece : Hashable {
        var col : Int
        var row : Int
        var player : Player
    }
    
    
    
}
