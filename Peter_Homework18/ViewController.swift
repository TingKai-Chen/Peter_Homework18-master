//
//  ViewController.swift
//  Peter_Homework18
//
//  Created by 陳庭楷 on 2018/12/23.
//  Copyright © 2018年 TingKai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var pictureImageView: UIImageView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        let rightBarButton2 = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.camera, target: self, action: #selector(image))
        
        let rightBarButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.action, target: self, action: #selector(share))
        
        self.navigationItem.rightBarButtonItems = [rightBarButton,rightBarButton2]
        
    }
    
    @objc func image () {
        
        let alert = UIAlertController(title: "Choose Image Source", message: nil, preferredStyle: .actionSheet)
        
        let action_Cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
        
        })
        
        let action_Camera = UIAlertAction(title: "Camera", style: .default, handler: { (action) in
            
            let controller = UIImagePickerController()
            
            controller.delegate = self
            
            controller.sourceType = .camera
            
            self.present( controller , animated: true , completion: nil )
            
        })
        
        let action_PhotoLibrary = UIAlertAction(title: "PhotoLibrary", style: .default, handler: { (action) in
            
            let controller = UIImagePickerController()
            
            controller.delegate = self
            
            controller.sourceType = .photoLibrary
            
            self.present( controller , animated:  true , completion: nil )
            
        })
        
        alert.addAction(action_Cancel)
        
        alert.addAction(action_Camera)
        
        alert.addAction(action_PhotoLibrary)
        
        self.present( alert , animated: true , completion: nil )
        
    }
    
    @objc func share () {
        
        let activityController = UIActivityViewController(activityItems: [ self.pictureImageView.image ], applicationActivities: nil)
        
        activityController.popoverPresentationController?.sourceView = self.view
        
        self.present( activityController , animated: true , completion: nil )
        
    }
    
}

extension ViewController: UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        picker.dismiss(animated: true)
        
        guard let image = info[.originalImage] as? UIImage else {
            
            print("No image found")
            
            return
            
        }
        
        self.pictureImageView.image = image
        
    }
    
}

extension ViewController : UINavigationControllerDelegate {
    
}
