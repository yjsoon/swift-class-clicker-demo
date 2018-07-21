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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func tapped(_ sender: Any) {
        counter += 1
        label.text = String(counter)
        if counter == 30 {
            print("You're done!")
        }
    }
    
}

