//
//  GameVC.swift
//  TicTacToe
//
//  Created by Kemal Ekren on 27.06.2021.
//

import UIKit

final class GameVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var playerLabel: UILabel!
    
    private let flowLayout = UICollectionViewFlowLayout()
    
    private let gameCell = "gameCell"
    private let grid = 9
    
    var vm : GameVM! {
        didSet {
            vm.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        navigationItem.title = "Tic Tac Toe"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "New Game", style: .plain, target: self, action: #selector(reloadGame))
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = flowLayout
    }
}

extension GameVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: gameCell, for: indexPath) as! GameCell
        cell.setupView()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let cell = collectionView.cellForItem(at: indexPath) as! GameCell
        
            if !cell.isCellUsed {
                let result = self.vm.checkScore(indexPath: indexPath.row)
                cell.player = result.player
                playerLabel.text = result.nextTurn
                cell.isCellUsed = true
            }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return grid
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.frame.size.width - 10) / 3
        return CGSize(width: size, height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    @objc private func reloadGame() {
        vm.resetGame()
    }
}

extension GameVC: GameVMOutputDelegate {
    func startNewGame() {
        playerLabel.text = "Player One"
        collectionView.reloadData()
    }
    
    func gameResult(player: Player?, result: GameResult) {
        switch result {
        case .win:
            if let player = player {
                showAlertViewWith(message: "\(player.playerType.rawValue) is Win")
            }
           
        case .tie:
            showAlertViewWith(message: "Game is tie")
        }
    }
    
    private func showAlertViewWith(message: String){
        let alert = UIAlertController(title: "Game Over", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { action in
            self.reloadGame()
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
