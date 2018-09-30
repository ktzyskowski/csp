//
//  DrawingView.swift
//  PaintPot
//
//  Created by Kevin Zyskowski on 9/29/18.
//  Copyright © 2018 Kevin Zyskowski. All rights reserved.
//

import UIKit

class DrawingView: UIView {

    private var drawColor = UIColor.black    // A color for drawing
    private var lineWidth: CGFloat = 5        // A line width
    
    private var lastPoint: CGPoint!        // A point for storing the last position
    private var bezierPath: UIBezierPath!    // A bezier path
    private var pointCounter: Int = 0    // A counter of ponts
    private let pointLimit: Int = 128    // A limit of points
    private var preRenderImage: UIImage!    // A pre-render image
    
    func changeColor(to color: UIColor) {
        drawColor = color
    }
    
    func getSize() -> CGFloat {
        return lineWidth;
    }
    
    func incrementSize() {
        if lineWidth < 18 {
            lineWidth += 1
        }
    }
    
    func decrementSize() {
        if lineWidth > 1 {
            lineWidth -= 1
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initBezierPath()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        initBezierPath()
    }
    
    func initBezierPath() {
        bezierPath = UIBezierPath()
        bezierPath.lineCapStyle = CGLineCap.round
        bezierPath.lineJoinStyle = CGLineJoin.round
    }
    
    func renderToImage() {
        
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, 0.0)
        if preRenderImage != nil {
            preRenderImage.draw(in: self.bounds)
        }
        
        bezierPath.lineWidth = lineWidth
        drawColor.setFill()
        drawColor.setStroke()
        bezierPath.stroke()
        
        preRenderImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        if preRenderImage != nil {
            preRenderImage.draw(in: self.bounds)
        }
        
        bezierPath.lineWidth = lineWidth
        drawColor.setFill()
        drawColor.setStroke()
        bezierPath.stroke()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: AnyObject? = touches.first
        lastPoint = touch!.location(in: self)
        pointCounter = 0
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: AnyObject? = touches.first
        let newPoint = touch!.location(in: self)
        
        bezierPath.move(to: lastPoint)
        bezierPath.addLine(to: newPoint)
        lastPoint = newPoint
        
        pointCounter += 1
        
        if pointCounter == pointLimit {
            pointCounter = 0
            renderToImage()
            setNeedsDisplay()
            bezierPath.removeAllPoints()
        }
        else {
            setNeedsDisplay()
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        pointCounter = 0
        renderToImage()
        setNeedsDisplay()
        bezierPath.removeAllPoints()
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        touchesEnded(touches, with: event)
    }
    
    func clear() {
        preRenderImage = nil
        bezierPath.removeAllPoints()
        setNeedsDisplay()
    }
    
    func hasLines() -> Bool {
        return preRenderImage != nil || !bezierPath.isEmpty
    }

}
