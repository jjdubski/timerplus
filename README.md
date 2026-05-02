https://github.com/user-attachments/assets/2b6da6d2-30ff-4a63-84ce-6af15dae3ee7

# TimerPlus

TimerPlus is a SwiftUI iOS focus timer built around a Pomodoro-inspired study and break cycle. The app uses a visual, hourglass-like countdown experience to make each session feel more tangible, with separate study and break timers, quick settings, and a simple start-pause-resume flow.

## Overview

TimerPlus is designed for focused work sessions such as studying, reading, or deep work. The home screen shows your configured study and break lengths, the timer screen animates the remaining session visually, and the settings screen lets you adjust the timer behavior before you begin.

## Features

- Study timer with configurable session length
- Break timer with configurable break length
- Hourglass-inspired visual countdown using a shrinking colored timer field
- Pause, resume, and stop controls during a session
- Manual skip from study to break
- Optional automatic transition between study and break phases
- Optional sound cue when a timer switches phases
- Clean SwiftUI navigation flow between home, timer, break, and settings screens

## Screens

### Home

The main screen displays the current study and break durations and provides a single entry point to start a study session.

### Active Timer

The timer view runs the countdown and changes color depending on the current phase:

- Blue for study time
- Red for break time

Users can pause, resume, stop, or move early to the next phase.

### Break Screen

When a study session ends, the app can route to a break screen or jump directly into the break timer if auto-start is enabled.

### Settings

The settings screen allows users to configure:

- Study duration
- Break duration
- Automatic timer start between phases
- Sound playback on timer switch

## Tech Stack

- Swift
- SwiftUI
- Xcode project structure for iOS
- ObservableObject state management via `TimerSettings`

## Project Structure

```text
timerplus/
├── README.md
└── final/
    ├── final/
    │   ├── ContentView.swift
    │   ├── TimerView.swift
    │   ├── BreakView.swift
    │   ├── SettingsView.swift
    │   ├── TimerSettings.swift
    │   ├── finalApp.swift
    │   ├── Persistence.swift
    │   └── Assets.xcassets/
    └── final.xcodeproj/
```

## How It Works

1. The app launches into the home screen and loads default timer values from a shared `TimerSettings` object.
2. Starting a session opens the study timer.
3. The timer counts down once per second and updates the UI in real time.
4. When the study timer completes, the app transitions to a break flow.
5. If auto-start is enabled, the break timer begins immediately.
6. If auto-start is disabled, the app first shows a break screen before the break session starts.
7. When the break timer completes, the app either returns home or restarts the study cycle depending on the current settings.

## Running the App

### Requirements

- macOS with Xcode installed
- Swift 5 support in Xcode
- iOS Simulator or physical iPhone/iPad

### Open in Xcode

Open the project at:

- [final/final.xcodeproj](./final/final.xcodeproj)

### Build and Run

1. Open the Xcode project.
2. Select the `final` scheme.
3. Choose an iOS Simulator or connected device.
4. Run the app with Xcode.

The current Xcode project configuration targets iOS 18.5 and supports iPhone and iPad device families.

## Current Notes

- Timer settings are currently stored in memory for the active app session only.
- The project still includes Xcode Core Data template files, but the timer flow does not currently use persistent storage.
- The app target and scheme are still named `final`, even though the repository is named TimerPlus.

## Future Improvements

- Add session history and focus statistics
- Improve the hourglass visual with richer animation and transitions
- Add notifications or background timer support
- Add tests for timer state transitions and settings behavior

## Purpose

This project is a lightweight focus timer built to support structured study sessions with a calm, visual interface. It is best suited for users who want a straightforward Pomodoro-style workflow without extra complexity.
