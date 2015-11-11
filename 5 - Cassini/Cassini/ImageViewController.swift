//
//  ImageViewController.swift
//  Cassini
//
//  Created by Steeve Pommier on 11/11/15.
//  Copyright © 2015 CostardRouge. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController, UIScrollViewDelegate {
    
    var imageURL: NSURL? {
        didSet {
            image = nil
            if view.window != nil {
                 fetchImage()
            }
           
        }
    }
    
    private func fetchImage() {
        if let url = imageURL {
            
            spinner?.startAnimating()
            let qos = Int(QOS_CLASS_USER_INITIATED.rawValue)
            
            dispatch_async(dispatch_get_global_queue(qos, 0), { () -> Void in
                
                let imageData = NSData(contentsOfURL: url)
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    if url == self.imageURL {
                        if imageData != nil {
                            self.image = UIImage(data: imageData!)
                        } else {
                            self.image = nil
                        }
                    }
                })
                
            })
        }
    }
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    private var imageView = UIImageView()
    
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.contentSize = imageView.frame.size
            scrollView.delegate = self
            scrollView.minimumZoomScale = 0.05
            scrollView.maximumZoomScale = 1
        }
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    private var image: UIImage? {
        get { return imageView.image }
        set {
            imageView.image = newValue
            imageView.sizeToFit()
            scrollView?.contentSize = imageView.frame.size
            spinner?.stopAnimating()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.addSubview(imageView)
        scrollView.addSubview(imageView)
        
//        if image == nil {
//            imageURL = DemoURL.ColoredSoldier
//        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if image == nil {
            fetchImage()
        }
    }

}
