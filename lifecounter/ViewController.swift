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
    
    @IBOutlet weak var playerOneMinusCustomButton: UIButton!
    @IBOutlet weak var playerOneMinusOneButton: UIButton!
    @IBOutlet weak var playerOnePlusOneButton: UIButton!
    @IBOutlet weak var playerOnePlusCustomButton: UIButton!
    @IBOutlet weak var playerTwoMinusCustomButton: UIButton!
    @IBOutlet weak var playerTwoMinusOneButton: UIButton!
    @IBOutlet weak var playerTwoPlusOneButton: UIButton!
    @IBOutlet weak var playerTwoPlusCustomButton: UIButton!
    
    var playerOneLifeTotal = 20
    var playerTwoLifeTotal = 20

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        playerOneLife.text = String(playerOneLifeTotal)
        playerTwoLife.text = String(playerTwoLifeTotal)
        
        // Flip the UI for Player One
        playerOneMinusCustomButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        playerOneMinusOneButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        playerOnePlusOneButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        playerOnePlusCustomButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        playerOneLife.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
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
    
    @IBAction func playerOneMinusCustom(_ sender: Any) {
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
    
    @IBAction func playerOnePlusCustom(_ sender: Any) {
        playerOneLifeTotal += 5
        updateLifeTotal(1)
    }
    
    
    @IBAction func playerTwoMinusCustom(_ sender: Any) {
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
    
    @IBAction func playerTwoPlusCustom(_ sender: Any) {
        let alert = UIAlertController(title: "Add Life To Player 2", message: "Add how much life?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK",
                                      style: .default,
                                      handler: {_ in
            NSLog("\"OK\" pressed.")
        }))
        alert.addAction(UIAlertAction(title: "Cancel",
                                      style: .default,
                                      handler: {_ in
            NSLog("\"Cancel\" pressed.")
        }))

        alert.addTextField { textField in
            textField.keyboardType = UIKeyboardType.numberPad
        }
        self.present(alert, animated: true, completion: {
            NSLog("The completion handler fired")
        })
        playerTwoLifeTotal += 5
        updateLifeTotal(2)
    }

    
    
}

