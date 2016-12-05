//
//  ViewController.swift
//  VAChallenge
//
//  Created by Adil BOUGAMZA on 03/12/2016.
//  Copyright © 2016 Adil Bougamza. All rights reserved.
//

import UIKit
import SnapKit

class ScheduleViewController: UIViewController {

    var scheduleVM : ScheduleViewModel?
    
    var selectedAppointment :Appointment!

    let labelStartDate :UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15.0)
        return label
    }()
    let labelEndDate :UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15.0)
        return label
    }()
    let datePicker :UIDatePicker = {
        let datePicker :UIDatePicker = UIDatePicker()
        datePicker.minimumDate = Date()
        return datePicker
    }()

    // MARK: initializers
    init() {
        super.init(nibName: nil, bundle: nil)
        scheduleVM = ScheduleViewModel(store: AppointmentStore.sharedInstance)
    }

    init(appointment :Appointment) {
        super.init(nibName: nil, bundle: nil)
        scheduleVM = ScheduleViewModel(store: AppointmentStore.sharedInstance)
        scheduleVM?.selectedAppointment = appointment
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: View controller cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUpView()

        datePicker.addTarget(self, action: #selector(onDidChangeDate(sender:)), for: .valueChanged)

        self.setDateLablesFromDate(beginDate: (scheduleVM?.startDate())!)
        datePicker.date = (scheduleVM?.startDate())!
    }

    override func viewWillDisappear(_ animated: Bool) {

        let selectedBeginDate :Date = datePicker.date
        let endDate = dateByAddingOneWeek(date: selectedBeginDate)

        if (self.selectedAppointment != nil) {
            AppointmentStore.sharedInstance.updaeteAppointment(appointment: self.selectedAppointment, beginDate: selectedBeginDate, endDate: endDate)
        } else {
            let currentSelecedAppointment = Appointment(beginDate: selectedBeginDate, endDate: endDate)
            AppointmentStore.sharedInstance.addAppointment(appointment: currentSelecedAppointment)
        }
    }

    // MARK: view helper methods
    func setDateLablesFromDate(beginDate :Date) {
        // update view model with
        self.scheduleVM?.setDatesFromStartDate(beginDate: beginDate)

        // set date labels with formatted data from view model
        labelStartDate.text = self.scheduleVM?.beginDateStr
        labelEndDate.text = self.scheduleVM?.endDateStr
    }

    func dateByAddingOneWeek(date: Date) -> Date {
        return Calendar.current.date(byAdding: .day, value: 7, to: date)!
    }

    // MARK: view actions
    func onDidChangeDate(sender: UIDatePicker) {
        self.setDateLablesFromDate(beginDate: sender.date as Date)
    }

    func clearButtonClick() {
        self.setDateLablesFromDate(beginDate: Date())
        datePicker.setDate(Date(), animated: true)
    }

    // create view UI elements and add constraints
    private func setUpView(){
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "Schedule"

        // add navigation item : clear
        let clearButtonItem :UIBarButtonItem = UIBarButtonItem(title: "Clear", style: .plain, target: self, action: #selector(self.clearButtonClick))
        self.navigationItem.setRightBarButton(clearButtonItem, animated: true)

        // add view ui elements
        let labelStartDateTitle :UILabel = UILabel()
        labelStartDateTitle.font = UIFont.systemFont(ofSize: 15.0)
        labelStartDateTitle.text = "Begin:"
        let labelEndDateTitle :UILabel = UILabel()
        labelEndDateTitle.font = UIFont.systemFont(ofSize: 15.0)
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
        lineView3.snp.makeConstraints { (make) in
            make.left.right.equalTo(self.view)
            make.height.equalTo(0.5)
            make.top.equalTo(labelEndDateTitle.snp.bottom)
        }
    }
}

