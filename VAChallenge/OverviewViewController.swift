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
        // Do any additional setup after loading the view.

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


        let app1 = Appointment(_beginDate: Date(), _endDate: Date())
        let app2 = Appointment(_beginDate: Date(), _endDate: Date())
        appointments += [app1, app2]

    }

    func addButtonAction() {
        let scheduleVC :ScheduleViewController = ScheduleViewController()
        self.navigationController?.pushViewController(scheduleVC, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

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

}
