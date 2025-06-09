//
//  ContentView.swift
//  final
//
//  Created by Jacob Waksmanski on 6/5/25.
//

import CoreData
import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    // Add state variables for break and study times (in seconds)
    @State private var breakTime: Int = 5 * 60
    @State private var studyTime: Int = 25 * 60

    var body: some View {
        NavigationStack {
            ZStack {
                Color(.darkGray)
                    .ignoresSafeArea()

                VStack {
                    HStack {
                        Spacer()
                        NavigationLink(destination: SettingsView()) {
                            Image(systemName: "gearshape.fill")
                                .font(.system(size: 40))
                                .foregroundColor(Color(red: 0.53, green: 0.74, blue: 1.0))
                                .padding(.trailing, 40.0)
                        }
                    }
                    Spacer()

                    VStack(spacing: 24) {
                        VStack(spacing: 0) {
                            Text("Break:")
                                .font(.system(size: 28, weight: .bold, design: .monospaced))
                                .foregroundColor(.red)
                            Text(timeString(from: breakTime))
                                .font(.system(size: 48, weight: .bold, design: .monospaced))
                                .foregroundColor(.white)
                        }
                        .padding(.bottom, 10.0)

                        VStack(spacing: 0) {
                            Text("Study:")
                                .font(.system(size: 36, weight: .bold, design: .monospaced))
                                .foregroundColor(Color(red: 0.53, green: 0.74, blue: 1.0))
                            Text(timeString(from: studyTime))
                                .font(.system(size: 56, weight: .bold, design: .monospaced))
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.bottom, 40)

                    NavigationLink(destination: TimerView(onBreak: false)) {
                        Text("Start")
                            .font(.system(size: 32, weight: .bold))
                            .foregroundColor(.white)
                            .frame(width: 150, height: 70)
                            .background(Color(red: 0.53, green: 0.74, blue: 1.0))
                            .cornerRadius(20)
                    }
                    Spacer()
                }
            }
        }.navigationBarBackButtonHidden(true)
    }

    // Helper function to format seconds as mm:ss
    private func timeString(from seconds: Int) -> String {
        let minutes = seconds / 60
        let secs = seconds % 60
        return String(format: "%d:%02d", minutes, secs)
    }
}

#Preview {
    ContentView().environment(
        \.managedObjectContext, PersistenceController.preview.container.viewContext)
}
