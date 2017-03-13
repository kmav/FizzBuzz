//
//  ViewControllerUnitTests.swift
//  FizzBuzz
//
//  Created by Konstantinos M on 8/2/17.
//  Copyright © 2017 Lumicsoft. All rights reserved.
//

import XCTest
@testable import FizzBuzz

class ViewControllerUnitTests: XCTestCase {
    
    var viewController: ViewController!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        viewController = storyboard.instantiateViewController(withIdentifier:"ViewController") as! ViewController
        UIApplication.shared.keyWindow!.rootViewController = viewController
        
        let _ = viewController.view

    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
 
    func test() {
        XCTAssertTrue(true)
    }
    
    func testMove1IncrementsScore() {
        viewController.play(move: Move.Number)
        let newScore = viewController.gameScore
        XCTAssertEqual(newScore, 1)
    }

    func testMove2IncrementScore() {
        viewController.play(move: Move.Number)
        viewController.play(move: Move.Number)
        let newScore = viewController.gameScore
        XCTAssertEqual(newScore, 2)
    }

    func testHasAGame() {
        XCTAssertNotNil(viewController.game)
    }
    
    func testFizzIncrementScore() {
        viewController.game?.score = 2
        viewController.play(move: Move.Fizz)
        let newScore = viewController.gameScore
        XCTAssertEqual(newScore, 3)
    }

    func testBuzzIncrementScore() {
        viewController.game?.score = 4
        viewController.play(move: Move.Buzz)
        let newScore = viewController.gameScore
        XCTAssertEqual(newScore, 5)
    }

    func testFizzBuzzIncrementScore() {
        viewController.game?.score = 14
        viewController.play(move: Move.FizzBuzz)
        let newScore = viewController.gameScore
        XCTAssertEqual(newScore, 15)
    }

    // following incorrect move tests
    func testIncorrectNoIncrementScore() {
        viewController.game?.score = 14
        viewController.play(move: Move.Fizz)
        let newScore = viewController.gameScore
        XCTAssertEqual(newScore, 14)
    }

    // following incorrect move tests
    func testOnWrongMoveScoreNotIncremented() {
        viewController.play(move: Move.Fizz)
        let newScore = viewController.gameScore
        XCTAssertEqual(newScore, 0)
    }

    func testRestartScore() {
        viewController.game?.score = 14
        viewController.play(move: Move.Restart)
        let newScore = viewController.gameScore
        XCTAssertEqual(newScore, 0)
    }
    

}
