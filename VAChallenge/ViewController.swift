//
//  ViewController.swift
//  VAChallenge
//
//  Created by Adil BOUGAMZA on 03/12/2016.
//  Copyright © 2016 Adil Bougamza. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    let labelStartDate :UILabel = {
        let label = UILabel()
        return label
    }()

    let labelEndDate :UILabel = {
        let label = UILabel()
        return label
    }()

    let datePicker :UIDatePicker = {
        let datePicker :UIDatePicker = UIDatePicker()
        return datePicker
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpView()

        datePicker.addTarget(self, action: #selector(onDidChangeDate(sender:)), for: .valueChanged)
    }

    func onDidChangeDate(sender: UIDatePicker) {
        print("date changing")
    }

    private func setUpView(){
        self.view.backgroundColor = UIColor.white

        self.navigationItem.title = "Schedule"

        // add navigation item : clear
        let clearButtonItem :UIBarButtonItem = UIBarButtonItem(title: "Clear", style: .plain, target: self, action: #selector(self.clearButtonClick))
        self.navigationItem.setRightBarButton(clearButtonItem, animated: true)

        // add view ui elements
        let labelStartDateTitle :UILabel = UILabel()
        labelStartDateTitle.text = "Begin:"
        let labelEndDateTitle :UILabel = UILabel()
        labelEndDateTitle.text = "End Date:"

        self.view.addSubview(labelStartDateTitle)
        self.view.addSubview(labelStartDate)
        self.view.addSubview(labelEndDateTitle)
        self.view.addSubview(labelEndDate)
        self.view.addSubview(datePicker)

        // underline views
        let lineView1 = UIView()
        lineView1.backgroundColor = UIColor.gray
        let lineView2 = UIView()
        lineView2.backgroundColor = UIColor.gray
        let lineView3 = UIView()
        lineView3.backgroundColor = UIColor.gray

        self.view.addSubview(lineView1)
        self.view.addSubview(lineView2)
        self.view.addSubview(lineView3)

        // create constraints
        labelStartDateTitle.snp.makeConstraints { (make) in
            make.left.equalTo(self.view).offset(10)
            make.top.equalTo(self.view).offset(70)
            make.right.equalTo(self.view.snp.centerX).offset(10)
            make.height.equalTo(50)
        }
        labelStartDate.snp.makeConstraints { (make) in
            make.left.equalTo(labelStartDateTitle.snp.right).offset(10)
            make.right.equalTo(self.view).offset(10)
            make.top.equalTo(self.view).offset(70)
            make.height.equalTo(50)
        }
        labelStartDate.text = "Today"

        lineView1.snp.makeConstraints { (make) in
            make.left.right.equalTo(self.view)
            make.height.equalTo(0.5)
            make.top.equalTo(labelStartDateTitle.snp.bottom)
        }

        datePicker.snp.makeConstraints { (make) in
            make.left.right.equalTo(self.view)
            make.top.equalTo(labelStartDateTitle.snp.bottom).offset(10)
        }

        lineView2.snp.makeConstraints { (make) in
            make.left.right.equalTo(self.view)
            make.height.equalTo(0.5)
            make.top.equalTo(datePicker.snp.bottom)
        }

        labelEndDateTitle.snp.makeConstraints { (make) in
            make.left.equalTo(self.view).offset(10)
            make.top.equalTo(datePicker.snp.bottom).offset(10)
            make.right.equalTo(self.view.snp.centerX).offset(10)
            make.height.equalTo(50)
        }
        labelEndDate.snp.makeConstraints { (make) in
            make.left.equalTo(labelStartDateTitle.snp.right).offset(10)
            make.right.equalTo(self.view).offset(10)
            make.top.equalTo(datePicker.snp.bottom).offset(10)
            make.height.equalTo(50)
        }
        labelEndDate.text = "End Today"
        lineView3.snp.makeConstraints { (make) in
            make.left.right.equalTo(self.view)
            make.height.equalTo(0.5)
            make.top.equalTo(labelEndDateTitle.snp.bottom)
        }
    }

    func clearButtonClick() {
        print("clear")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

