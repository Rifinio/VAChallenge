//
//  Appointment.swift
//  VAChallenge
//
//  Created by Adil BOUGAMZA on 03/12/2016.
//  Copyright © 2016 Adil Bougamza. All rights reserved.
//

import UIKit

class Appointment: NSObject {

    let beginDate :Date
    let endDate :Date

    public init(_beginDate: Date, _endDate: Date) {
        beginDate = _beginDate
        endDate = _endDate
    }
}
