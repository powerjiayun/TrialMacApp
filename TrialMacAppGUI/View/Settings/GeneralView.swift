//
//  GeneralView.swift
//  TrialMacAppGUI
//
//  Created by TrialMacApp on 12/7/24.
//

import Sparkle
import SwiftUI

struct GeneralView: View {
    @State private var automaticallyChecksForUpdates: Bool
    @State private var automaticallyDownloadsUpdates: Bool
    
    private let updater: SPUUpdater
    
    init(updater: SPUUpdater) {
        self.updater = updater
        self._automaticallyChecksForUpdates = State(initialValue: updater.automaticallyChecksForUpdates)
        self._automaticallyDownloadsUpdates = State(initialValue: updater.automaticallyDownloadsUpdates)
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                header
                Divider()
                updateSettings
            }
            .padding()
        }
    }
    
    private var header: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(Constants.appName)
                .font(.title2)
                .bold()
            Text("Welcome")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
    }
    
    private var updateSettings: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Update Settings")
                .font(.title3)
                .bold()
            
            VStack(alignment: .leading, spacing: 8) {
                Toggle(isOn: $automaticallyChecksForUpdates) {
                    Label("Automatically check for updates", systemImage: "arrow.down.circle")
                }
                .onChange(of: automaticallyChecksForUpdates) { newValue in
                    updater.automaticallyChecksForUpdates = newValue
                }
                
                Toggle(isOn: $automaticallyDownloadsUpdates) {
                    Label("Automatically download updates", systemImage: "arrow.down.square")
                }
                .disabled(!automaticallyChecksForUpdates)
                .onChange(of: automaticallyDownloadsUpdates) { newValue in
                    updater.automaticallyDownloadsUpdates = newValue
                }
            }
        }
    }
}
