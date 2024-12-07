//
//  Constants.swift
//  TrialMacAppGUI
//
//  Created by TrialMacApp on 12/7/24.
//

import Foundation

enum Constants {
    static let appName = "TrialMacAppGUI"
    static let authorName = "TrialMacApp"
    static let authorHomepageUrl = URL(string: "https://github.com/TrialMacApp")!
    static let dylibName = "libTrialMacApp.dylib"
    
    static let localOptoolPath = URL(string: Bundle.main.path(forResource: "optool", ofType: "") ?? "")!
    static let localDylibPath = URL(string: Bundle.main.path(forResource: "libTrialMacApp", ofType: "dylib") ?? "")!
    
    static let cmdDylibPath = localDylibPath.path.replacingOccurrences(of: " ", with: "\\\\ ")
    static let cmdOptoolPath = localOptoolPath.path.replacingOccurrences(of: " ", with: "\\\\ ")
}
