//
//  ContentView.swift
//  TrialMacAppGUI
//
//  Created by TrialMacApp on 12/7/24.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("showAdminPrivilegeView") private var showAdminPrivilegeView: Bool = false
    @EnvironmentObject var supportedAppManager: SupportedAppManager
    @StateObject var localappManager: LocalAppManager = .shared
    // 这个用来显示所有受支持的app
    @State private var isShowAllSupportedApp = false

    @State private var selectedApp: LocalAppInfo?
    @State private var searchText: String = ""

    var body: some View {
        NavigationSplitView {
            SidebarView(searchText: $searchText, selectedApp: $selectedApp)
        } detail: {
            if let app = selectedApp {
                AppDetailView(localAppInfo: app)
            } else {
                AboutView()
            }
        }
        .toolbar {
            toolbarContent
        }
        .sheet(isPresented: $isShowAllSupportedApp) {
            SupportedAppView()
                .environmentObject(supportedAppManager)
        }
        .sheet(isPresented: $showAdminPrivilegeView) {
            AdminPrivilegeView()
        }
        .searchable(text: $searchText, placement: .sidebar)
    }

    // 功能合集
    private var toolbarContent: some ToolbarContent {
        ToolbarItemGroup(placement: .automatic) {
            Button {
                showAdminPrivilegeView = true
            } label: {
                Label("Enter password again", systemImage: "lock")
            }

            Button {
                localappManager.loadData()
            } label: {
                Label("Refresh app list", systemImage: "arrow.clockwise")
            }

            Button {
                isShowAllSupportedApp.toggle()
            } label: {
                Label("Supported apps", systemImage: "list.clipboard")
            }
        }
    }
}
