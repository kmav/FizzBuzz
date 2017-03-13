//
//  GameTests.swift
//  FizzBuzz
//
//  Created by Konstantinos M on 7/2/17.
//  Copyright © 2017 Lumicsoft. All rights reserved.
//

import XCTest
@testable import FizzBuzz

class GameTests: XCTestCase {
    
    let game = Game()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGameStartsAtZero() {
        XCTAssertTrue(game.score == 0)
    }

    func testOnPlayScoreIncremented() {
        game.play(move: Move.Number)
        XCTAssertTrue(game.score == 1)
    }
 
    func testIfMoveIsRight() {
        game.score = 2
        let response = game.play(move: Move.Fizz)
        let result = response.right
        // play, increse score to 3, check score -> Fizz
        XCTAssertEqual(result, true)
    }

    func testIfMoveIsWrong() {
        game.score = 1
        let response = game.play(move: Move.Fizz)
        let result = response.right
        // play, increse score to 2, check score -> 2
        XCTAssertEqual(result, false)
    }

    func testBuzzMoveIsRight() {
        game.score = 4
        let response = game.play(move: Move.Buzz)
        let result = response.right
        XCTAssertEqual(result, true)
    }
    
    func testBuzzMoveIsWrong() {
        game.score = 3
        let response = game.play(move: Move.Buzz)
        let result = response.right
        XCTAssertEqual(result, false)
    }

    func testFizzBuzzMoveIsRight() {
        game.score = 14
        let response = game.play(move: Move.FizzBuzz)
        let result = response.right
        XCTAssertEqual(result, true)
    }
    
    func testFizzBuzzMoveIsWrong() {
        game.score = 15
        let response = game.play(move: Move.FizzBuzz)
        let result = response.right
        XCTAssertEqual(result, false)
    }

    func testNumberMoveIsRight() {
        game.score = 1
        let response = game.play(move: Move.Number)
        let result = response.right
        XCTAssertEqual(result, true)
    }
    
    func testNumberzMoveIsWrong() {
        game.score = 1
        game.play(move: Move.Number)
        let response = game.play(move: Move.Number)
        let result = response.right
        XCTAssertEqual(result, false)
    }

    func testIfMoveWrongScoreNotIncremented() {
        game.score = 1
        game.play(move: Move.Fizz)
        XCTAssertEqual(game.score, 1)
    }

    func testPlayShouldReturnIfMoveRight() {
        let response = game.play(move: Move.Number)
        XCTAssertNotNil(response.right)
    }
    
    func testPlayShouldReturnNewScore() {
        let response = game.play(move: Move.Number)
        XCTAssertNotNil(response.score)
    }

    func testRestartGame() {
        let response = game.play(move: Move.Restart)
        let result = response.right

        XCTAssertEqual(result, true)
        XCTAssertEqual(response.score, 0)
    }

    func testRestartGameAfterSomeMoves() {
        game.play(move: Move.Number)
        game.play(move: Move.Number)
        let response = game.play(move: Move.Restart)
        let result = response.right
        
        XCTAssertEqual(result, true)
        XCTAssertEqual(response.score, 0)
    }

    func testRestartGameAndPlayOne() {
        game.play(move: Move.Number)
        game.play(move: Move.Number)
        game.play(move: Move.Restart)
        let response = game.play(move: Move.Number)
        let result = response.right
        
        XCTAssertEqual(result, true)
        XCTAssertEqual(response.score, 1)
    }

}
