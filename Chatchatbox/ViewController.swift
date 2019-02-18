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

class ViewController: UIViewController {
    

    private var currentState = ViewControllerState.notLoaded
    
    private func viewControllerChanged(to state: ViewControllerState) {
        loggingInfo(about: "View controller moved from state \(currentState) to state \(state)")
        currentState = state
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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

