//
//  HappinessViewController.swift
//  Happiness
//
//  Created by Steeve Pommier on 26/10/15.
//  Copyright © 2015 CostardRouge. All rights reserved.
//

import UIKit

class HappinessViewController: UIViewController, FaceViewDataSource
{
    @IBOutlet weak var faceView: FaceView! {
        didSet {
            faceView.dataSource = self
            faceView.addGestureRecognizer(UIPinchGestureRecognizer(target: faceView, action: "scale:"))
            //faceView.
        }
    }
    
    var happiness: Int = 100 {
        didSet {
            happiness = min(max(happiness, 0), 100)
            updateUI()
        }
    }
    
    private struct Constants {
        static let HappinessGestureScale: CGFloat = 2
    }
    
    @IBAction func changeHappiness(gesture: UIPanGestureRecognizer) {
        switch gesture.state {
        case .Ended: fallthrough
        case .Changed:
            let translation = gesture.translationInView(faceView)
            let happinessChange = Int(translation.y / Constants.HappinessGestureScale)
            if (happinessChange != 0) {
                happiness += happinessChange
                gesture.setTranslation(CGPointZero, inView: faceView)
            }
        default: break
        }
    }
    
    func smilinessForFaceView(sender: FaceView) -> Double? {
        return Double(happiness - 50) / 50
    }

    func updateUI() {
        faceView?.setNeedsDisplay()
        title = "\(happiness)"
    }
}
