//
//  ViewController.swift
//  Chatchatbox
//
//  Created by Anna Nosova on 11/02/2019.
//  Copyright © 2019 Anna Nosova. All rights reserved.
//

import UIKit

enum ViewControllerState: String {
    case appearing, appeared, disappearing, disappeared, notLoaded, loaded, layouting, layouted
}

class ProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    
    var photoWasSelected: Bool = false
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var editPhotoView: UIView!
    
    
    private var currentState = ViewControllerState.notLoaded
    
    private func viewControllerChanged(to state: ViewControllerState) {
        loggingInfo(about: "View controller moved from state \(currentState) to state \(state)")
        currentState = state
    }
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        //print(editButton.frame)
        //frame id unavailable, as view hasn't been loaded yet
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        //print(editButton.frame)
        //frame id unavailable, as view hasn't been loaded yet
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews() // update all views' state
        
        
        loggingInfo(about: "Function: \(#function))")
        viewControllerChanged(to: .loaded)
        print(editButton.frame)  // sized frame from Storyboard
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        loggingInfo(about: "Function: \(#function))")
        viewControllerChanged(to: .appearing)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        loggingInfo(about: "Function: \(#function))")
        viewControllerChanged(to: .appeared)
        print(editButton.frame) // frame after Auto layout usage
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        loggingInfo(about: "Function: \(#function))")
        viewControllerChanged(to: .layouting)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        loggingInfo(about: "Function: \(#function))")
        viewControllerChanged(to: .layouted)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        loggingInfo(about: "Function: \(#function))")
        viewControllerChanged(to: .disappearing)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        loggingInfo(about: "Function: \(#function))")
        viewControllerChanged(to: .disappeared)
        
    }

    func initViews() {
        userImage.layer.cornerRadius = editPhotoView.frame.width*0.5
        userImage.clipsToBounds = true
        
        editPhotoView.layer.cornerRadius = editPhotoView.frame.width*0.5
        editPhotoView.clipsToBounds = true
        
        editButton.layer.cornerRadius = 15
        editButton.layer.borderColor = UIColor.black.cgColor
        editButton.layer.borderWidth = 2.0
        editButton.clipsToBounds = true
    }
    
    
    @IBAction func cameraViewTapped(_ sender: Any) {
        print("Choose photo")
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        let photoPickerAlertController = UIAlertController(title: "Select profile photo", message: nil, preferredStyle: .actionSheet)
        let cancelAlert = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        photoPickerAlertController.addAction(cancelAlert)
        
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let photoGalleryAlert = UIAlertAction(title: "Select photo from gallery", style: .default) { [weak self] action in
                guard let `self` = self else { return }
                imagePicker.sourceType = .photoLibrary
                self.present(imagePicker, animated: true, completion: nil)
            }
            photoPickerAlertController.addAction(photoGalleryAlert)
        }
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraAlert = UIAlertAction(title: "Take photo", style: .default) { [weak self] action in
                guard let `self` = self else { return }
                imagePicker.sourceType = .camera
                self.present(imagePicker, animated: true, completion: nil)
            }
            photoPickerAlertController.addAction(cameraAlert)
        }
        
        if photoWasSelected {
            let deleteAlert = UIAlertAction(title: "Delete photo", style: .destructive) { [weak self] action in
                guard let `self` = self else { return }
                self.userImage.image = UIImage(named: "placeholder-user")
                self.photoWasSelected = false
            }
            photoPickerAlertController.addAction(deleteAlert)
        }
        
        present(photoPickerAlertController, animated: true, completion: nil)
    }
    
    // необходимо по протоколу
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let userPhoto = info[.originalImage] as? UIImage else { return }
        userImage.image = userPhoto
        photoWasSelected = true
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
}

