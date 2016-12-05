//
//  ScheduleViewModel.swift
//  VAChallenge
//
//  Created by Adil BOUGAMZA on 05/12/2016.
//  Copyright © 2016 Adil Bougamza. All rights reserved.
//

import UIKit

class ScheduleViewModel {

    var beginDateStr :String?
    var endDateStr :String?
    var beginDate :Date?
    var endDate :Date?

    var selectedAppointment :Appointment?

    let store :AppointmentStore?

    init(store: AppointmentStore) {
        self.store = store
    }

    func startDate() -> Date {
        if (self.selectedAppointment != nil) {
            return self.selectedAppointment!.beginDate
        }

        return Date()
    }

    func setDatesFromStartDate(beginDate :Date) {

        let dateFormatter :DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM YYYY"

        if self.daysBetweenDates(startDate: Date(), endDate: beginDate) == 0 {
            beginDateStr = "Today"
        } else {
            beginDateStr = dateFormatter.string(from: beginDate)
        }

        // caculate one week from now
        endDateStr = dateFormatter.string(from: dateByAddingOneWeek(date: beginDate))
    }

    // helper methods
    func daysBetweenDates(startDate: Date, endDate: Date) -> Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([Calendar.Component.day], from: startDate, to: endDate)
        return components.day!
    }

    func dateByAddingOneWeek(date: Date) -> Date {
        return Calendar.current.date(byAdding: .day, value: 7, to: date)!
    }

}
