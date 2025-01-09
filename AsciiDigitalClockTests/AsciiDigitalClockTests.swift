//
//  AsciiDigitalClockTests.swift
//  AsciiDigitalClockTests
//
//  Created by Jose Anonio Torres Garibay on 07/01/25.
//

import Testing
@testable import AsciiDigitalClock

struct AsciiDigitalClockTests {

    @Test func example() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
    }
    
    @Test func AsciiClockBuilderGenerate() async throws {
        let clockBuilder = AsciiClockBuilder(time: "00:00")
        let newAsciiArt = " 0000   0000     0000   0000 \n00  00 00  00 : 00  00 00  00\n00  00 00  00   00  00 00  00\n00  00 00  00 : 00  00 00  00\n 0000   0000     0000   0000 "

        #expect(clockBuilder.generateAsciiClock().debugDescription == newAsciiArt.debugDescription)
    }

}
