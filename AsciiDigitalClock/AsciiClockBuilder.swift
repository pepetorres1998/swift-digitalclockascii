//
//  AsciiClockBuilder.swift
//  AsciiDigitalClock
//
//  Created by Jose Anonio Torres Garibay on 08/01/25.
//

import Foundation

class AsciiClockBuilder {
    let time: String
    var asciiClock: String = ""
    let digits: [Character: [String]] = [
        "0": [
            " 0000 ",
            "00  00",
            "00  00",
            "00  00",
            " 0000 ",
        ],
        "1": [
            "1111  ",
            "  11  ",
            "  11  ",
            "  11  ",
            "111111",
        ],
        "2": [
            " 2222 ",
            "22  22",
            "   22 ",
            "  22  ",
            "222222",
        ],
        "3": [
            " 3333 ",
            "33  33",
            "   333",
            "33  33",
            " 3333 ",
        ],
        "4": [
            "44  44",
            "44  44",
            "444444",
            "    44",
            "    44",
        ],
        "5": [
            "555555",
            "55    ",
            "55555 ",
            "    55",
            "55555 ",
        ],
        "6": [
            " 6666 ",
            "66    ",
            "66666 ",
            "66  66",
            " 6666 ",
        ],
        "7": [
            "777777",
            "   77 ",
            "  77  ",
            " 77   ",
            "77    ",
        ],
        "8": [
            " 8888 ",
            "88  88",
            " 8888 ",
            "88  88",
            " 8888 ",
        ],
        "9": [
            " 9999 ",
            "99  99",
            " 99999",
            "    99",
            " 9999 ",
        ],
        ":": [
            " ",
            ":",
            " ",
            ":",
            " ",
        ]
    ]
    
    init(time: String) {
        self.time = time
    }
    
    init(date: Date) {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        self.time = formatter.string(from: date)
    }
    
    func generateAsciiClock() -> String {
        for index in 0..<5 {
            var line = ""
            for (char_index, character) in time.enumerated() {
                if let asciiDigit = digits[character]?[index] {
                    if(char_index != 4) {
                        line.append(asciiDigit + " ")
                    } else {
                        line.append(asciiDigit)
                    }
                }
            }
            
            if(index != 4) {
                line.append("\n")
            }
            
            self.asciiClock.append(line)
            
        }
        
        return asciiClock
    }
}
