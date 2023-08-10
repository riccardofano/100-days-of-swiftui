//
//  ImagePicker.swift
//  InstaFilters
//
//  Created by Riccardo Fano on 2023-08-10.
//

import Foundation
import SwiftUI
import PhotosUI

struct ImagePicker: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
        config.filter = .images
        
        let picker = PHPickerViewController(configuration: config)
        return picker
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) { }
}
