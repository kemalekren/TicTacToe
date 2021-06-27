//
//  GameContracts.swift
//  TicTacToe
//
//  Created by Kemal Ekren on 27.06.2021.
//

import Foundation

enum GameResult {
    case tie
    case win
}

protocol GameVMProtocol: class {
    var delegate: GameVMOutputDelegate? { get set }
    func checkScore(indexPath: Int) -> Player
}

protocol GameVMOutputDelegate: class {
    func gameResult(player: Player?, result: GameResult)
}
