//
//  DateConverterTests.swift
//  CurrentWeatherTests
//
//  Created by Ivan Durmashev on 15.06.2023.
//

import XCTest
@testable import WeatherApp

final class DateConverterTests: XCTestCase {
    
    var stumbbedDate: Date!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        stumbbedDate = try DateConverter.stumbbedDate()
    }

    override func tearDownWithError() throws {
        stumbbedDate = nil
        try super.tearDownWithError()
    }
    
    func testShowingDayWithWeekDay() throws {
        let todayDate = DateConverter.showDayWithWeekDayIfNeeded(stumbbedDate, currentDate: stumbbedDate)
        XCTAssertEqual(todayDate, "Today, 30 Oct")
        let notTodayDay = DateConverter.showDayWithWeekDayIfNeeded(stumbbedDate, currentDate: Date.now)
        XCTAssertEqual(notTodayDay, "Wed, 30 Oct")
        
    }
    
    func testShowingShortDate() throws {
        let shortDayString = DateConverter.showShortDay(stumbbedDate)
        XCTAssertEqual(shortDayString, "30 Oct")
    }
    
    func testGettingDateFromDaysAgo() throws {
        let dateFromDaysAgo = DateConverter.getDateString(daysAgo: 10, toDate: stumbbedDate)
        XCTAssertEqual(dateFromDaysAgo, "1000-10-20")
    }
    
}

extension DateConverter {
    static func stumbbedDate(year: Int = 1000, month: Int = 10, day: Int = 30) throws -> Date {
        try XCTUnwrap(Calendar.current.date(from: DateComponents(year: year, month: month, day: day)))
    }
}
