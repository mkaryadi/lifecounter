//
//  HistoryViewController.swift
//  lifecounter
//
//  Created by Matthew Karyadi on 4/26/22.
//

import UIKit

class HistoryViewController: UIViewController {

    @IBOutlet weak var historyLabel: UITextView!
    
    var history : [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        if history.isEmpty {
            historyLabel.text = "No history yet!"
        }
        for item in history.reversed() {
            historyLabel.text! += item
            historyLabel.text! += "\n"
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
