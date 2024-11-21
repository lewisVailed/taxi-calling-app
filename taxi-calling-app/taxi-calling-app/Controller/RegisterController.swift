//
//  RegisterController.swift
//  taxi-calling-app
//
//  Created by Ayberk Bilgiç on 21.11.2024.
//

import UIKit

class RegisterController: UIViewController {

    // MARK: - UI Components
    let usernameTextField = CustomTextField(fieldType: .username)
    let emailTextField = CustomTextField(fieldType: .email)
    let passwordTextField = CustomTextField(fieldType: .password)
    
    let registerButton = CustomButton(content: .text(title: "Kayıt Ol"), fontSize: .medium, hasBackground: true)
    let alreadyRegisterButton = CustomButton(content: .text(title: "Zaten bir üyeliğiniz var mı? Giriş yapın!"), fontSize: .small, hasBackground: false)
    
    let googleButton = CustomButton(content: .logo(image: UIImage(named: "instaIcon")!), fontSize: .big, hasBackground: false)
    let instagramButton = CustomButton(content: .logo(image: UIImage(named: "googleIcon")!), fontSize: .medium, hasBackground: false)
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        setupUIElements()
    }
    
    // MARK: - Background Setup
    private func setupBackground() {
        // Beyaz arka plan
        view.backgroundColor = .red
        
        // Kırmızı alt alan
        let redBackgroundView = UIView()
        redBackgroundView.backgroundColor = UIColor.white
        redBackgroundView.layer.cornerRadius = 40 // Köşe yuvarlatma
        redBackgroundView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        redBackgroundView.clipsToBounds = true
        redBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(redBackgroundView)
        
        // AutoLayout ile konumlandırma
        NSLayoutConstraint.activate([
            redBackgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            redBackgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            redBackgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            redBackgroundView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.78)
        ])
    }
    
    
    
    // MARK: - UI Setup
    private func setupUIElements() {
        // Login Başlığı
        let titleLabel = UILabel()
        titleLabel.text = "Kayıt Ol!"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 36)
        titleLabel.textColor = .white
        
        let socialMediaLabel = UILabel()
        socialMediaLabel.text = "Sosyal Medyamıza Göz Atın!"
        socialMediaLabel.font = UIFont.boldSystemFont(ofSize: 14)
        socialMediaLabel.textColor = .lightGray
        
        let socialMediaStackView = UIStackView(arrangedSubviews: [instagramButton, googleButton])
        socialMediaStackView.axis = .horizontal
        socialMediaStackView.alignment = .center
        socialMediaStackView.distribution = .equalSpacing
        socialMediaStackView.spacing = 20
        
        let elements = [emailTextField, passwordTextField, usernameTextField, registerButton, socialMediaStackView, socialMediaLabel, titleLabel, alreadyRegisterButton]

        // Döngü ile işlemleri tekrarlıyoruz
        for element in elements {
            element.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(element)
        }
        
        // Layout Ayarları
        NSLayoutConstraint.activate([
            // Başlık
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            // Email TextField
            usernameTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 60),
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            usernameTextField.heightAnchor.constraint(equalToConstant: 50),
            
            // Password TextField
            emailTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 20),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            
            // Password TextField
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            

            // Kayıt Ol Button
            registerButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 25),
            registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registerButton.widthAnchor.constraint(equalToConstant: 150),
            registerButton.heightAnchor.constraint(equalToConstant: 50),
            
            alreadyRegisterButton.topAnchor.constraint(equalTo: registerButton.bottomAnchor, constant: 25),
            alreadyRegisterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            socialMediaStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            socialMediaStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            socialMediaStackView.heightAnchor.constraint(equalToConstant: 50), // StackView yüksekliği
            
            socialMediaLabel.bottomAnchor.constraint(equalTo: socialMediaStackView.topAnchor, constant: -20),
            socialMediaLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            
            
        
            
            
        ])
    }

}
