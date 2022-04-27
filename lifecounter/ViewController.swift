//
//  ViewController.swift
//  lifecounter
//
//  Created by Matthew Karyadi on 4/20/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var containerView: UIStackView!
    
    func reset() {
        for view in playerViews {
            view.playerLifeTotal = 20
            view.playerLife.text = String(20)
        }
    }
    
    var playerViews : [PlayerView] = []
    
    @IBAction func addPlayerPressed(_ sender: Any) {
        if playerViews.count < 4 {
            if let newPlayerView =
                Bundle.main.loadNibNamed("PlayerView", owner: self, options: nil)?.first! as? PlayerView {
                newPlayerView.vc = self
                newPlayerView.playerNumber = playerViews.count + 1
                playerViews.append(newPlayerView)
                containerView.addArrangedSubview(newPlayerView)
            }
        } else {
            let alert = UIAlertController(title: "Whoops!", message: "Can't add another player!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true)
        }
    }
    
    
    @IBAction func removePlayerPressed(_ sender: Any) {
        NSLog("Remove Pressed!")
        if playerViews.count > 2 {
            playerViews.last!.removeFromSuperview()
            playerViews.removeLast()
        } else {
            let alert = UIAlertController(title: "Whoops!", message: "Can't remove any more players!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let playerOneView =
            Bundle.main.loadNibNamed("PlayerView", owner: self, options: nil)?.first! as? PlayerView {
            playerOneView.vc = self
            playerOneView.playerNumber = 1
            playerViews.append(playerOneView)
            containerView.addArrangedSubview(playerOneView)
        }


        if let playerTwoView =
            Bundle.main.loadNibNamed("PlayerView", owner: self, options: nil)?.first! as? PlayerView {
            playerTwoView.vc = self
            playerTwoView.playerNumber = 2
            playerViews.append(playerTwoView)
            containerView.addArrangedSubview(playerTwoView)
        }
        
        
        if let playerThreeView =
            Bundle.main.loadNibNamed("PlayerView", owner: self, options: nil)?.first! as? PlayerView {
            playerThreeView.vc = self
            playerThreeView.playerNumber = 3
            playerViews.append(playerThreeView)
            containerView.addArrangedSubview(playerThreeView)
        }
        

        if let playerFourView =
            Bundle.main.loadNibNamed("PlayerView", owner: self, options: nil)?.first! as? PlayerView {
            playerFourView.vc = self
            playerFourView.playerNumber = 4
            playerViews.append(playerFourView)
            containerView.addArrangedSubview(playerFourView)
        }
    }
}
