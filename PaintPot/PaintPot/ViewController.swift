//
//  ViewController.swift
//  PaintPot
//
//  Created by Kevin Zyskowski on 9/29/18.
//  Copyright © 2018 Kevin Zyskowski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var drawingView: DrawingView!
    @IBOutlet weak var sizeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func erasePressed(_ sender: UIButton) {
        drawingView.clear()
    }
    
    @IBAction func redPressed(_ sender: UIButton) {
        drawingView.changeColor(to: UIColor.red)
    }
    
    @IBAction func greenPressed(_ sender: Any) {
        drawingView.changeColor(to: UIColor.green)
    }
    
    @IBAction func bluePressed(_ sender: UIButton) {
        drawingView.changeColor(to: UIColor.blue)
    }
    
    @IBAction func blackPressed(_ sender: UIButton) {
        drawingView.changeColor(to: UIColor.black)
    }
    
    @IBAction func minusPressed(_ sender: UIButton) {
        drawingView.decrementSize()
        sizeLabel.text = "Brush Size: \(drawingView.getSize())"
    }
    
    @IBAction func plusPressed(_ sender: UIButton) {
        drawingView.incrementSize()
        sizeLabel.text = "Brush Size: \(drawingView.getSize())"
    }
    
}
