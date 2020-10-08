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
    @IBOutlet weak var button: UIButton!
    var score: Int = 0
    let screenSize = UIScreen.main.bounds
    var screenWidth = 0
    var screenHeight = 0
    let diameter = 50
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screenWidth = Int(screenSize.width)
        screenHeight = Int(screenSize.height)
        button.frame = CGRect(x: 150,y: 200, width: diameter, height: diameter)
    }

    @IBAction func buttonPressed(_ sender: Any) {
        score += 1
        scoreLabel.text = String(score)
        print("It worked!")
        //button.isHidden = true
        let maxXRight = (screenWidth - 20) - diameter
        let maxYBottom = (screenHeight - 20) - diameter
        let randomX = Int.random(in: 20...maxXRight)
        let randomY = Int.random(in: 20...maxYBottom) + 56
        
        button.frame = CGRect(x: randomX, y: randomY, width: diameter, height: diameter)
        
    }
    
}

