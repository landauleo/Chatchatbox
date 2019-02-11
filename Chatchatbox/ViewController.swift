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
        #if DEBUG
        print("View controller moved from state \(currentState) to state \(state)")
        #endif
        currentState = state
    }
    
    private func loggingInfo(functionName: String) {
        #if DEBUG
        print(functionName)
        #endif
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loggingInfo(functionName: "Function: \(#function))")
        viewControllerChanged(to: .loaded)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        loggingInfo(functionName: "Function: \(#function))")
        viewControllerChanged(to: .appearing)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        loggingInfo(functionName: "Function: \(#function))")
        viewControllerChanged(to: .appeared)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        loggingInfo(functionName: "Function: \(#function))")
        viewControllerChanged(to: .layouting)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        loggingInfo(functionName: "Function: \(#function))")
        viewControllerChanged(to: .layouted)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        loggingInfo(functionName: "Function: \(#function))")
        viewControllerChanged(to: .disappearing)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        loggingInfo(functionName: "Function: \(#function))")
        viewControllerChanged(to: .disappeared)
    }


}

