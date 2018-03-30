//
//  ViewController.swift
//  UsarLaCamaraiOS8Swift
//
//  Created by Jose David Bustos H on 21-01-17.
//  Copyright © 2017 Jose David Bustos H. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    //PROPIEDAD CONECTADA CON MI IMAGEN DEL STORYBOARD
    @IBOutlet var imageView: UIImageView!
    
    //VARIABLE A LA CLASE UIImagePickerController
    var miControladorImagen: UIImagePickerController!
    
    @IBAction func takePhoto(_ sender: UIButton) {
        
        //COMPROBAMOS SI EL DISPOSITIVO TIENE CÁMARA
        if (UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera)){
        miControladorImagen =  UIImagePickerController()
        miControladorImagen.delegate = self
        miControladorImagen.sourceType = .camera
        
        present(miControladorImagen, animated: true, completion: nil)
        }else{
            
            print ("No hay cámara")
            
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        var guardaImagen: UIImage!
        
        miControladorImagen.dismiss(animated: true, completion: nil)
        imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        guardaImagen = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        UIImageWriteToSavedPhotosAlbum(guardaImagen, nil, nil, nil);
    }
    
}

