//
//  GameContracts.swift
//  TicTacToe

//

import Foundation

enum GameResult {
    case tie
    case win
}

protocol GameVMProtocol: class {
    var delegate: GameVMOutputDelegate? { get set }
    func checkScore(move: Int) -> (player: Player, nextTurn: String)
    func resetGame()
}

protocol GameVMOutputDelegate: class {
    func gameResult(player: Player?, result: GameResult)
    func startNewGame()
}
