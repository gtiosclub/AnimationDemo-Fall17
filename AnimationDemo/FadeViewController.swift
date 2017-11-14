//
//  FadeViewController.swift
//  AnimationDemo
//
//  Created by Brian Wang on 11/12/17.
//  Copyright © 2017 BW. All rights reserved.
//

import UIKit

class FadeViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.alpha = 0
        label.alpha = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        UIView.animate(withDuration: 0.2, animations: {
            if self.imageView.alpha == 0 {
                self.imageView.alpha = 1
                self.imageView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
                self.label.alpha = 1
                self.label.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            } else {
                self.imageView.alpha = 0
                self.imageView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
                self.label.alpha = 0
                self.label.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
            }
        })
    }
    
    
    func fadeIn() {
        UIView.animate(withDuration: 0.5, animations: {
            self.imageView.alpha = 1
        })
    }
    
    func fadeInWithRunningAnimator() {
        let animator = UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
            self.imageView.alpha = 1
        }, completion: nil)
    }
    
}
