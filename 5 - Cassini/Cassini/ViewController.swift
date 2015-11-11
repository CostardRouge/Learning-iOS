//
//  ViewController.swift
//  Cassini
//
//  Created by Steeve Pommier on 11/11/15.
//  Copyright © 2015 CostardRouge. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let ivc = segue.destinationViewController as? ImageViewController {
            if let identifier = segue.identifier {
                switch identifier {
                case "ColoredSoldier":
                    ivc.imageURL = DemoURL.ColoredSoldier
                    ivc.title = "ColoredSoldier"
                case "RobotAndI":
                    ivc.imageURL = DemoURL.RobotAndI
                    ivc.title = "RobotAndI"
                case "DarthVader":
                    ivc.imageURL = DemoURL.DarthVader
                    ivc.title = "DarthVader"
                default: break
                }
            }
        }
    }
}

