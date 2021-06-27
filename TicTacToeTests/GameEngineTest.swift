//
//  GameEngineTest.swift
//  TicTacToeTests
//

//

import XCTest
@testable import TicTacToe

class GameEngineTest: XCTestCase {
    
    let vm = GameVM()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testPlayerTurn() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let result = vm.checkScore(move: 1)
        XCTAssertEqual(result.nextTurn, PlayerType.playerTwo.rawValue)
        
        let result2 = vm.checkScore(move: 2)
        XCTAssertEqual(result2.nextTurn, PlayerType.playerOne.rawValue)
    }
    
    func testMainGameLogic() throws {
        //Vertical Win Check
        
        var playerType = PlayerType.playerTwo.rawValue
        var isPlayerWin = false
        for move in [0,1,4,6,7,3,8,5] {
            playerType = vm.checkScore(move: move).player.playerType.rawValue
            isPlayerWin = vm.checkScore(move: move).player.isPlayerWin
        }
        
        XCTAssertEqual(playerType,PlayerType.playerOne.rawValue)
        XCTAssertEqual(isPlayerWin,true)
    }
    
    func testTie() {
        var isPlayerWin = true
        //Game Tie Check
        
        for move in  [1,2,3,4,5,7,6,0,8] {
            isPlayerWin = vm.checkScore(move: move).player.isPlayerWin
        }
        
        XCTAssertEqual(isPlayerWin,false)
    }
    
    func testDiagonalWin() throws {
        var playerType = PlayerType.playerTwo.rawValue
        var isPlayerWin = false
        
        //Diagonal Win Check
        
        for move in  [0,3,4,6,8,7] {
            playerType = vm.checkScore(move: move).player.playerType.rawValue
            isPlayerWin = vm.checkScore(move: move).player.isPlayerWin
        }
        
        XCTAssertEqual(playerType,PlayerType.playerOne.rawValue)
        XCTAssertEqual(isPlayerWin,true)
        
    }
    
    func testHorizontalWin() throws {
        //Horizontal Win Check

        var isPlayerWin = false
        
        for move in [1,3,6,4,7,5,8,2,0] {
            isPlayerWin = vm.checkScore(move: move).player.isPlayerWin
        }
    
        XCTAssertEqual(isPlayerWin,true)
    }

}
