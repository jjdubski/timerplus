//
//  TimerSettings.swift
//  final
//
//  Created by Jacob Waksmanski on 6/9/25.
//
import SwiftUI

class TimerSettings: ObservableObject {
    @Published var studyTime: Int = 25
    @Published var breakTime: Int = 5
    @Published var autoStart: Bool = false
    @Published var playSound: Bool = false
}
