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
    let margin: Int = 20
    var diameter: Int = 50
    var score: Int = 0
    var time: Int = 5
    var timer = Timer()
    var wasHit: Bool = false
    var totalMoles: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }

    func initialize() {
        //Capturing screen dimensions
        screenWidth = Int(screenSize.width)
        screenHeight = Int(screenSize.height)
        
        //Background setup
        background.frame = CGRect(x: margin,y: margin * 3, width: screenWidth - (margin * 2), height: screenHeight - margin * 4)
        background.backgroundColor = UIColor.green
        view.addSubview(background)
        
        //Score label setup
        scoreLabel.frame = CGRect(x: margin, y: margin * 2, width: screenWidth - (margin * 2), height: margin)
        scoreLabel.text = String(score)
        view.addSubview(scoreLabel)
        
        //Initial mole and timer configuration
        timer = Timer.scheduledTimer(timeInterval: Double(time), target: self, selector: #selector(updateButton), userInfo: nil, repeats: true)
        firstButton.frame = getRandomPosition()
        firstButton.backgroundColor = UIColor.brown
        firstButton.addTarget(self, action:#selector(buttonPressed(_:)), for: .touchUpInside)
        view.addSubview(firstButton)
        self.view = view
    }
    
    //If the button is pressed, do this
    @objc func buttonPressed(_ sender: UIButton!) {
        timer.invalidate()
        wasHit = true
        updateButton()
        timer = Timer.scheduledTimer(timeInterval: Double(time), target: self, selector: #selector(updateButton), userInfo: nil, repeats: true)
    }
    
    //Updates score and mole location
    @objc func updateButton() {
        totalMoles += 1
        score = wasHit ? score + 1 : score - 1
        scoreLabel.text = String(score)
        if totalMoles <= 10 { //if less than 10 moles have been in play, continue
            wasHit = false
            firstButton.isHidden = true
            firstButton.frame = getRandomPosition()
            firstButton.isHidden = false
            view.addSubview(firstButton)
            self.view = view
        } else { //after 10th mole, end game
            timer.invalidate()
            firstButton.isHidden = true
            scoreLabel.text = "Final score: " + String(score)
        }
    }
    
    //Generates CGRect for mole to appear at
    func getRandomPosition() -> CGRect {
        let maxXRight: Int = (screenWidth - 20) - diameter
        let maxYBottom: Int = (screenHeight - 20) - diameter
        let randomX: Int = Int.random(in: 20...maxXRight)
        let randomY: Int = Int.random(in: 20...maxYBottom - 56) + 56
        return CGRect(x: randomX, y: randomY, width: diameter, height: diameter)
    }
    
}

