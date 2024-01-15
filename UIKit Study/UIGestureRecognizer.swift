//
//  UIGestureRecognizer.swift
//  UIKit Study
//
//  Created by LMC60018 on 2024/1/15.
//

import UIKit

class GestureViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Swipe gesture
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(swipe(_:)))
        // Indicates that the direction of the listening slide is upward. Default slide is right.
        swipeUp.direction = .up
        view.addGestureRecognizer(swipeUp)
        
        // multiple directions
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(swipe(_:)))
        swipeDown.direction = .down
        view.addGestureRecognizer(swipeDown)
        
        
        // Swipe gesture at edges
        let swipeEdge = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(swipeEdge(_:)))
        swipeEdge.edges = UIRectEdge.left
        view.addGestureRecognizer(swipeEdge)
        
        
        // Single tap gesture
        let tapSingle = UITapGestureRecognizer(target: self, action: #selector(tapSingleDid))
        tapSingle.numberOfTapsRequired = 1
        tapSingle.numberOfTouchesRequired = 1
        // Double tap gesture
        let tapDouble = UITapGestureRecognizer(target: self, action: #selector(tapDoubleDid(_:)))
        tapDouble.numberOfTapsRequired = 2
        tapDouble.numberOfTouchesRequired = 1
        // Declare that the single click event will only be executed after the double click event detection fails
        tapSingle.require(toFail: tapDouble)
        view.addGestureRecognizer(tapSingle)
        view.addGestureRecognizer(tapDouble)
        
        
        // Pinch gesture
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(pinchDid(_:)))
        view.addGestureRecognizer(pinch)
        
        
        // Rotation gesture
        let rotation = UIRotationGestureRecognizer(target: self, action: #selector(rotationDid(_:)))
        view.addGestureRecognizer(rotation)
        
        
        // Pan gesture
        let rect1 = UIView(frame: CGRect(x: 50, y: 50, width: 100, height: 100))
        rect1.center = view.center
        rect1.backgroundColor = .orange
        view.addSubview(rect1)
        let pan1 = UIPanGestureRecognizer(target: self, action: #selector(panDid(_:)))
        pan1.maximumNumberOfTouches = 1
        rect1.addGestureRecognizer(pan1)
        let rect2 = UIView(frame: CGRect(x: 50, y: 50, width: 100, height: 100))
        rect2.center = view.center
        rect2.backgroundColor = .yellow
        view.addSubview(rect2)
        let pan2 = UIPanGestureRecognizer(target: self, action: #selector(panDid(_:)))
        pan2.maximumNumberOfTouches = 1
        rect2.addGestureRecognizer(pan2)
        
        
        // Long press gesture
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(longPressDid(_:)))
        view.addGestureRecognizer(longPress)
        
        
        // Supports multi touch
        view.isMultipleTouchEnabled = true
    }
    
    
    // Swipe Gesture
    @objc func swipe(_ recognizer: UISwipeGestureRecognizer) {
        if recognizer.direction == .up{
            print("swipe upwards")
        }else if recognizer.direction == .down{
            print("swipe downwards")
        }
        // the start point of swipe
        let point = recognizer.location(in: view)
        print ("(\(point.x), \(point.y))")
    }
    
    // Swipe gesture at edges
    @objc func swipeEdge(_ recognizer: UIScreenEdgePanGestureRecognizer) {
        print("left edgeswipe")
        let point = recognizer.location(in: view)
        print ("(\(point.x), \(point.y))")
    }
    
    // Single tap gesture
    @objc func tapSingleDid(){
        print("single tap")
    }
    // Double tap gesture
    @objc func tapDoubleDid(_ sender: UITapGestureRecognizer) {
        if sender.view == view {
            print ("double tap")
        }
    }
    
    // Pinch gesture
    @objc func pinchDid(_ recognizer: UIPinchGestureRecognizer) {
        // Real time acquisition of pinching ratio in monitoring methods
        print(recognizer.scale)
        // Obtain the coordinates of two touch points
        print(recognizer.location(ofTouch: 0, in: view))
        print(recognizer.location(ofTouch: 1, in: view))
    }
    
    // Rotation gesture
    @objc func rotationDid(_ recognizer: UIRotationGestureRecognizer) {
        print(recognizer.rotation*(180/CGFloat.pi))
    }
    
    // Pan gesture
    @objc func panDid(_ recognizer: UIPanGestureRecognizer) {
        let point = recognizer.location(in: view)
        recognizer.view?.center = point
    }
    
    // Long press gesture
    @objc func longPressDid(_ sender: UILongPressGestureRecognizer) {
        if sender.state == .began {
            print("long press began")
        } else {
            print("long press ended")
        }
    }
    
    
    // UITouch
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let t: UITouch = touch
            // When continuously tapped twice on the screen, the background returns to red
            if (t.tapCount == 2) {
                view.backgroundColor = .red
            } else if (t.tapCount == 1) {
                view.backgroundColor = .green
            }
            print("event began")
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let t: UITouch = touch
            print(t.location(in: view))
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        // When touching two points, calculate the distance and angle between the two points
        if touches.count == 2 {
            // Get touch points
            let first = (touches as NSSet).allObjects[0] as! UITouch
            let second = (touches as NSSet).allObjects[1] as! UITouch
            // Obtain touch point coordinates
            let firstPoit = first.location(in: view)
            let secondPoint = second.location(in: view)
            // Calculate the distance between two points
            let deltaX = secondPoint.x - firstPoit.x
            let deltaY = secondPoint.y - firstPoit.y
            let initialDistance = sqrt(deltaX * deltaX + deltaY * deltaY)
            print("the distance between two points is: \(initialDistance)")
            // Calculate the angle between two points
            let rads = atan(deltaY/(-deltaX))
            let degree = 180.0 * Double(rads) / .pi
            print("the angle between two points is: \(degree)")
        }
        print("event ended")
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("event cancelled")
    }
}
