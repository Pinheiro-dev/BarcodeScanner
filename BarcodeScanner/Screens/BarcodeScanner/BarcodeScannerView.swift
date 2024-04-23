//
//  ContentView.swift
//  BarcodeScanner
//
//  Created by Matheus Pinheiro on 18/04/24.
//

import SwiftUI

struct BarcodeScannerView: View {
    @StateObject var viewModel = BarcodeScannerViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                ScannerView(
                    scannedCode: $viewModel.scannedCode,
                    alertItem: $viewModel.alertItem
                )
                .frame(maxWidth: .infinity, maxHeight: 300)
                
                Spacer().frame(height: 60)
                
                Label("Scanned Barcode:", systemImage: "barcode.viewfinder")
                    .font(.title)
                
                Text(viewModel.statusText)
                    .bold()
                    .font(.largeTitle)
                    .foregroundStyle(viewModel.statusTextColor)
                    .padding()
            }
            .navigationTitle("Barcode Scanner")
            .alert(
                viewModel.alertItem?.title ?? "Error",
                isPresented: .constant(viewModel.alertItem != nil),
                presenting: viewModel.alertItem
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
