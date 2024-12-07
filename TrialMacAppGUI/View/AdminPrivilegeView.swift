//
//  AdminPrivilegeView.swift
//  TrialMacAppGUI
//
//  Created by TrialMacApp on 12/7/24.
//

import SwiftUI

struct AdminPrivilegeView: View {
    @Environment(\.dismiss) var dismiss
    @State private var password: String = ""
    @AppStorage("showAdminPrivilegeView") private var showAdminPrivilegeView: Bool = true

    @State private var showErrorAlert: Bool = false
    @State private var errorMessage: String? = ""

    @State private var isLoading: Bool = false

    init() {}

    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            VStack(spacing: 4) {
                Text("Please enter your password to continue.")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.secondary)
                Spacer()
                Text("Your password will be saved in the system keychain.")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }

            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 300)
                .controlSize(.large)
                .disableAutocorrection(true)
                .padding()
            
            VStack {
                if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .font(.subheadline)
                        .padding(.top, 10)
                        .padding(.bottom, 20)
                }
                
                HStack {
                    Button(action: {
                        isLoading = true
                        Task {
                            let success = await checkAndSavePassword(password: password)
                            if success {
                                showAdminPrivilegeView = false
                            }
                            isLoading = false
                        }
                    }) {
                        if isLoading {
                            ProgressView()
                        } else {
                            Text("Submit")
                        }
                    }
                    .keyboardShortcut(.defaultAction)
                    .disabled(isLoading)

                    Button {
                        dismiss()
                    } label: {
                        Text("View only without operation")
                    }
                }
            }
            Spacer()
        }
        .padding()
        .frame(width: 400, height: 250)
    }

    func checkAndSavePassword(password: String) async -> Bool {
        let success = Utils.checkPassword(password: password)
        if success {
            let saved = KeychainHelper.shared.savePassword(password: password)
            if saved {
                print("密码保存成功")
                return true
            } else {
                errorMessage = NSLocalizedString("Failed to save password, please try again.", comment: "")
                return false
            }
        } else {
            errorMessage = NSLocalizedString("Your password is incorrect, please check and try again.", comment: "")
            return false
        }
    }
}

#Preview {
    AdminPrivilegeView()
}
