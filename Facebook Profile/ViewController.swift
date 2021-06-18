//
//  ViewController.swift
//  Facebook Profile
//
//  Created by matthieu passerel on 09/08/2019.
//  Copyright © 2019 matthieu passerel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var coverIV: UIImageView!
    @IBOutlet weak var profileIV: UIImageView!
    @IBOutlet weak var storyBtn: UIButton!
    @IBOutlet var squareBtns: [UIButton]!
    
    var center: CGPoint?
     
    override func viewDidLoad() {
        super.viewDidLoad()
        storyBtn.layer.cornerRadius = 15
        for button in squareBtns {
            button.layer.cornerRadius = 15
        }
        profileIV.layer.cornerRadius = 75
        profileIV.layer.borderColor = UIColor.systemBackground.cgColor
        profileIV.layer.borderWidth = 4
        
        coverIV.isUserInteractionEnabled = true
        coverIV.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(gesture)))
    }
    
    //Touches
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let first = touches.first {
            if first.view == profileIV {
                center = profileIV.center
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let first = touches.first {
            if first.view == profileIV {
                profileIV.center = first.preciseLocation(in: self.view)
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let first = touches.first {
            if first.view == profileIV {
                if center != nil {
                    profileIV.center = center!
                }
            }
        }
    }
    
    
    //Gesture
    @objc func gesture() {
        UIView.animate(withDuration: 1) {
            if self.profileIV.layer.cornerRadius == 0 {
                self.profileIV.layer.cornerRadius = 75
            } else {
                self.profileIV.layer.cornerRadius = 0
            }
            
        }
    }
    
    //Simple
    @IBAction func storyButtonPressed(_ sender: Any) {
        storyBtn.backgroundColor = UIColor.systemTeal
    }
    
    //Multiple
    @IBAction func squareButtons(_ sender: UIButton) {
        coverIV.alpha = CGFloat(sender.tag)
    }
    
}

