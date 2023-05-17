//
//  UserViewModelOutpus.swift
//  ProtocolOriantedUIKit
//
//  Created by Yusuf Mert Yıldız on 18.05.2023.
//

import Foundation

protocol UserViewModelOutput : AnyObject {
    func updateView(name:String,username:String,email:String)
}
