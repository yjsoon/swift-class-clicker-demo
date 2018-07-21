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

    @IBOutlet weak var label: UILabel!
    var counter = 0
    var time: Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (_) in
            self.time += 0.1
        }
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
                self.time -= EXIT_ANIMATION_DURATION
            }
            
        }
    }
    
}

