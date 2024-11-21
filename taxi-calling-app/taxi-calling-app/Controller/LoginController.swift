//
//  ViewController.swift
//  taxi-calling-app
//
//  Created by Ayberk Bilgiç on 17.11.2024.
//

import UIKit

class LoginController: UIViewController {
    
    // MARK: - UI Components
    let emailTextField = CustomTextField(fieldType: .email)
    let passwordTextField = CustomTextField(fieldType: .password)
    
    let loginButton = CustomButton(content: .text(title: "Giriş Yap"), fontSize: .medium, hasBackground: true)
    let registerButton = CustomButton(content: .text(title: "Kayıt Ol"), fontSize: .medium, hasBackground: true)
    let forgotPasswordButton = CustomButton(content: .text(title: "Şifreni mi unuttun"), fontSize: .small, hasBackground: false)
    
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
            redBackgroundView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7)
        ])
    }
    
    
    
    // MARK: - UI Setup
    private func setupUIElements() {
        // Login Başlığı
        let titleLabel = UILabel()
        titleLabel.text = "Giriş Yap!"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 36)
        titleLabel.textColor = .white
        
        // Hoşgeldiniz Yazısı
        let welcomeLabel = UILabel()
        welcomeLabel.text = "Hoşgeldiniz Taksi07"
        welcomeLabel.font = UIFont.systemFont(ofSize: 18)
        welcomeLabel.textColor = .white
        
        let socialMediaLabel = UILabel()
        socialMediaLabel.text = "Sosyal Medyamıza Göz Atın!"
        socialMediaLabel.font = UIFont.boldSystemFont(ofSize: 14)
        socialMediaLabel.textColor = .lightGray
        
        let socialMediaStackView = UIStackView(arrangedSubviews: [instagramButton, googleButton])
        socialMediaStackView.axis = .horizontal
        socialMediaStackView.alignment = .center
        socialMediaStackView.distribution = .equalSpacing
        socialMediaStackView.spacing = 20
        
        let elements = [emailTextField, passwordTextField, forgotPasswordButton, loginButton, registerButton, socialMediaStackView, welcomeLabel, socialMediaLabel, titleLabel]

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
            
            // Hoşgeldiniz
            welcomeLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            welcomeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            // Email TextField
            emailTextField.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 100),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            
            // Password TextField
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            // Şifreni mi unuttum?
            forgotPasswordButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30),
            forgotPasswordButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            // Giriş Yap Button
            loginButton.topAnchor.constraint(equalTo: forgotPasswordButton.bottomAnchor, constant: 25),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            loginButton.widthAnchor.constraint(equalToConstant: 150),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            
            // Kayıt Ol Button
            registerButton.topAnchor.constraint(equalTo: forgotPasswordButton.bottomAnchor, constant: 25),
            registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            registerButton.widthAnchor.constraint(equalToConstant: 150),
            registerButton.heightAnchor.constraint(equalToConstant: 50),
            
            socialMediaStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            socialMediaStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            socialMediaStackView.heightAnchor.constraint(equalToConstant: 50), // StackView yüksekliği
            
            socialMediaLabel.bottomAnchor.constraint(equalTo: socialMediaStackView.topAnchor, constant: -20),
            socialMediaLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            
            
        
            
            
        ])
    }
}
