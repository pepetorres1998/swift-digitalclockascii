//
//  ContentView.swift
//  AsciiDigitalClock
//
//  Created by Jose Anonio Torres Garibay on 07/01/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let date = Date()
        let asciiArt = AsciiClockBuilder(date: date).generateAsciiClock()
        
        VStack {
            Spacer()
            Text(asciiArt)
            .font(.system(.title, design: .monospaced))
            .multilineTextAlignment(.leading)
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
