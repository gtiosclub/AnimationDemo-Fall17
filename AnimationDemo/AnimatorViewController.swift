//
//  AnimatorViewController.swift
//  AnimationDemo
//
//  Created by Brian Wang on 11/13/17.
//  Copyright © 2017 BW. All rights reserved.
//

import UIKit

class AnimatorViewController: UIViewController {
    
    var animator: UIViewPropertyAnimator!
    var animatedView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        reset()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func reset() {
        // if it exists
        animatedView?.removeFromSuperview()
        
        let width:CGFloat = 100.0
        animatedView = UIView()
        animatedView.frame = CGRect(x: self.view.frame.width / 2 - width / 2, y: 0, width: width, height: width)
        animatedView.backgroundColor = UIColor.random()
        self.view.addSubview(animatedView)
        
        animator = UIViewPropertyAnimator(duration: 5, curve: .easeInOut, animations: {
            self.animatedView.frame = self.animatedView.frame.offsetBy(dx: 0, dy: self.view.frame.height)
            self.animatedView.backgroundColor = UIColor.random()
        })
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        switch(animator.state) {
        case .inactive:
            reset()
            animator.startAnimation()
            break
        case .active:
            if animator.isRunning {
                animator.pauseAnimation()
            } else {
                animator.addAnimations {
                    self.animatedView.transform = CGAffineTransform(rotationAngle: CGFloat.pi).scaledBy(x: 2, y: 2)
                }
                animator.startAnimation()
            }
            break
        case .stopped:
            break
        }
    }
}
