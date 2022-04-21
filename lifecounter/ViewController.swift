//
//  ViewController.swift
//  lifecounter
//
//  Created by Matthew Karyadi on 4/20/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var playerOneLife: UILabel!
    @IBOutlet weak var playerTwoLife: UILabel!
    @IBOutlet weak var losingLabel: UILabel!
    
    var playerOneLifeTotal = 20
    var playerTwoLifeTotal = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        playerOneLife.text = String(playerOneLifeTotal)
        playerTwoLife.text = String(playerTwoLifeTotal)
    }
    func updateLifeTotal (_ toUpdate: Int) -> Void {
        if toUpdate == 1 {
            playerOneLife.text = String(playerOneLifeTotal)
            if playerOneLifeTotal <= 0 {
                losingLabel.text = "Player 1 Loses!"
            }
        } else if toUpdate == 2 {
            playerTwoLife.text = String(playerTwoLifeTotal)
            if playerTwoLifeTotal <= 0 {
                losingLabel.text = "Player 2 Loses!"
            }
        } else {
            print("Tried to update an invalid life total, ignoring...")
        }
    }
    
    @IBAction func playerOneMinusFive(_ sender: Any) {
        playerOneLifeTotal -= 5
        updateLifeTotal(1)
    }
    
    @IBAction func playerOneMinusOne(_ sender: Any) {
        playerOneLifeTotal -= 1
        updateLifeTotal(1)
    }
    
    @IBAction func playerOnePlusOne(_ sender: Any) {
        playerOneLifeTotal += 1
        updateLifeTotal(1)
    }
    
    @IBAction func playerOnePlusFive(_ sender: Any) {
        playerOneLifeTotal += 5
        updateLifeTotal(1)
    }
    
    
    @IBAction func playerTwoMinusFive(_ sender: Any) {
        playerTwoLifeTotal -= 5
        updateLifeTotal(2)
    }
    
    @IBAction func playerTwoMinusOne(_ sender: Any) {
        playerTwoLifeTotal -= 1
        updateLifeTotal(2)
    }
    
    @IBAction func playerTwoPlusOne(_ sender: Any) {
        playerTwoLifeTotal += 1
        updateLifeTotal(2)
    }
    
    @IBAction func playerTwoPlusFive(_ sender: Any) {
        playerTwoLifeTotal += 5
        updateLifeTotal(2)
    }

    
    
}

