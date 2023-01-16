//
//  AccountView.swift
//  Appetizers
//
//  Created by Arjun Shukla on 12/26/22.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject private var viewModel = AccountViewModel()
    
    var body: some View {
        ZStack {
            NavigationView {
                Form {
                    Section(header: Text("PERSONAL INFO")) {
                        TextField("First Name", text: $viewModel.user.firstName)
                        TextField("Last Name", text: $viewModel.user.lastName)
                        TextField("Email", text: $viewModel.user.email)
                            .keyboardType(.emailAddress)
                            .disableAutocorrection(true)
                        DatePicker("Birthday", selection: $viewModel.user.birthdate, displayedComponents: .date)
                        Button {
                            print("Save changes tapped")
                            viewModel.saveChanges()
                        } label: {
                            Text("Save changes")
                        }
                    }
                    
                    Section("REQUESTS") {
                        Toggle("Extra Napkins", isOn: $viewModel.user.extraNapkins)
                        Toggle("Frequent Refills", isOn: $viewModel.user.frequestRefills)
                    }
                    .toggleStyle(SwitchToggleStyle(tint: Color.brandPrimary))
                }
                .navigationTitle("😂 Account")
            }
        }
        .onAppear {
            viewModel.retreiveUser()
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
    }
}

struct AppetizerAccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
