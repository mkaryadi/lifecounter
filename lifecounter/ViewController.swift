//
//  ViewController.swift
//  lifecounter
//
//  Created by Matthew Karyadi on 4/20/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var playerLife: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let playerView =
            Bundle.main.loadNibNamed("PlayerView", owner: self, options: nil)?.first! as? UIView {
            playerView.frame = containerView.frame.offsetBy(dx: 0.0, dy: 0.0)
            view.addSubview(playerView)
        }
    }
    
    
    var playerLifeTotal = 20
    
    func update() {
        playerLife.text = String(playerLifeTotal)
    }
    
    
    @IBAction func playerPlusOne(_ sender: Any) {
        playerLifeTotal += 1
        update()
    }

    
    @IBAction func playerMinusOne(_ sender: Any) {
        playerLifeTotal -= 1
        update()
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
            self.update()
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
    
    
    
    @IBAction func playerMinusCustom(_ sender: Any) {
        let alert = UIAlertController(title: "Subtract Life From This Player", message: "Subtract how much life?", preferredStyle: .alert)
        var toSub = 0
        
        alert.addAction(UIAlertAction(title: "OK",
                                      style: .default,
                                      handler: {_ in
            toSub = Int(alert.textFields![0].text!) ?? 0
            NSLog("\"OK\" pressed. Subtracting \(toSub) life...")
            self.playerLifeTotal -= toSub
            self.update()
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
