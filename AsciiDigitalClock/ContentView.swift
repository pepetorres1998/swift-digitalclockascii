//
//  ContentView.swift
//  AsciiDigitalClock
//
//  Created by Jose Anonio Torres Garibay on 07/01/25.
//

import SwiftUI

struct ContentView: View {
    @State private var currentTime: Date = Date()
    
    var asciiArt: String {
       AsciiClockBuilder(date: currentTime).generateAsciiClock()
    }
    
    var currentTimeFormatted: String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter.string(from: currentTime)
    }

    var body: some View {
        VStack {
            Spacer()
            Text(asciiArt)
                .font(.system(.title, design: .monospaced))
                .multilineTextAlignment(.leading)
                .accessibilityLabel("The current time is \(currentTimeFormatted)")
                .accessibilityHint("This is a digital representation of the current time")
                .onAppear {
                    Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                        let newTime = Date()
                        
                        if(newTime != currentTime) {
                            currentTime = newTime
                            UIAccessibility.post(notification: .announcement, argument: "The time is now \(currentTimeFormatted)")
                        }
                    }
                }
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .foregroundStyle(Color.white)
    }
}

#Preview {
    ContentView()
}
