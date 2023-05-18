//
//  UserViewModel.swift
//  ProtocolOriantedUIKit
//
//  Created by Yusuf Mert Yıldız on 18.05.2023.
//

import Foundation
import UIKit

class UserViewModel {
    
    private let userService : UserService
    weak var output : UserViewModelOutput?
    
    init(userService: UserService) {
        self.userService = userService
    }
    
    
    
    func fetchUser(){
        userService.fetchUser { [weak self] result in
            switch result {
            case .success(let user):
                self?.output?.updateView(name: user.name, username: user.username, email: user.email)
            case .failure(_):
                self?.output?.updateView(name: "No user", username: "", email: "")

            }
        }
    }
}
