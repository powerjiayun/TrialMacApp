//
//  TrialMacAppGUIApp.swift
//  TrialMacAppGUI
//
//  Created by TrialMacApp on 10/22/24.
//

import Sparkle
import SwiftUI

@main
struct TrialMacAppGUIApp: App {
    // https://sparkle-project.org/documentation/programmatic-setup/#create-an-updater-in-swiftui
    private let updaterController: SPUStandardUpdaterController
    
    @StateObject private var supportedAppManager = SupportedAppManager.shared
    
    init() {
        // If you want to start the updater manually, pass false to startingUpdater and call .startUpdater() later
        // This is where you can also pass an updater delegate if you need one
        updaterController = SPUStandardUpdaterController(startingUpdater: true, updaterDelegate: nil, userDriverDelegate: nil)
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(supportedAppManager)
        }
        .commands {
            CommandGroup(after: .appInfo) {
                CheckForUpdatesView(updater: updaterController.updater)
            }
        }
        Settings {
            SettingsView(updater: updaterController.updater)
        }
    }
}
