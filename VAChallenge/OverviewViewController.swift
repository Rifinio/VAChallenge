//
//  OverviewViewController.swift
//  VAChallenge
//
//  Created by Adil BOUGAMZA on 03/12/2016.
//  Copyright © 2016 Adil Bougamza. All rights reserved.
//

import UIKit
import SnapKit

class OverviewViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var appointments : [Appointment] = []
    let cellId :String = "cellId"

    let tableView : UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: UITableViewStyle.plain)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "Overview"

        let addButtonItem :UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonAction))
        self.navigationItem.setRightBarButton(addButtonItem, animated: true)

        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }

        self.tableView.register(AppointmentCell.self, forCellReuseIdentifier: cellId)
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

    override func viewWillAppear(_ animated: Bool) {
        appointments = AppointmentStore.sharedInstance.fetchAppointments()
        self.tableView.reloadData()
    }

    func addButtonAction() {
        let scheduleVC :ScheduleViewController = ScheduleViewController()
        self.navigationController?.pushViewController(scheduleVC, animated: true)
    }
    
    // MARK: tableview delegate methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appointments.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! AppointmentCell
        cell.setAppointment(appointment: appointments[indexPath.row])

        return cell

    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let scheduleVC :ScheduleViewController = ScheduleViewController(appointment: appointments[indexPath.row])
        self.navigationController?.pushViewController(scheduleVC, animated: true)
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            print("deleting item at index : \(indexPath.row)")
        }
    }
}
