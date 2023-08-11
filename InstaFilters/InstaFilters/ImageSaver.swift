//
//  ImageSaver.swift
//  InstaFilters
//
//  Created by Riccardo Fano on 2023-08-11.
//

import SwiftUI

class ImageSaver: NSObject {
    func writeToPhotoAlbum(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveCompleted), nil)
    }
    
    @objc func saveCompleted(_ image: UIImage?, didFinishSavingWithError: Error?, contextInfo: UnsafeRawPointer) {
        print("Save finished")
    }
}
