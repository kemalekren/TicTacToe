//
//  Player.swift
//  TicTacToe
//
//  Created by Kemal Ekren on 27.06.2021.
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
}
