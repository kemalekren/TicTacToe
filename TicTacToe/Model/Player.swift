//
//  Player.swift
//  TicTacToe
//
//  Created by Kemal Ekren on 27.06.2021.
//

import Foundation

enum PlayerType {
    case playerOne
    case playerTwo
}

struct Player {
    var playerName: PlayerType
    var positions: [Int]
    var isPlayerTurn: Bool
    var boardIndex: Int?
}
