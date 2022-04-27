//
//  ViewController.swift
//  lifecounter
//
//  Created by Matthew Karyadi on 4/20/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    
    func reset() {
        for view in playerViews {
            view.playerLifeTotal = 20
            view.playerLife.text = String(20)
        }
    }
    
    var playerViews : [PlayerView] = []
    
    @IBAction func addPlayerPressed(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let playerOneView =
            Bundle.main.loadNibNamed("PlayerView", owner: self, options: nil)?.first! as? PlayerView {
            playerOneView.vc = self
            playerOneView.playerNumber = 1
            playerOneView.frame = containerView.frame.offsetBy(dx: 0.0, dy: 0.0)
            playerOneView.frame.size.width = containerView.frame.size.width
            playerOneView.frame.size.height = containerView.frame.size.height / 4
            playerViews.append(playerOneView)
            view.addSubview(playerOneView)
        }


        if let playerTwoView =
            Bundle.main.loadNibNamed("PlayerView", owner: self, options: nil)?.first! as? PlayerView {
            playerTwoView.vc = self
            playerTwoView.playerNumber = 2
            playerTwoView.frame = containerView.frame.offsetBy(dx: 0.0, dy: containerView.frame.size.height / 4)
            playerTwoView.frame.size.height = containerView.frame.size.height / 4
            playerViews.append(playerTwoView)
            view.addSubview(playerTwoView)
        }

        if let playerThreeView =
            Bundle.main.loadNibNamed("PlayerView", owner: self, options: nil)?.first! as? PlayerView {
            playerThreeView.vc = self
            playerThreeView.playerNumber = 3
            playerThreeView.frame = containerView.frame.offsetBy(dx: 0.0, dy: containerView.frame.size.height / 2)
            playerThreeView.frame.size.height = containerView.frame.size.height / 4
            playerViews.append(playerThreeView)
            view.addSubview(playerThreeView)
        }
        
        if let playerFourView =
            Bundle.main.loadNibNamed("PlayerView", owner: self, options: nil)?.first! as? PlayerView {
            playerFourView.vc = self
            playerFourView.playerNumber = 4
            playerFourView.frame = containerView.frame.offsetBy(dx: 0.0, dy: containerView.frame.height - (containerView.frame.size.height / 4))
            playerFourView.frame.size.height = containerView.frame.size.height / 4
            playerViews.append(playerFourView)
            view.addSubview(playerFourView)
        }
    }
}
