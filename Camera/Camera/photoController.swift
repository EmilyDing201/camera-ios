//
//  photoController.swift
//  Camera
//
//  Created by GWC on 7/12/19.
//  Copyright © 2019 Emily Ding. All rights reserved.
//

import UIKit

class photoController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var myImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func saveImage(imageName: String){
        let fileManager = FileManager.default
        let imagePath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(imageName)
        let image = mainImage.image!
        let imageData = image.pngData()
        fileManager.createFile(atPath: imagePath as String, contents: imageData, attributes: nil)
        
    }
    
    @IBAction func savePhoto(_ sender: Any) {
        saveImage(imageName: "test.png")
    }
    
    @IBAction func takePhoto(_ sender: Any) {
        let imagePickerController=UIImagePickerController()
        
        imagePickerController.sourceType = .camera
        
        imagePickerController.delegate=self
        
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        picker.dismiss(animated: true, completion: nil)
    
        mainImage.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
    }
    
    @IBAction func filter1(_ sender: Any) {
        let context = CIContext()
        let filter = CIFilter(name: "CISepiaTone")!
        filter.setValue(0.8, forKey: kCIInputIntensityKey)
        let image = CIImage(image: mainImage.image!)
        filter.setValue(image, forKey: kCIInputImageKey)
        let result = filter.outputImage!
        let cgImage = context.createCGImage(result, from: result.extent)
        let filteredImage = UIImage(cgImage: cgImage!)
        let newImage = UIImage(cgImage: (filteredImage.cgImage!), scale: (filteredImage.scale), orientation: .right)
        mainImage.image = newImage
        
    }
    
    @IBAction func filter2(_ sender: Any) {
        let context = CIContext()
        let filter = CIFilter(name: "CICMYKHalftone")!
        let image = CIImage(image: mainImage.image!)
        filter.setValue(25, forKey: kCIInputWidthKey)
        filter.setValue(image, forKey: kCIInputImageKey)
        filter.setValue(image, forKey: kCIInputImageKey)
        let result = filter.outputImage!
        let cgImage = context.createCGImage(result, from: result.extent)
        let filteredImage = UIImage(cgImage: cgImage!)
        let newImage = UIImage(cgImage: (filteredImage.cgImage!), scale: (filteredImage.scale), orientation: .right)
        mainImage.image = newImage
        
    }
    
    @IBAction func filter3(_ sender: Any) {
        let context = CIContext()
        let image = CIImage(image: mainImage.image!)
        let filter = CIFilter(name: "CIPhotoEffectInstant")!
        filter.setValue(image, forKey: kCIInputImageKey)
        filter.setValue(image, forKey: kCIInputImageKey)
        let result = filter.outputImage!
        let cgImage = context.createCGImage(result, from: result.extent)
        let filteredImage = UIImage(cgImage: cgImage!)
        let newImage = UIImage(cgImage: (filteredImage.cgImage!), scale: (filteredImage.scale), orientation: .right)
        mainImage.image = newImage
        
    }
    
    
}
