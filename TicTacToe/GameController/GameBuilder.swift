//
//  GameBuilder.swift
//  TicTacToe
//
//
//

import UIKit

final class GameBuilder {

    static func make()-> GameVC {
        let storyBoard = UIStoryboard(name: "GameVC", bundle: nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "GameVC") as! GameVC
        viewController.vm = GameVM()
        return viewController
    }
}
