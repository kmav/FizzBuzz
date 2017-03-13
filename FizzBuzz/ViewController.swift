//
//  ViewController.swift
//  FizzBuzz
//
//  Created by Konstantinos M on 6/2/17.
//  Copyright © 2017 Lumicsoft. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var game : Game?
    var gameScore: Int? {
        didSet {
            guard let unwrappedScore = gameScore else {
                print("gameScore is nil")
                return
            }

            numberButton.setTitle("\(unwrappedScore)", for: .normal)
            numberButton.titleLabel?.adjustsFontSizeToFitWidth = true
            numberButton.titleLabel?.minimumScaleFactor = 0.3
            
//            numberButton.titleLabel!.numberOfLines = 0
//            numberButton.titleLabel!.lineBreakMode = NSLineBreakMode.byWordWrapping

        }
    }
    
    @IBOutlet var numberButton: UIButton!
    @IBOutlet var fizzButton: UIButton!
    @IBOutlet var buzzButton: UIButton!
    @IBOutlet var fizzbuzzButton: UIButton!
    @IBOutlet var playAgain: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        game = Game()
        guard let checkedGame = game else {
            print("Game is nil")
            return
        }
        
        gameScore = checkedGame.score
    }

    override func viewWillAppear(_ animated: Bool) {
        numberButton.setTitle("0", for: .normal)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func play(move: Move) {
        guard let unwrappedGame = game else {
            print("Game is nil!")
            return
        }
        let response = unwrappedGame.play(move: move)
        gameScore = response.score
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        switch sender {
        case numberButton:
            play(move: Move.Number)
        case fizzButton:
            play(move: Move.Fizz)
        case buzzButton:
            play(move: Move.Buzz)
        case fizzbuzzButton:
            play(move: Move.FizzBuzz)
        case playAgain:
            play(move: Move.Restart)
        default:
            print("Invalid selection")
        }
    }
}

