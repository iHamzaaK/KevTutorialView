//
//  ViewController.swift
//  SampleApp
//
//  Created by Hamza Khan on 21/11/2016.
//  Copyright © 2016 Hamza Khan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet   var kevView : kevTutorialView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        kevView.arrTutorialImage = ["6","9","6","9","6"]
//        kevView.imageScale = UIViewContentMode.ScaleAspectFit
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

