//
//  ViewController.swift
//  LightsOff
//
//  Created by Kevin Zyskowski on 10/1/18.
//  Copyright © 2018 Kevin Zyskowski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var topLeftButton: UIButton!
    @IBOutlet weak var topCenterButton: UIButton!
    @IBOutlet weak var topRightButton: UIButton!
    
    @IBOutlet weak var middleLeftButton: UIButton!
    @IBOutlet weak var middleCenterButton: UIButton!
    @IBOutlet weak var middleRightButton: UIButton!

    @IBOutlet weak var bottomLeftButton: UIButton!
    @IBOutlet weak var bottomCenterButton: UIButton!
    @IBOutlet weak var bottomRightButton: UIButton!
    
    var buttons: [UIButton] = []
    
    @IBOutlet weak var scoreLabel: UILabel!
    var score: Int = 0
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if (sender.backgroundColor == UIColor.yellow) {
            sender.backgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1.0)
            
            buttons.randomElement()?.backgroundColor = UIColor.yellow
            
            score += 1
            scoreLabel.text = "\(score)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttons = [
            topLeftButton,
            topCenterButton,
            topRightButton,
            middleLeftButton,
            middleCenterButton,
            middleRightButton,
            bottomLeftButton,
            bottomCenterButton,
            bottomRightButton,
        ]
        
        buttons.randomElement()?.backgroundColor = UIColor.yellow
    }


}

