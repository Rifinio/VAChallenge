//
//  Appointment.swift
//  VAChallenge
//
//  Created by Adil BOUGAMZA on 03/12/2016.
//  Copyright © 2016 Adil Bougamza. All rights reserved.
//

import UIKit

class Appointment: NSObject {

    let identifier :String
    var beginDate :Date
    var endDate :Date

    public init(beginDate: Date, endDate: Date) {
        self.identifier = ProcessInfo.processInfo.globallyUniqueString
        self.beginDate = beginDate
        self.endDate = endDate
    }
}
