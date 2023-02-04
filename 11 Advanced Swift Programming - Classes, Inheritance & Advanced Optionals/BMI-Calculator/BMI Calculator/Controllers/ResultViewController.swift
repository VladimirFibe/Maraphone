//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Vladimir Fibe on 2/4/23.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    var value = "0"
    override func viewDidLoad() {
        super.viewDidLoad()
        let label = UILabel()
        label.text = value
        label.frame = view.frame
        label.textAlignment = .center
        view.addSubview(label)
    
        view.backgroundColor = .systemBackground
    }
}
