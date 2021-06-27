//
//  GameCell.swift
//  TicTacToe
//


import UIKit

final class GameCell: UICollectionViewCell {
    @IBOutlet weak var gameText: UILabel!
    
    var isCellUsed: Bool = false
    
    func setupView(){
        gameText.layer.borderWidth = 2.0
        gameText.text = ""
        gameText.layer.borderColor = UIColor.black.cgColor
    }
    
    var player: Player! {
        didSet {
            gameText.font = UIFont.systemFont(ofSize: gameText.bounds.size.height)
            if player.playerName == .playerOne {
                gameText.text = "X"
                
            } else {
                gameText.text = "O"
            }
        }
    }
}
