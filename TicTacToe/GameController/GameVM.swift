//
//  GameVM.swift
//  TicTacToe


import Foundation

final class GameVM: GameVMProtocol {

    weak var delegate: GameVMOutputDelegate?
    private var player1 = Player(playerType: .playerOne, playerMoves: [], isPlayerTurn: true)
    private var player2 = Player(playerType: .playerTwo, playerMoves: [], isPlayerTurn: false)
    private var totalMoves: Int = 0
    private let winningPaths: Set<Set<Int>> = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    
    func checkScore(move: Int) -> (player: Player, nextTurn: String) {
        
        if self.player1.isPlayerTurn {
            totalMoves += 1
            player1.playerMoves.append(move)
            player1.isPlayerTurn = false
            
            if calculateScore(player: player1) {
                player1.isPlayerWin = true
                delegate?.gameResult(player: player1, result: .win)
            }
            return (player1, player2.playerType.rawValue)
            
        } else {
            totalMoves += 1
            player2.playerMoves.append(move)
            player1.isPlayerTurn = true
        
            if calculateScore(player: player2) {
                player2.isPlayerWin = true
                delegate?.gameResult(player: player2, result: .win)
            }
            return (player2, player1.playerType.rawValue)
        }
    }
    
    func resetGame() {
        player1.playerMoves = []
        player1.isPlayerTurn = true
        player2.playerMoves = []
        player2.isPlayerTurn = false
        totalMoves = 0
        delegate?.startNewGame()
    }
    
    private func calculateScore(player: Player) -> Bool {
        if totalMoves == 9 {
            delegate?.gameResult(player: nil, result: .tie)
            return false
        }
        
        let playerMoves = Set(player.playerMoves.compactMap { $0 })
        
        for pattern in winningPaths where pattern.isSubset(of: playerMoves) {
            return true
        }
        return false
    }
}
