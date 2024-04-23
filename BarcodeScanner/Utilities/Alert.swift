//
//  Alert.swift
//  BarcodeScanner
//
//  Created by Matheus Pinheiro on 23/04/24.
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
