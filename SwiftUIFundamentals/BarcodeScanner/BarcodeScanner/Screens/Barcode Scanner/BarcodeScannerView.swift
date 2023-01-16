//
//  BarcodeScannerView.swift
//  BarcodeScanner
//
//  Created by Arjun Shukla on 10/15/22.
//

import SwiftUI

struct BarcodeScannerView: View {
    
    @StateObject var viewModel = BarcodeScannerViewModel()
    
//    @State private var isShowingAlert = false

    var body: some View {
        NavigationView {
            VStack {
                ScannerView(scannedCode: $viewModel.scannedCode, alertItem: $viewModel.alertItem)
                    .frame(maxWidth: .infinity, maxHeight: 300, alignment: .center)
                
                Spacer()
                    .frame(height: 60)

                Label("Scanned Barcode:", systemImage: "barcode.viewfinder")
                    .font(.title)
                
                Text(viewModel.statusText)
                    .bold()
                    .fontWeight(.heavy)
                    .font(.largeTitle)
                    .foregroundColor(viewModel.statusTextColor)
                    .padding()
                
//                To show quick alert
//                Button {
//                    isShowingAlert.toggle()
//                } label: {
//                    Text("Tap Me")
//                }
            }
            .navigationTitle("Barcode Scanner")
            .alert(item: $viewModel.alertItem) { alertItem in
                Alert(title: Text(alertItem.title), message: Text(alertItem.message), dismissButton: alertItem.dismissButton)
            }
//            .alert(isPresented: $isShowingAlert) {
//                Alert(title: Text("Test"), message: Text("This is a test"), dismissButton: .default(Text("OK")))
//            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BarcodeScannerView()
    }
}
