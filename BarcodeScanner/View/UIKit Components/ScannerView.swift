//
//  ScannerView.swift
//  BarcodeScanner
//
//  Created by Matheus Pinheiro on 22/04/24.
//

import SwiftUI

struct ScannerView: UIViewControllerRepresentable {
    
    @Binding var scannedCode: String
    @Binding var alertItem: AlertItem?
    
    func makeUIViewController(context: Context) -> ScannerVC {
        ScannerVC(scannerDelegate: context.coordinator)
    }
    
    func updateUIViewController(_ uiViewController: ScannerVC, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    final class Coordinator: NSObject, ScannerVCDelegate {
        
        private let scannerView: ScannerView
        
        init(_ scannerView: ScannerView) {
            self.scannerView = scannerView
        }
        
        func didFind(barcode: String) {
            scannerView.scannedCode = barcode
        }
        
        func didSurface(error: CameraError) {
            switch error {
                case .invalidDeviceInput:
                    scannerView.alertItem = AlertContent.invalidDeviceInput
                case .invalidScannedValue:
                    scannerView.alertItem = AlertContent.invalidScannedType
            }
        }
    }
}

#Preview {
    ScannerView(
        scannedCode: .constant("12125667674"),
        alertItem: .constant(nil)
    )
}
