//
//  ViewController.swift
//  Authentication
//
//  Created by Batuhan Berk Ertekin on 8.08.2024.
//

import UIKit

class RootViewController: UIViewController , RootViewModelOutput {

    private let viewModel : RootViewModel
    
    init(viewModel: RootViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        viewModel.output = self
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .yellow
        checkLogin()
    }

    func checkLogin() {
        
        if let accessToken = UserDefaults.standard.string(forKey: "ACCESS_TOKEN"), !accessToken.isEmpty {
            
            showMain()
        } else {
            showLogin()
        }
        
    }
    
    func showMain(){
        let mainViewController = MainViewController()
        navigationController?.present(mainViewController,animated: true)
    }
    
    func showLogin(){
        let loginViewController = LoginViewController()
        navigationController?.present(loginViewController,animated: true)
    }
}



