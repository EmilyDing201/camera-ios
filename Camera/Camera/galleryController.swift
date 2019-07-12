//
//  galleryController.swift
//  Camera
//
//  Created by GWC on 7/12/19.
//  Copyright © 2019 Emily Ding. All rights reserved.
//

import UIKit

class galleryController: UIViewController {

    @IBOutlet weak var galleryImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        getImage(imageName: "test.png")
        
    }
    
    
    
    func getImage(imageName:String){
        let fileManager = FileManager.default
        let imagePath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(imageName)
        if fileManager.fileExists(atPath: imagePath) {
            let image=UIImage(contentsOfFile: imagePath)
            let newImage = UIImage(cgImage: (image?.cgImage!)!, scale: (image?.scale)!, orientation: .right)
            galleryImage.image = newImage
        }
        else {
            print("Oh no! No Image!")
        }
        
    }


}
