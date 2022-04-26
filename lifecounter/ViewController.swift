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
                let alert = UIAlertController(title: "Game Over!", message: "Player One Loses.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: {_ in
                    self.reset()
                }))
                self.present(alert, animated: true)
            }
        } else if toUpdate == 2 {
            playerTwoLife.text = String(playerTwoLifeTotal)
            if playerTwoLifeTotal <= 0 {
                let alert = UIAlertController(title: "Game Over!", message: "Player Two Loses.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: { _ in
                    self.reset()
                }))
                self.present(alert, animated: true)
            }
        } else {
            print("Tried to update an invalid life total, ignoring...")
        }
    }
    
    
    func reset () {
        //TODO: Impliment more complicated resetting behavior
        playerOneLifeTotal = 20
        playerTwoLifeTotal = 20
        updateLifeTotal(1)
        updateLifeTotal(2)
    }

    
    @IBAction func playerOneMinusOne(_ sender: Any) {
        playerOneLifeTotal -= 1
        updateLifeTotal(1)
    }
    
    @IBAction func playerOnePlusOne(_ sender: Any) {
        playerOneLifeTotal += 1
        updateLifeTotal(1)
    }
    
    @IBAction func playerOneMinusCustom(_ sender: Any) {
        let alert = UIAlertController(title: "Subtract Life From Player 2", message: "Subtract how much life?", preferredStyle: .alert)
        var toSub = 0
        
        alert.addAction(UIAlertAction(title: "OK",
                                      style: .default,
                                      handler: {_ in
            toSub = Int(alert.textFields![0].text!) ?? 0
            NSLog("\"OK\" pressed. Subtracting \(toSub) life...")
            self.playerOneLifeTotal -= toSub
            self.updateLifeTotal(1)
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel",
                                      style: .default,
                                      handler: {_ in
            NSLog("\"Cancel\" pressed.")
        }))
        
        alert.addTextField { textField in
            textField.keyboardType = UIKeyboardType.numberPad
        }
        
        self.present(alert, animated: true)
    }
    
    
    @IBAction func playerOnePlusCustom(_ sender: Any) {
        let alert = UIAlertController(title: "Add Life To Player 1", message: "Add how much life?", preferredStyle: .alert)
        var toAdd = 0
    
        alert.addAction(UIAlertAction(title: "OK",
                                      style: .default,
                                      handler: {_ in
            toAdd = Int(alert.textFields![0].text!) ?? 0
            NSLog("\"OK\" pressed. Adding \(toAdd) life...")
            self.playerOneLifeTotal += toAdd
            self.updateLifeTotal(1)
        }))
    
        alert.addAction(UIAlertAction(title: "Cancel",
                                      style: .default,
                                      handler: {_ in
            NSLog("\"Cancel\" pressed.")
        }))

        alert.addTextField { textField in
            textField.keyboardType = UIKeyboardType.numberPad
        }
        
        self.present(alert, animated: true)
        
    }
    
    
    
    @IBAction func playerTwoMinusOne(_ sender: Any) {
        playerTwoLifeTotal -= 1
        updateLifeTotal(2)
    }
    
    
    @IBAction func playerTwoPlusOne(_ sender: Any) {
        playerTwoLifeTotal += 1
        updateLifeTotal(2)
    }
    
    
    @IBAction func playerTwoMinusCustom(_ sender: Any) {
        let alert = UIAlertController(title: "Subtract Life From Player 2", message: "Subtract how much life?", preferredStyle: .alert)
        var toSub = 0
        
        alert.addAction(UIAlertAction(title: "OK",
                                      style: .default,
                                      handler: {_ in
            toSub = Int(alert.textFields![0].text!) ?? 0
            NSLog("\"OK\" pressed. Subtracting \(toSub) life...")
            self.playerTwoLifeTotal -= toSub
            self.updateLifeTotal(2)
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel",
                                      style: .default,
                                      handler: {_ in
            NSLog("\"Cancel\" pressed.")
        }))
        
        alert.addTextField { textField in
            textField.keyboardType = UIKeyboardType.numberPad
        }
        
        self.present(alert, animated: true)
    }
    
    
    @IBAction func playerTwoPlusCustom(_ sender: Any) {
        let alert = UIAlertController(title: "Add Life To Player 2", message: "Add how much life?", preferredStyle: .alert)
        var toAdd = 0
    
        alert.addAction(UIAlertAction(title: "OK",
                                      style: .default,
                                      handler: {_ in
            toAdd = Int(alert.textFields![0].text!) ?? 0
            NSLog("\"OK\" pressed. Adding \(toAdd) life...")
            self.playerTwoLifeTotal += toAdd
            self.updateLifeTotal(2)
        }))
    
        alert.addAction(UIAlertAction(title: "Cancel",
                                      style: .default,
                                      handler: {_ in
            NSLog("\"Cancel\" pressed.")
        }))

        alert.addTextField { textField in
            textField.keyboardType = UIKeyboardType.numberPad
        }
        
        self.present(alert, animated: true)
    }
}

