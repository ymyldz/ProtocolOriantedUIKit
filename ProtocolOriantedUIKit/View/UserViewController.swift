//
//  ViewController.swift
//  ProtocolOriantedUIKit
//
//  Created by Yusuf Mert Yıldız on 16.05.2023.
//

import UIKit

class UserViewController: UIViewController , UserViewModelOutput {
    
    func updateView(name: String, username: String, email: String) {
        self.nameLabel.text = name
        self.usernameLabel.text = username
        self.emailLabel.text = email
    }

    private let viewModel : UserViewModel
    
    private let nameLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let usernameLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let emailLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init(viewModel: UserViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.output = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
       // fetchUsers()
        viewModel.fetchUser()
        
    }

    private func setupViews() {
        view.backgroundColor = .systemRed
        view.addSubview(nameLabel)
        view.addSubview(usernameLabel)
        view.addSubview(emailLabel)
                
        NSLayoutConstraint.activate([
        
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 60),
            nameLabel.widthAnchor.constraint(equalToConstant: 200),
            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            
            usernameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            usernameLabel.heightAnchor.constraint(equalToConstant: 60),
            usernameLabel.widthAnchor.constraint(equalToConstant: 200),
            usernameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            
            emailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailLabel.heightAnchor.constraint(equalToConstant: 60),
            emailLabel.widthAnchor.constraint(equalToConstant: 200),
            emailLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 10)
        
        
        
        
        
        
        ])
        nameLabel.text = "Yusuf"
        usernameLabel.text = "ymyldz"
        emailLabel.text = "ymyildiz1905@gmail.com"
        
    }
//
//    private func fetchUsers() {
//        APIManager.shared.fetchUser { result in
//            switch result {
//            case .success(let user):
//                self.nameLabel.text = user.name
//                self.usernameLabel.text = user.username
//                self.emailLabel.text = user.email
//
//            case .failure:
//                self.nameLabel.text = "No user found"
//            }
//        }
//    }
}

