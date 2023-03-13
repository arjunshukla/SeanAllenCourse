//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Arjun Shukla on 12/31/22.
//

import SwiftUI

@MainActor final class AppetizerListViewModel: ObservableObject {
    
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var isShowingDetail = false
    @Published var selectedAppetizer: Appetizer?

    func getAppetizers() {
        isLoading = true
        Task {
            do {
                appetizers = try await NetworkManager.shared.getAppetizers()
                isLoading = false
            } catch {
                if let apError = error as? APError {
                    switch apError {
                    case .invlidURL:
                        alertItem = AlertContext.invalidUrl
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                } else {
                    alertItem = AlertContext.invalidResponse // Can change to generic error
                }
                
                isLoading = false
            }
        }
    }
    
//    func getAppetizers() {
//        isLoading = true
//        NetworkManager.shared.getAppetizers { [self] result in
//            DispatchQueue.main.async {
//
//                isLoading = false
//
//                switch result {
//
//                case .success(let appetizers):
//                    self.appetizers = appetizers
//
//                case .failure(let error):
//
//                    switch error {
//
//                    case .invlidURL:
//                        alertItem = AlertContext.invalidUrl
//
//                    case .invalidResponse:
//                        alertItem = AlertContext.invalidResponse
//
//                    case .invalidData:
//                        alertItem = AlertContext.invalidData
//
//                    case .unableToComplete:
//                        alertItem = AlertContext.unableToComplete
//                    }
//                }
//            }
//        }
//    }
}
