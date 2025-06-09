//
//  TimerRunning.swift
//  final
//
//  Created by Jacob Waksmanski on 6/9/25.
//

import SwiftUI

struct TimerView: View {

    var onBreak: Bool = false

    @EnvironmentObject private var timerSettings: TimerSettings
    @State private var totalTime: CGFloat = 1500  // default fallback
    @State private var timeRemaining: CGFloat = 1500
    @State private var timerActive = true
    @State private var showBreakAlert = false
    @State private var navigateToBreak = false
    @State private var navigateToStudy = false
    @State private var navigateToHome = false

    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    init(onBreak: Bool = false) {
        self.onBreak = onBreak
    }

    var body: some View {
        NavigationStack {
            GeometryReader { geo in
                ZStack {
                    Color(.darkGray)
                        .edgesIgnoringSafeArea(.all)

                    // Shrinking area
                    VStack {
                        Spacer()
                        Spacer(minLength: 0)
                        Color(backgroundColor)
                            .frame(
                                width: geo.size.width,
                                height: blueHeight(for: geo.size.height)
                            )
                            .cornerRadius(0)
                            .shadow(radius: 16)
                    }
                    .edgesIgnoringSafeArea(.all)

                    // Timer and buttons
                    VStack {
                        Spacer()
                        Text(timeString)
                            .font(.system(size: 72, weight: .semibold, design: .monospaced))
                            .foregroundColor(.white)
                            .padding(.bottom, 24)
                        if timerActive {
                            Button(action: { withAnimation(nil) { timerActive = false } }) {
                                Text("Pause")
                                    .font(.system(size: 24, weight: .semibold))
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 32)
                                    .padding(.vertical, 12)
                                    .background(buttonColor)
                                    .cornerRadius(18)
                            }
                            .buttonStyle(PlainButtonStyle())
                            .padding(.bottom, 32)
                        } else {
                            Button(action: { withAnimation(nil) { timerActive = true } }) {
                                Text("Resume")
                                    .font(.system(size: 24, weight: .semibold))
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 32)
                                    .padding(.vertical, 12)
                                    .background(resumeButtonColor)
                                    .cornerRadius(18)
                            }
                            .buttonStyle(PlainButtonStyle())
                            .padding(.bottom, 16)
                            Button(action: {
                                timeRemaining = totalTime
                                timerActive = false
                                navigateToHome = true
                            }) {
                                Text("Stop")
                                    .font(.system(size: 24, weight: .semibold))
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 32)
                                    .padding(.vertical, 12)
                                    .background(stopButtonColor)
                                    .cornerRadius(18)
                            }
                            .buttonStyle(PlainButtonStyle())
                            .padding(.bottom, 32)
                        }
                        Spacer()
                        Button(action: { showBreakAlert = true }) {
                            Text(onBreak ? "Study again >>" : "Take a break >>")
                                .font(.system(size: 28))
                                .foregroundColor(.white)
                                .opacity(0.8)
                                .padding(.bottom, 40)
                        }
                    }
                    .frame(width: geo.size.width, height: geo.size.height)

                    // hidden navlink
                    .navigationDestination(isPresented: $navigateToBreak) {
                        BreakView()
                    }
                    .navigationDestination(isPresented: $navigateToStudy) {
                        TimerView(onBreak: false)
                    }
                    .navigationDestination(isPresented: $navigateToHome) {
                        ContentView()
                    }
                }
                .onAppear {
                    if onBreak {
                        totalTime = CGFloat(timerSettings.breakTime * 60)
                        timeRemaining = CGFloat(timerSettings.breakTime * 60)
                    } else {
                        totalTime = CGFloat(timerSettings.studyTime * 60)
                        timeRemaining = CGFloat(timerSettings.studyTime * 60)
                    }
                }
                .onReceive(timer) { _ in
                    guard timerActive, timeRemaining > 0 else { return }
                    timeRemaining -= 1
                }
                .alert(isPresented: $showBreakAlert) {
                    if onBreak {
                        return Alert(
                            title: Text("Back to Studying").fontWeight(.semibold),
                            message: Text("Finish your break and go back to studying?"),
                            primaryButton: .default(
                                Text("Yes"),
                                action: {
                                    // Reset timer for studying and exit break
                                    totalTime = 1500
                                    timeRemaining = 1500
                                    timerActive = true
                                    navigateToBreak = false
                                    navigateToStudy = true
                                }),
                            secondaryButton: .cancel(Text("No"))
                        )
                    } else {
                        return Alert(
                            title: Text("Early Break").fontWeight(.semibold),
                            message: Text(
                                "Would you like to end the timer and skip to your break?"),
                            primaryButton: .default(
                                Text("Yes"),
                                action: {
                                    navigateToBreak = true
                                }),
                            secondaryButton: .cancel(Text("No"))
                        )
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }

    func blueHeight(for maxHeight: CGFloat) -> CGFloat {
        let percent = timeRemaining / totalTime
        return maxHeight * percent
    }

    var timeString: String {
        let minutes = Int(timeRemaining) / 60
        let seconds = Int(timeRemaining) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }

    var backgroundColor: Color {
        onBreak
            ? Color(red: 1.0, green: 0.28, blue: 0.26) : Color(red: 0.53, green: 0.76, blue: 1.0)
    }
    var buttonColor: Color {
        onBreak ? Color(.darkGray) : Color.red
    }
    var resumeButtonColor: Color {
        onBreak ? Color(red: 0.53, green: 0.76, blue: 1.0) : Color(.darkGray)
    }
    var stopButtonColor: Color {
        onBreak ? Color(.darkGray) : Color.red
    }
}

//#Preview {
//    TimerView(onBreak: false)
//}
