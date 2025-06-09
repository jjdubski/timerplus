//
//  BreakScreen.swift
//  final
//
//  Created by Jacob Waksmanski on 6/9/25.
//

import SwiftUI

struct BreakView: View {
    @EnvironmentObject private var timerSettings: TimerSettings
    @State private var breakTime: Int = 5 * 60  // 5 minutes in seconds
    @State private var timerActive = false

    var body: some View {
        ZStack {
            Color(.darkGray)
                .ignoresSafeArea()
            VStack(spacing: 40) {
                VStack(spacing: 0) {
                    Text("Break:")
                        .font(.system(size: 36, weight: .bold, design: .monospaced))
                        .foregroundColor(.red)
                    Text(timeString)
                        .font(.system(size: 60, weight: .bold, design: .monospaced))
                        .foregroundColor(.white)
                }
                Button(action: {
                    timerActive.toggle()
                }) {
                    NavigationLink(destination: TimerView(onBreak: true)) {
                        Text("Start")
                            .font(.system(size: 32, weight: .bold))
                            .foregroundColor(.white)
                            .frame(width: 140, height: 70)
                            .background(Color(red: 1.0, green: 0.27, blue: 0.23))
                            .cornerRadius(18)
                    }
                }
                .padding(.top, 40)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }.navigationBarBackButtonHidden(true)
    }

    var timeString: String {
        let minutes = breakTime / 60
        let seconds = breakTime % 60
        return String(format: "%d:%02d", minutes, seconds)
    }
}

//#Preview {
//    BreakView()
//}
