//
//  ViewController.swift
//  Programmatic UI Test
//
//  Created by Batuhan Berk Ertekin on 10.08.2024.
//

import UIKit

class HomeVC: UIViewController {
    
    private let nextButton: UIButton = {
        let button = UIButton()
        button.configuration = .filled()
        button.configuration?.baseBackgroundColor = .white
        button.configuration?.title = "Next Page"
        button.configuration?.baseForegroundColor = .black
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        return button
    }()
    
    private let firstTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.placeholder = "First Text Field"
        textField.backgroundColor = UIColor(white: 0.9, alpha: 0.3)
        textField.textAlignment = .center
        textField.layer.cornerRadius = 8
        textField.layer.borderColor = UIColor.systemGray4.cgColor
        textField.layer.borderWidth = 2
        textField.leftViewMode = .always
        textField.font = UIFont.systemFont(ofSize: 16)
        return textField
    }()
    
    private let secondTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.placeholder = "Second Text Field"
        textField.textAlignment = .center
        textField.backgroundColor = UIColor(white: 0.9, alpha: 0.3)
        textField.layer.cornerRadius = 8
        textField.layer.borderColor = UIColor.systemGray4.cgColor
        textField.layer.borderWidth = 2
        textField.leftViewMode = .always
        textField.font = UIFont.systemFont(ofSize: 16)
        return textField
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "signIn")
        imageView.contentMode = .scaleAspectFill
        imageView.tintColor = .systemBlue
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
      
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemBackground
        setupUI()
    }

    private func setupUI() {

        view.addSubview(imageView)
        view.addSubview(firstTextField)
        view.addSubview(secondTextField)
        view.addSubview(nextButton)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        firstTextField.translatesAutoresizingMaskIntoConstraints = false
        secondTextField.translatesAutoresizingMaskIntoConstraints = false
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        nextButton.addTarget(self, action: #selector(goToNextScreen), for: .touchUpInside)
     
        NSLayoutConstraint.activate([
         
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -70),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 400),
            imageView.heightAnchor.constraint(equalToConstant: 300),
            
           
            firstTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            firstTextField.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 70),
            firstTextField.widthAnchor.constraint(equalToConstant: 350),
            firstTextField.heightAnchor.constraint(equalToConstant: 55),
            
            secondTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            secondTextField.topAnchor.constraint(equalTo: firstTextField.bottomAnchor, constant: 10),
            secondTextField.widthAnchor.constraint(equalToConstant: 350),
            secondTextField.heightAnchor.constraint(equalToConstant: 55),
            
           
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.topAnchor.constraint(equalTo: secondTextField.bottomAnchor, constant: 30),
            nextButton.widthAnchor.constraint(equalToConstant: 300),
            nextButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func goToNextScreen() {
        let nextScreen = ItemListVC()
        nextScreen.title = "Items"
        navigationController?.pushViewController(nextScreen, animated: true)
    }
}
