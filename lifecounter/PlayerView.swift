//
//  PlayerView.swift
//  lifecounter
//
//  Created by Matthew Karyadi on 4/26/22.
//

import UIKit

class PlayerView: UIView {
    var vc : ViewController?
    var playerNumber : Int = 0
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    @IBOutlet weak var playerLife: UILabel!
    
    var playerLifeTotal = 20
    
    func update(_ amount: Int, _ direction: Bool) {
        vc?.addButton.isEnabled = false
        vc?.removeButton.isEnabled = false
        playerLife.text = String(playerLifeTotal)
        if direction {
            vc?.history.append("Player \(playerNumber) gained \(amount) life.")
        } else {
            vc?.history.append("Player \(playerNumber) lost \(amount) life.")
        }
        if playerLifeTotal <= 0 {
            let alert = UIAlertController(title: "Game Over!", message: "Player \(playerNumber) loses!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {_ in
                self.vc?.reset()
            }))
            vc?.present(alert, animated: true)
        }
    }
    
    
    @IBAction func playerPlusOne(_ sender: Any) {
        playerLifeTotal += 1
        update(1, true)
    }

    
    @IBAction func playerMinusOne(_ sender: Any) {
        playerLifeTotal -= 1
        update(1, false)
    }
    
    
    @IBAction func playerPlusCustom(_ sender: Any) {
        let alert = UIAlertController(title: "Add Life to This Player", message: "Add how much life?", preferredStyle: .alert)
        var toAdd = 0
        
        alert.addAction(UIAlertAction(title: "OK",
                                      style: .default,
                                      handler: {_ in
            toAdd = Int(alert.textFields![0].text!) ?? 0
            NSLog("\"OK\" pressed. Adding \(toAdd) life...")
            self.playerLifeTotal += toAdd
            if toAdd != 0 {
                self.update(toAdd, true)
            }
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel",
                                      style: .default,
                                      handler: {_ in
            NSLog("\"Cancel\" pressed.")
        }))
        
        alert.addTextField { textField in
            textField.keyboardType = UIKeyboardType.numberPad
        }
        
        vc?.present(alert, animated: true)
    }
    
    
    
    @IBAction func playerMinusCustom(_ sender: Any) {
        let alert = UIAlertController(title: "Subtract Life From This Player", message: "Subtract how much life?", preferredStyle: .alert)
        var toSub = 0
        
        alert.addAction(UIAlertAction(title: "OK",
                                      style: .default,
                                      handler: {_ in
            toSub = Int(alert.textFields![0].text!) ?? 0
            NSLog("\"OK\" pressed. Subtracting \(toSub) life...")
            self.playerLifeTotal -= toSub
            if toSub != 0 {
                self.update(toSub, false)
            }
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel",
                                      style: .default,
                                      handler: {_ in
            NSLog("\"Cancel\" pressed.")
        }))
        
        alert.addTextField { textField in
            textField.keyboardType = UIKeyboardType.numberPad
        }
        
        vc?.present(alert, animated: true)
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
