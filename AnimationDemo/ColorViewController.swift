//
//  ColorViewController.swift
//  AnimationDemo
//
//  Created by Brian Wang on 11/12/17.
//  Copyright © 2017 BW. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ColorViewController.didTap(recognizer:)))
        self.view.addGestureRecognizer(gestureRecognizer)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func didTap(recognizer:UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.2, animations: {
            self.view.backgroundColor = UIColor.random()
        })
        
        createAndAnimate()
    }
    
    //ONLY IF WE HAVE TIME
    func createAndAnimate() {
        //create
        let view = UIView(frame: CGRect(x: self.view.frame.width / 2 - 50, y: self.view.frame.height / 2 - 50, width: 100, height:100))
        view.alpha = 0
        view.transform = view.transform.scaledBy(x: 0.25, y: 0.25)
        view.backgroundColor = UIColor.random()
        self.view.addSubview(view)
        
        //animate in
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            view.alpha = 1
            view.transform = CGAffineTransform(rotationAngle: CGFloat.pi).scaledBy(x: 1.5, y: 1.5)
        }, completion: { done in
            self.fadeView(view: view)
        })
    }
    
    func fadeView(view: UIView) {
        //animate out
        UIView.animate(withDuration: 0.5, animations: {
            view.alpha = 0
        }, completion: {done in
            view.removeFromSuperview()
        })
    }

}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(red: CGFloat.random(), green: CGFloat.random(), blue: CGFloat.random(), alpha: 1)
    }
}

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(Float(arc4random()) / Float(UINT32_MAX))
    }
}
