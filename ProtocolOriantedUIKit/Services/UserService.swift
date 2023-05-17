//
//  UserService.swift
//  ProtocolOriantedUIKit
//
//  Created by Yusuf Mert Yıldız on 18.05.2023.
//

import Foundation

protocol UserService {
    func fetchUser(completion : @escaping(Result<User,Error>) -> Void)
}
