//
//  ContentView.swift
//  BarcodeScanner
//
//  Created by Matheus Pinheiro on 18/04/24.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: String
    let message: String
}

struct AlertContent {
    static let invalidDeviceInput = AlertItem(
        title: "Invalid Device Input",
        message: "Something is wrong with the camera. We are unable to capture the input."
    )
    
    static let invalidScannedType = AlertItem(
        title: "Invalid Device Input",
        message: "The value scanned is not valid. This app scans EAN-8 anda EAN-13."
    )
}

struct BarcodeScannerView: View {
    
    @State private var scannedCode: String = ""
    @State private var alertItem: AlertItem?
    
    var body: some View {
        NavigationStack {
            VStack {
                ScannerView(
                    scannedCode: $scannedCode,
                    alertItem: $alertItem
                )
                .frame(maxWidth: .infinity, maxHeight: 300)
                
                Spacer().frame(height: 60)
                
                Label("Scanned Barcode:", systemImage: "barcode.viewfinder")
                    .font(.title)
                
                Text(scannedCode.isEmpty ? "Not Yet Scanned" : scannedCode)
                    .bold()
                    .font(.largeTitle)
                    .foregroundStyle(scannedCode.isEmpty ? .red : .green)
                    .padding()
            }
            .navigationTitle("Barcode Scanner")
            .alert(
                alertItem?.title ?? "Error",
                isPresented: .constant(alertItem != nil),
                presenting: alertItem
            ) { article in
                Button("Ok") {}
            } message: { article in
                Text(article.message)
            }
        }
    }
}

#Preview {
    BarcodeScannerView()
}
