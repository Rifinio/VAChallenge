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

        // fetch appointments here : database call and return appointments
        return appointments
    }

    // add new appointment
    func addAppointment(appointment :Appointment) {
        appointments += [appointment]
    }

    // update existing appointment if found
    func updaeteAppointment(appointment: Appointment, beginDate: Date, endDate: Date) {
        for apt in appointments {
            if apt.identifier == appointment.identifier {
                appointment.beginDate = beginDate
                appointment.endDate = endDate
                break
            }
        }
    }

    // delete appointement 
    func deleteAppointment(appointment : Appointment) {
        appointments = appointments.filter({$0 !== appointment})
    }
}
