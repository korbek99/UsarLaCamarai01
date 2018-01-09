//
//  ViewController.swift
//  UsarLaCamaraiOS8Swift
//
//  Created by Sergio Becerril on 10/2/15.
//  Copyright (c) 2015 Sergio Becerril. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    //PROPIEDAD CONECTADA CON MI IMAGEN DEL STORYBOARD
    @IBOutlet var imageView: UIImageView!
    
    //VARIABLE A LA CLASE UIImagePickerController
    var miControladorImagen: UIImagePickerController!
    
    @IBAction func takePhoto(sender: UIButton) {
        
        //COMPROBAMOS SI EL DISPOSITIVO TIENE CÁMARA
        if (UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)){
        miControladorImagen =  UIImagePickerController()
        miControladorImagen.delegate = self
        miControladorImagen.sourceType = .Camera
        
        presentViewController(miControladorImagen, animated: true, completion: nil)
        }else{
            
            print ("No hay cámara")
            
        }
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        var guardaImagen: UIImage!
        
        miControladorImagen.dismissViewControllerAnimated(true, completion: nil)
        imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        guardaImagen = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        UIImageWriteToSavedPhotosAlbum(guardaImagen, nil, nil, nil);
    }
    
}

