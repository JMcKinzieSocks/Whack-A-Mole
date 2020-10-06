//
//  ViewController.swift
//  Whack-A-Mole
//
//  Created by McKinzie, Jackson D on 10/6/20.
//  Copyright © 2020 McKinzie, Jackson D. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonPressed(_ sender: Any) {
        scoreLabel.text = String((Int(scoreLabel.text ?? "0") ?? 0) + 1)
        print("It worked!")
    }
    
}

