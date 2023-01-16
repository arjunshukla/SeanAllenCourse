//
//  ScannerView.swift
//  BarcodeScanner
//
//  Created by Arjun Shukla on 10/19/22.
//

import SwiftUI

struct ScannerView: UIViewControllerRepresentable {

    @Binding var scannedCode: String
    @Binding var alertItem: AlertItem?

    func makeUIViewController(context: Context) -> some UIViewController {
        ScannerVC(delegate: context.coordinator)
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(scannerView: self)
    }
    
    final class Coordinator: NSObject, ScannerVCDelegate {

        private let scannerView: ScannerView
        
        init(scannerView: ScannerView) {
            self.scannerView = scannerView
        }

        func didFind(barcode: String) {
            print(barcode)
            scannerView.scannedCode = barcode
        }
        
        func didSurface(error: CameraError) {
            switch error {
            case .invalidDeviceInput:
                scannerView.alertItem = AlertContext.invalidDeviceInput
            case .invalidScannedValue:
                scannerView.alertItem = AlertContext.invalidScannedType
            }
        }
    }
}

//struct ScannerView_Previews: PreviewProvider {
//    static var previews: some View {
//        ScannerView(scannedCode: .constant("1234567890"), alertItem: nil)
//    }
//}
