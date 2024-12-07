//
//  SidebarView.swift
//  TrialMacAppGUI
//
//  Created by TrialMacApp on 12/7/24.
//

import SwiftUI

struct SidebarView: View {
    @State private var searchText: String = "" // 搜索框内容
    @State private var localApps: [LocalAppInfo] = []
    @StateObject var localappManager: LocalAppManager = .shared
    @Binding var selectedApp: LocalAppInfo?

    var filteredApps: [LocalAppInfo] {
        if searchText.isEmpty {
            return localApps
        } else {
            return localApps.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }

    var body: some View {
        VStack {
            searchField

            ZStack {
                if localappManager.isLoading {
                    ProgressView("Scanning Apps...")
                } else {
                    List(filteredApps, id: \.bundleId) { app in
                        ZStack(alignment: .leading) {
                            if selectedApp?.bundleId == app.bundleId {
                                Rectangle()
                                    .fill(Color(NSColor.selectedContentBackgroundColor))
                                    .cornerRadius(8)
                            }
                            HStack {
                                app.icon
                                    .resizable()
                                    .frame(width: 32, height: 32)
                                    .cornerRadius(4)
                                VStack(alignment: .leading) {
                                    HStack {
                                        Text(app.name)
                                            .font(.headline)

                                        Label("Processed", systemImage: "checkmark.circle.fill")
                                            .font(.caption2)
                                            .foregroundStyle(.green)
                                            .labelStyle(.iconOnly)
                                            .opacity(app.isAppActivated ? 1 : 0)
                                    }

                                    Text(app.bundleId)
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                    Text(app.version)
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                }
                            }
                            .padding(.horizontal, 8)
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            selectedApp = app
                        }
                    }
                    .listStyle(SidebarListStyle())
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(minWidth: 200) // 控制侧边栏最小宽度
        .onReceive(localappManager.$localApps) { newApps in
            localApps = newApps
        }
        .onChange(of: localappManager.isLoading) { newValue in
            if localappManager.isLoading {
                searchText = ""
            }
        }
    }

    // MARK: - 搜索框

    private var searchField: some View {
        TextField("Search apps", text: $searchText)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
    }
}
