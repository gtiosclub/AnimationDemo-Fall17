//
//  FractionalViewController.swift
//  AnimationDemo
//
//  Created by Brian Wang on 11/14/17.
//  Copyright © 2017 BW. All rights reserved.
//

import UIKit

class FractionalViewController: UIViewController {
    
    var animator: UIViewPropertyAnimator!
    
    var myView:UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let gestureRecognizer = UIPanGestureRecognizer()
        gestureRecognizer.addTarget(self, action: #selector(FractionalViewController.handlePan(recognizer:)))
        self.view.addGestureRecognizer(gestureRecognizer)
        
        myView = UIView()
        myView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 0)
        myView.backgroundColor = .green
        view.addSubview(myView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func handlePan(recognizer: UIPanGestureRecognizer) {
        let height = self.view.frame.height
//        print(recognizer.state)
        switch recognizer.state {
        case .began:
            print("began")
            self.myView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 0)
            animator = UIViewPropertyAnimator(duration: 1.0, curve: .easeInOut, animations: {
                var rect = self.myView.frame
                self.myView.frame = CGRect(x: 0, y: 0, width: rect.width, height: self.view.frame.height)
            })
            animator.pauseAnimation()
            break
        case .changed:
            print("changed")
            let translation = recognizer.translation(in: myView)
            animator.fractionComplete = translation.y / height
            break
        case .ended:
            print("ended")
            animator.continueAnimation(withTimingParameters: nil, durationFactor: 0)
            break
        default:
            break
        }
    }
}
