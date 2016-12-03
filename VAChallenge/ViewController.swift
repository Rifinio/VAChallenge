//
//  ViewController.swift
//  VAChallenge
//
//  Created by Adil BOUGAMZA on 03/12/2016.
//  Copyright © 2016 Adil Bougamza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.lightGray

        self.navigationItem.title = "Schedule"

        // add navigation item : clear
        let clearButtonItem :UIBarButtonItem = UIBarButtonItem(title: "Clear", style: .plain, target: self, action: #selector(self.clearButtonClick))
        self.navigationItem.setRightBarButton(clearButtonItem, animated: true)
    }


    func clearButtonClick() {
        print("clear")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

