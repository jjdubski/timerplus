//
//  SwiftUIView.swift
//  final
//
//  Created by Jacob Waksmanski on 6/5/25.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject private var timerSettings: TimerSettings
    @Environment(\.dismiss) private var dismiss

    let studyOptions = [15, 20, 25, 30, 35, 40, 45, 50, 55, 60]
    let breakOptions = [5, 10, 15, 20, 25, 30]

    var body: some View {
        ZStack {
            Color(.darkGray)
                .ignoresSafeArea()
            VStack(spacing: 36) {
                Text("Timer Settings")
                    .font(.system(size: 40, weight: .bold, design: .rounded))
                    .foregroundColor(Color(red: 0.44, green: 0.65, blue: 1.0))
                    .italic()
                    .padding(.top, 30)

                VStack(alignment: .leading, spacing: 24) {
                    Text("Study Time")
                        .foregroundColor(.white)
                        .font(.system(size: 22, weight: .regular))
                    Picker(selection: $timerSettings.studyTime) {
                        ForEach(studyOptions, id: \.self) { time in
                            Text("\(time) minutes").tag(time)
                        }
                    } label: {
                        Text("\(timerSettings.studyTime) minutes").foregroundColor(.black)
                    }
                    .pickerStyle(MenuPickerStyle())
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(color: .black.opacity(0.15), radius: 4, x: 0, y: 2)

                    Text("Break Time")
                        .foregroundColor(.white)
                        .font(.system(size: 22, weight: .regular))
                    Picker(
                        selection: $timerSettings.breakTime,
                    ) {
                        ForEach(breakOptions, id: \.self) { time in
                            Text("\(time) minutes").tag(time)
                        }
                    } label: {
                        Text("\(timerSettings.breakTime) minutes").foregroundColor(.black)
                    }
                    .pickerStyle(MenuPickerStyle())
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(color: .black.opacity(0.15), radius: 4, x: 0, y: 2)
                }
                .padding(.horizontal, 32)

                VStack(alignment: .leading, spacing: 36) {
                    HStack {
                        Text("Automatically start timer")
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                        Spacer()
                        Toggle("", isOn: $timerSettings.autoStart)
                            .labelsHidden()
                    }
                    HStack {
                        Text("Play sound on timer switch")
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                        Spacer()
                        Toggle("", isOn: $timerSettings.playSound)
                            .labelsHidden()
                    }
                }
                .padding(.horizontal, 32)

                Spacer()

                HStack(spacing: 32) {
                    Button(action: {
                        // Back action
                        dismiss()
                    }) {
                        Text("Back")
                            .font(.system(size: 22, weight: .bold))
                            .foregroundColor(.white)
                            .frame(width: 140, height: 56)
                            .background(Color.red)
                            .cornerRadius(14)
                    }
                    //                    Button(action: {
                    //                        // Save action
                    //                    }) {
                    //                        Text("Save")
                    //                            .font(.system(size: 22, weight: .bold))
                    //                            .foregroundColor(.white)
                    //                            .frame(width: 140, height: 56)
                    //                            .background(Color(red: 0.44, green: 0.65, blue: 1.0))
                    //                            .cornerRadius(14)
                    //                    }
                }
                .padding(.bottom, 40)
            }
        }
    }
}

#Preview {
    SettingsView()
}
