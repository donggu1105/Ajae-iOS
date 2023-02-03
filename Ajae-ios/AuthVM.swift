//
//  AuthVM.swift
//  Ajae-ios
//
//  Created by 강동현 on 2023/02/03.
//

import Foundation
import Combine

protocol AuthVM {
    
    func login() -> Void
    
    func logout() -> Void
    
}

