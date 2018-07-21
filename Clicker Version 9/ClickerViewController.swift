//
//  ViewController.swift
//  Clicker Version 9
//
//  Created by Soon Yin Jie on 21/7/18.
//  Copyright © 2018 Tinkercademy. All rights reserved.
//

import UIKit

class ClickerViewController: UIViewController {

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
        }
    }
    
}

