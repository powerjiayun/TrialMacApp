//
//  Utils.swift
//  TrialMacAppGUI
//
//  Created by TrialMacApp on 12/7/24.
//

import SwiftUI

class Utils {
    public static func checkPassword(password: String) -> Bool {
        let command = "sudo -v"
        if let output = Utils.runSudoShellCommandByScriptWithPwd(command, password: password) {
            if output.contains("no password") || output.contains("not allowed") || output.contains("Sorry") {
                return false
            } else {
                return true
            }
        }
        return false
    }
    
    // 同步版本
    public static func runSudoShellCommandByScript(_ command: String, sudo: Bool = true) -> String? {
        // 创建一个信号量用于同步
        let semaphore = DispatchSemaphore(value: 0)
        var resultOutput: String?
        
        // 在后台队列执行 AppleScript
        DispatchQueue.global(qos: .userInitiated).async {
            autoreleasepool {
                var script = "do shell script \"\(command)\""
                if sudo {
                    script += " with administrator privileges"
                }
                
                guard let appleScript = NSAppleScript(source: script) else {
                    semaphore.signal()
                    return
                }
                
                var error: NSDictionary?
                let result = appleScript.executeAndReturnError(&error)
                
                if let error = error {
                    print(script)
                    print("Error: \(error)")
                } else if let output = result.stringValue {
                    resultOutput = output
                } else {
                    resultOutput = ""
                }
                
                semaphore.signal()
            }
        }
        
        // 等待执行完成
        _ = semaphore.wait(timeout: .now() + 30) // 添加超时时间
        return resultOutput
    }
    
    // 同步版本
    public static func runSudoShellCommandByScriptWithPwd(_ command: String, password: String) -> String? {
        // 创建一个信号量用于同步
        let semaphore = DispatchSemaphore(value: 0)
        var resultOutput: String?
        
        // 在后台队列执行 AppleScript
        DispatchQueue.global(qos: .userInitiated).async {
            autoreleasepool {
                let script = "do shell script \"echo \(password) | sudo -S \(command)\""
               
                guard let appleScript = NSAppleScript(source: script) else {
                    semaphore.signal()
                    return
                }
                
                var error: NSDictionary?
                let result = appleScript.executeAndReturnError(&error)
                
                if let error = error {
                    print(script)
                    print("Error: \(error)")
                } else if let output = result.stringValue {
                    resultOutput = output
                } else {
                    resultOutput = ""
                }
                
                semaphore.signal()
            }
        }
        
        // 等待执行完成
        _ = semaphore.wait(timeout: .now() + 30) // 添加超时时间
        return resultOutput
    }
}
