//
//  KeyChainService.swift
//  TrialMacAppGUI
//
//  Created by TrialMacApp on 12/7/24.
//

import Security
import SwiftUI

class KeychainService {
    static let shared = KeychainService()

    func save(password: String, for account: String) -> Bool {
        let passwordData = password.data(using: .utf8)!

        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: account,
            kSecValueData as String: passwordData
        ]

        // 删除旧的密码
        SecItemDelete(query as CFDictionary)

        // 添加新的密码
        return SecItemAdd(query as CFDictionary, nil) == errSecSuccess
    }

    func retrievePassword(for account: String) -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: account,
            kSecReturnData as String: kCFBooleanTrue!,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]

        var item: CFTypeRef?
        let status = SecItemCopyMatching(query as CFDictionary, &item)

        guard status == errSecSuccess else { return nil }

        if let data = item as? Data {
            return String(data: data, encoding: .utf8)
        }
        return nil
    }

    func deletePassword(for account: String) {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: account
        ]

        SecItemDelete(query as CFDictionary)
    }
}

class KeychainHelperForService {
    static let shared = KeychainHelperForService()

    func savePassword(service: String, account: String, password: String) -> Bool {
        let data = password.data(using: .utf8)!
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: account,
            kSecValueData as String: data
        ]

        SecItemDelete(query as CFDictionary) // 删除旧的密码
        return SecItemAdd(query as CFDictionary, nil) == errSecSuccess
    }

    func getPassword(service: String, account: String) -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: account,
            kSecReturnData as String: kCFBooleanTrue!,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]

        var dataTypeRef: AnyObject?
        let status: OSStatus = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)

        if status == errSecSuccess {
            if let data = dataTypeRef as? Data {
                return String(data: data, encoding: .utf8)
            }
        }
        return nil
    }

    func deletePassword(service: String, account: String) {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: account
        ]
        SecItemDelete(query as CFDictionary)
    }
}

class KeychainHelper {
    static let shared = KeychainHelper()

    func savePassword(password: String) -> Bool {
        let data = password.data(using: .utf8)!
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: Constants.appName,
            kSecAttrAccount as String: Constants.authorName,
            kSecValueData as String: data
        ]

        SecItemDelete(query as CFDictionary) // 删除旧的密码
        return SecItemAdd(query as CFDictionary, nil) == errSecSuccess
    }

    func getPassword() -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: Constants.appName,
            kSecAttrAccount as String: Constants.authorName,
            kSecReturnData as String: kCFBooleanTrue!,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]

        var dataTypeRef: AnyObject?
        let status: OSStatus = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)

        if status == errSecSuccess {
            if let data = dataTypeRef as? Data {
                return String(data: data, encoding: .utf8)
            }
        }
        return nil
    }

    func deletePassword() {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: Constants.appName,
            kSecAttrAccount as String: Constants.authorName
        ]
        SecItemDelete(query as CFDictionary)
    }
}
