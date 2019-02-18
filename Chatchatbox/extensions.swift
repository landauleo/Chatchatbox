//
//  extensions.swift
//  Chatchatbox
//
//  Created by Anna Nosova on 17/02/2019.
//  Copyright © 2019 Anna Nosova. All rights reserved.
//

import Foundation
import UIKit

extension Logging {
    func loggingInfo(about: String) {
        #if DEBUG
        print(about)
        #endif
    }
}

extension ProfileViewController: Logging {}
extension AppDelegate: Logging {}
