//
//  PhotoViewController.swift
//  Pictures
//
//  Created by Kevin Solorio on 6/17/14.
//  Copyright (c) 2014 Kevin Solorio. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }
    
    convenience init() {
        let bundle = NSBundle.mainBundle()
        self.init(nibName: "PhotoViewController", bundle:bundle)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        photoButton.title = "Photo"
        shareButton.title = "Share"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // Outlets
    @IBOutlet var photoButton : UIBarButtonItem
    @IBOutlet var image : UIImageView
    @IBOutlet var shareButton : UIBarButtonItem
    
    
    // Actions
    @IBAction func takePhoto(sender : UIBarButtonItem) {
        let capture = UIImagePickerController()
        capture.delegate = self
        
        if UIImagePickerController.isSourceTypeAvailable(.Camera) {
            capture.sourceType = .Camera
                    }
        else {
            capture.sourceType = .PhotoLibrary
        }
        self.presentViewController(capture, animated: true, completion: nil)

    }

    @IBAction func share(sender : AnyObject) {
        let jpeg = UIImageJPEGRepresentation(image.image, 0.8)
        
    }
    
    
    // Delegate Methods
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!) {
        self.image.image = image as UIImage
        self.dismissModalViewControllerAnimated(true)
    }
    
    

}