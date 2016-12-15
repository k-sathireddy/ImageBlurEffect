//
//  ViewController.swift
//  ImageBlurEffect
//
//  Created by Enterpi mini mac on 12/15/16.
//  Copyright © 2016 Enterpi mini mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var blurButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func blurButtonTapped(_ sender: Any) {
        
            let inputImage = CIImage(cgImage: (self.bgImageView.image?.cgImage)!)
            let filter = CIFilter(name: "CIGaussianBlur")
            filter?.setValue(inputImage, forKey: "inputImage")
            filter?.setValue(10, forKey: "inputRadius")
            let blurred = filter?.outputImage
            
            var newImageSize: CGRect = (blurred?.extent)!
            newImageSize.origin.x += (newImageSize.size.width - (self.bgImageView.image?.size.width)!) / 2
            newImageSize.origin.y += (newImageSize.size.height - (self.bgImageView.image?.size.height)!) / 2
            newImageSize.size = (self.bgImageView.image?.size)!
            
            let resultImage: CIImage = filter?.value(forKey: "outputImage") as! CIImage
            let context: CIContext = CIContext.init(options: nil)
            let cgimg: CGImage = context.createCGImage(resultImage, from: newImageSize)!
            let blurredImage: UIImage = UIImage.init(cgImage: cgimg)
            self.bgImageView.image = blurredImage
    }
    
}

