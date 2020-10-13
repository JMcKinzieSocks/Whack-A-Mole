//
//  ViewController.swift
//  Whack-A-Mole
//
//  Created by McKinzie, Jackson D on 10/6/20.
//  Copyright © 2020 McKinzie, Jackson D. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var background: UILabel = UILabel()
    var scoreLabel: UILabel = UILabel()
    var firstButton: UIButton = UIButton()
    
    let screenSize: CGRect = UIScreen.main.bounds
    var screenWidth: Int = 0
    var screenHeight: Int = 0
    var diameter: Int = 50
    var buttonHit: Bool = false
    var score: Int = 0
    var time: Int = 5
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        view.addSubview(firstButton)
        self.view = view
    }

    func initialize() {
        screenWidth = Int(screenSize.width)
        screenHeight = Int(screenSize.height)
        timer = Timer.scheduledTimer(timeInterval: Double(time), target: self, selector: #selector(updateButton), userInfo: nil, repeats: true)
        firstButton.frame = CGRect(x: screenWidth / 2,y: screenHeight / 3, width: diameter, height: diameter)
        firstButton.backgroundColor = UIColor.brown
        firstButton.addTarget(self, action:#selector(buttonPressed(_:)), for: .touchUpInside)
    }
    
    @objc func buttonPressed(_ sender: UIButton!) {
        buttonHit = true
        score += 1
        scoreLabel.text = String(score)
        timer.invalidate()
        updateButton()
        timer = Timer.scheduledTimer(timeInterval: Double(time), target: self, selector: #selector(updateButton), userInfo: nil, repeats: true)
    }
    
    @objc func updateButton() {
        print("It worked!")
        firstButton.isHidden = true
        let maxXRight: Int = (screenWidth - 20) - diameter
        let maxYBottom: Int = (screenHeight - 20) - diameter
        let randomX: Int = Int.random(in: 20...maxXRight)
        let randomY: Int = Int.random(in: 20...maxYBottom - 56) + 56
        firstButton.frame = CGRect(x: randomX, y: randomY, width: diameter, height: diameter)
        buttonHit = false
        firstButton.isHidden = false
        view.addSubview(firstButton)
        self.view = view
    }
    
    
}

