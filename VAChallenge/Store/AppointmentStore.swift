//
//  AppointmentStore.swift
//  VAChallenge
//
//  Created by Adil BOUGAMZA on 04/12/2016.
//  Copyright © 2016 Adil Bougamza. All rights reserved.
//

import UIKit

class AppointmentStore: NSObject {

    private var appointments = [Appointment]()

    static let sharedInstance = AppointmentStore()

    private override init() {}

    func fetchAppointments () -> [Appointment] {
        let tempDateFormatter = DateFormatter()
        tempDateFormatter.dateFormat = "dd/MM/YYYY"

        // fake appointements
        if appointments.count == 0 {
            let app1 = Appointment(beginDate: Date(), endDate: Date())
            let app2 = Appointment(beginDate: tempDateFormatter.date(from: "10/12/2017")!, endDate: Date())
            appointments += [app1, app2]
        }

        return appointments
    }

    // add new appointment appointment
    func addAppointment(appointment :Appointment) {
        appointments += [appointment]
    }

    // update existing appointment
    func updaeteAppointment(appointment: Appointment, beginDate: Date, endDate: Date) {
        for apt in appointments {
            if apt.identifier == appointment.identifier {
                appointment.beginDate = beginDate
                appointment.endDate = endDate
                break
            }
        }
    }

    

}
