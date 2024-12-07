//
//  SupportedAppView.swift
//  TrialMacAppGUI
//
//  Created by TrialMacApp on 12/7/24.
//

import SwiftUI

struct SupportedAppView: View {
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var supportedAppManager: SupportedAppManager
    @State private var supportedApps: [SupportedApp] = []
    
    @State var order: [KeyPathComparator<SupportedApp>] = [.init(\.name, order: .forward)] // 排序条件
        
    var body: some View {
        VStack {
            Text("All Supported Apps")
                .padding(.top, 10)
            
            if supportedApps.isEmpty {
                ProgressView("Loading...")
            } else {
                Table(supportedApps, sortOrder: $order) {
                    TableColumn("Name") { app in
                        CopyableText(value: app.name)
                    }
                    
                    TableColumn("MAS") {
                        Text($0.MAS ? "✅" : "NO")
                    }
                    .width(32)
                    
                    TableColumn("X86") {
                        Text($0.x86 ? "✅" : "NO")
                    }
                    .width(32)
                    
                    TableColumn("Version") {
                        Text($0.anyVersion ? "✅" : $0.version)
                    }
                    .width(72)
                    
                    TableColumn("Remark") { app in
                        CopyableText(value: app.remark ?? "")
                    }
                }
                .frame(minWidth: 500)
                .frame(width: 660, height: 300) // ？？？？
                .onChange(of: order) { newOrder in
                    print(newOrder)
                    withAnimation {
                        supportedApps.sort(using: newOrder) // 排序条件改变时对数据重排序
                    }
                }
                .scenePadding() // 这个是边缘的样式
                .tableStyle(.bordered)
            }
        }
        .task {
            supportedApps = supportedAppManager.getSupportedApps()
            supportedApps.sort(using: order)
        }
        
        HStack {
            Spacer()
            
            Button {
                dismiss()
            } label: {
                Text("Close")
            }
            .padding(.bottom, 16)
            .padding(.trailing, 16)
        }
    }
    
    struct CopyableText<T>: View where T: CustomStringConvertible {
        let value: T

        var body: some View {
            Text(value.description)
                .contextMenu {
                    Button("Copy") {
                        NSPasteboard.general.clearContents()
                        NSPasteboard.general.setString(value.description, forType: .string)
                    }
                }
        }
    }
}
