//
//  Settings.swift
//  TrialMacAppGUI
//
//  Created by TrialMacApp on 12/7/24.
//

import SwiftUI
import Sparkle

struct SettingsView: View {
    let updater: SPUUpdater
    
    var body: some View {
        VStack(spacing: 0) {
            TabView {
                GeneralView(updater: updater)
                    .tabItem {
                        Label("General", systemImage: "gear")
                    }
                AboutView()
                    .tabItem {
                        Label("About", systemImage: "info.circle")
                    }
            }
            .padding()
        }
        .frame(width: 500, height: 400)
    }
}
