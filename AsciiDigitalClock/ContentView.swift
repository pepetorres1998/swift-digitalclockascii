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

    var body: some View {
        VStack {
            Spacer()
            Text(asciiArt)
            .font(.system(.largeTitle, design: .monospaced))
            .multilineTextAlignment(.leading)
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                    let newTime = Date()
                    if(newTime != currentTime) {
                        currentTime = newTime
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
