//
//  SupportedAppManager.swift
//  TrialMacAppGUI
//
//  Created by TrialMacApp on 12/7/24.
//

import SwiftUI

public struct SupportedApp: Codable, Equatable, Identifiable {
    public let id = UUID()
    let MAS: Bool
    let anyVersion: Bool
    let bundleId: String
    let name: String
    let version: String
    let x86: Bool
    let remark: String?
    let licenseCode: String?
    let licenseUser: String?

    enum CodingKeys: String, CodingKey {
        case MAS
        case anyVersion
        case bundleId
        case name
        case version
        case x86
        case remark
        case licenseCode
        case licenseUser
    }
}

class SupportedAppManager: ObservableObject {
    static let shared = SupportedAppManager()
    @Published private(set) var supportedApps: [SupportedApp] = []
    
    private init() {
        loadSupportedApps()
    }

    public func getSupportedApps() -> [SupportedApp] {
        supportedApps
    }

    func loadSupportedApps() {
        DispatchQueue.global(qos: .background).async {
            guard let infoDict = Bundle.main.infoDictionary else {
                print("Error loading Info.plist: Info.plist not found.")
                return
            }
            guard let supportedAppsArray = infoDict["Supported Apps"] as? [[String: Any]] else {
                print("Error: 'Supported Apps' key not found in Info.plist.")
                return
            }

            // 将字典数组转换为 JSON 数据
            do {
                let jsonData = try JSONSerialization.data(withJSONObject: supportedAppsArray)
                let decoder = JSONDecoder()
                let supportedApps = try decoder.decode([SupportedApp].self, from: jsonData)

                DispatchQueue.main.async {
                    self.supportedApps = supportedApps // 更新 apps 属性
                    print("更新 SupportedAppManager.supportedApps")
                }
            } catch {
                // TODO:
                print("解析错误: \(error)")
            }
        }
    }
}
