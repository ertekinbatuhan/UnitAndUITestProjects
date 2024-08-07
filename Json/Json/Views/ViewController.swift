//
//  ViewController.swift
//  Json
//
//  Created by Batuhan Berk Ertekin on 6.08.2024.
//

import UIKit

class ViewController: UIViewController, UserViewModelProtocol {
    
    private let viewModel : UserViewModel
    
    func updateView(name: String, userName: String, email: String) {
    
        self.nameLabel.text = name
        self.userNameLabel.text = userName
        self.emailLabel.text = email
    }
    
    
    init(viewModel: UserViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.viewModelProtocol = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private let nameLabel : UILabel = {
       
        let label = UILabel()
        label.textAlignment  = .center
        
       
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let userNameLabel : UILabel = {
       
        let label = UILabel()
        label.textAlignment  = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let emailLabel : UILabel = {
       
        let label = UILabel()
        label.textAlignment  = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        setupsView()
        viewModel.fetchUsers()
        
    }


    private func setupsView() {
        view.backgroundColor = .yellow
        view.addSubview(emailLabel)
        view.addSubview(nameLabel)
        view.addSubview(userNameLabel)
        
        NSLayoutConstraint.activate([
        
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 60),
            nameLabel.widthAnchor.constraint(equalToConstant: 200),
            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            
            emailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailLabel.heightAnchor.constraint(equalToConstant: 60),
            emailLabel.widthAnchor.constraint(equalToConstant: 200),
            emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            
            userNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userNameLabel.heightAnchor.constraint(equalToConstant: 60),
            userNameLabel.widthAnchor.constraint(equalToConstant: 200),
            userNameLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10),
            
        ])
    }
}

