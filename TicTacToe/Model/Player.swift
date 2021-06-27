//
//  Player.swift
//  TicTacToe

//

import Foundation

enum PlayerType: String {
    case playerOne = "Player One"
    case playerTwo = "Player Two"
}

struct Player {
    var playerType: PlayerType
    var playerMoves: [Int]
    var isPlayerTurn: Bool
    var isPlayerWin: Bool = false
}
