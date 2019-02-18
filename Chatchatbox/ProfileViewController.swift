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

class ProfileViewController: UIViewController {
    
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var choosePhotoButton: UIButton!
    
    var imagePicker = UIImagePickerController()
    
    
    
    
    
    private var currentState = ViewControllerState.notLoaded
    
    private func viewControllerChanged(to state: ViewControllerState) {
        loggingInfo(about: "View controller moved from state \(currentState) to state \(state)")
        currentState = state
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(self.editButton.frame, "- viewDidLoad()")
        let defaultPtofileImage: UIImage = UIImage(named: "placeholder-user")!
        let choosePhotoImage: UIImage = UIImage(named: "slr-camera-2-xxl")!
        self.choosePhotoButton.contentMode = .scaleAspectFit
        self.choosePhotoButton.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        self.choosePhotoButton.setImage(choosePhotoImage , for: .normal)
        self.profileImage.image = defaultPtofileImage
        self.profileImage.layer.masksToBounds = true
        self.profileImage.clipsToBounds = true
        self.choosePhotoButton.layer.masksToBounds = true
        self.profileImage.layer.cornerRadius = choosePhotoButton.bounds.size.width / 2.0
        self.choosePhotoButton.layer.cornerRadius = choosePhotoButton.bounds.size.width / 2.0
        self.editButton.layer.cornerRadius = 10
        self.editButton.layer.borderWidth = 1
        self.choosePhotoButton.clipsToBounds = true

        
        
        loggingInfo(about: "Function: \(#function))")
        viewControllerChanged(to: .loaded)
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


}

