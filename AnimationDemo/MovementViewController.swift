//
//  MovementViewController.swift
//  AnimationDemo
//
//  Created by Brian Wang on 11/12/17.
//  Copyright © 2017 BW. All rights reserved.
//

import UIKit



//DECIDED TO SCRAP THIS
class MovementViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .darkGray
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true, block: { timer in
            self.createAndAnimate()
        })
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createAndAnimate() {
        let dropletView = newDropletView()
        self.view.addSubview(dropletView)
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseIn, animations: {
            dropletView.frame = dropletView.frame.offsetBy(dx: 0, dy: self.view.frame.height)
        }, completion: { done in
            dropletView.removeFromSuperview()
        })
    }
    
    func newDropletView() -> UIView {
        let dropletView = UIView()
        let x = Int(CGFloat.random() * self.view.frame.width)
        let y = 0
        let width = 6
        dropletView.frame = CGRect(x: x, y: y, width: width, height: width)
        dropletView.layer.cornerRadius = 3
        dropletView.clipsToBounds = true
        dropletView.backgroundColor = .white
        return dropletView
    }
    

}
