//
//  VAChallengeTests.swift
//  VAChallengeTests
//
//  Created by Adil BOUGAMZA on 03/12/2016.
//  Copyright © 2016 Adil Bougamza. All rights reserved.
//

import XCTest
@testable import VAChallenge

class VAChallengeTests: XCTestCase {

    var store :AppointmentStore = AppointmentStore.sharedInstance

    override func setUp() {
        super.setUp()

        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testStoreFetchData() {
//        let appArr = store?.fetchAppointments()
        XCTAssertEqual(store.fetchAppointments().count, 3)
    }

    func testStoreAddAppointment() {
        let appointment = Appointment(beginDate: Date(), endDate: Date())
        store.addAppointment(appointment: appointment)
        XCTAssertEqual(store.fetchAppointments().count, 3)
    }


}
