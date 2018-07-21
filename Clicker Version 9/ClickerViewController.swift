//
//  ViewController.swift
//  Clicker Version 9
//
//  Created by Soon Yin Jie on 21/7/18.
//  Copyright © 2018 Tinkercademy. All rights reserved.
//

import UIKit

class ClickerViewController: UIViewController {
    
    static let UNWIND_IDENTIFIER = "unwindFromClicker"
    let EXIT_ANIMATION_DURATION = 0.6
    let PULSE_ANIMATION_DURATION = 2.5
    let COUNTDOWN_ANIMATION_DURATION = 1.2

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var countdownLabel: UILabel!
    var counter = 0
    var time: Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.isHidden = true
        view.backgroundColor = .red
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        
        UIView.animate(withDuration: COUNTDOWN_ANIMATION_DURATION, animations: {
            self.countdownLabel.alpha = 0
            self.countdownLabel.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
            self.view.backgroundColor = .orange
        }, completion: { (_) in
            
            // NOT ANIMATED
            self.countdownLabel.alpha = 1
            self.countdownLabel.transform = CGAffineTransform.identity
            self.countdownLabel.text = "2"
            
            // ANIMATED
            UIView.animate(withDuration: self.COUNTDOWN_ANIMATION_DURATION, animations: {
                self.countdownLabel.alpha = 0
                self.countdownLabel.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
                self.view.backgroundColor = .yellow
            }, completion: { (_) in
                
                // NOT ANIMATED
                self.countdownLabel.alpha = 1
                self.countdownLabel.transform = CGAffineTransform.identity
                self.countdownLabel.text = "1"

                // ANIMATED
                UIView.animate(withDuration: self.COUNTDOWN_ANIMATION_DURATION, animations: {
                    self.countdownLabel.alpha = 0
                    self.countdownLabel.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
                    self.view.backgroundColor = .green
                }, completion: { (_) in
                    
                    // NOT ANIMATED
                    self.countdownLabel.alpha = 1
                    self.countdownLabel.transform = CGAffineTransform.identity
                    self.countdownLabel.text = "GO"
                    
                    UIView.animate(withDuration: self.COUNTDOWN_ANIMATION_DURATION, animations: {
                        self.countdownLabel.alpha = 0
                        self.countdownLabel.transform = CGAffineTransform(scaleX: 3.0, y: 3.0)
                        self.view.backgroundColor = UIColor.cyan

                    }, completion: { (_) in
                        
                        // NOT ANIMATED
                        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (_) in
                            self.time += 0.1
                        }
                        self.countdownLabel.isHidden = true
                        self.label.isHidden = false

                        
                    })

                })
                
            })
            
            
            
        })
        
        
        
        UIView.animate(withDuration: PULSE_ANIMATION_DURATION,
                       delay: 0,
                       options: [.autoreverse, .repeat, .allowUserInteraction],
                       animations: {
                        self.label.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
                                                .concatenating(CGAffineTransform(rotationAngle: .pi))
        }, completion: nil)
        
        
    }

    @IBAction func tapped(_ sender: Any) {
        counter += 1
        label.text = String(counter)
        if counter == 30 {
            print("You're done! You took \(time) seconds")
            UIView.animate(withDuration: EXIT_ANIMATION_DURATION) {
            }
            
            UIView.animate(withDuration: EXIT_ANIMATION_DURATION, animations: {
                self.view.backgroundColor = .red
            }) { (_) in
                self.performSegue(withIdentifier: ClickerViewController.UNWIND_IDENTIFIER, sender: self)
                self.time -= Float(self.EXIT_ANIMATION_DURATION)
            }
            
        }
    }
    
}

