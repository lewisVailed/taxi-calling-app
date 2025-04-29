//
//  DetailViewController.swift
//  taxi-calling-app
//
//  Created by Ayberk Bilgiç on 3.01.2025.
//

import UIKit
import SnapKit
import Lottie

class OpeningController: UIViewController {
    
    // MARK: - Animation Component
    private var animationView: LottieAnimationView!
    
    let createButton: UIButton = {
        let createAccountButton = UIButton()
        createAccountButton.setTitle("Create account", for: .normal)
        createAccountButton.setTitleColor(.white, for: .normal)
        createAccountButton.layer.cornerRadius = 10
        createAccountButton.layer.masksToBounds = true

        return createAccountButton
    }()
    
    let startRidingButton: UIButton = {
        let startRidingButton = UIButton()
        startRidingButton.setTitle("Start riding", for: .normal)
        startRidingButton.setTitleColor(.white, for: .normal)
        startRidingButton.layer.cornerRadius = 10
        startRidingButton.layer.masksToBounds = true
        return startRidingButton
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupAnimation()
        createButton.addTarget(self, action: #selector(didTapCreateAccount), for: .touchUpInside)
        startRidingButton.addTarget(self, action: #selector(didTapLoginAccount), for: .touchUpInside)
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Hide navigation bar for this screen
        navigationController?.isNavigationBarHidden = true
    }

    // MARK: - UI Setup
    func setupUI() {
        self.view.backgroundColor = .white
        
        let backgroundImageView = UIImageView(image: UIImage(named: "city")) // Resmi ekleyin
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.clipsToBounds = true
        backgroundImageView.alpha = 0.5
        
        let overlayView = UIView()
        overlayView.backgroundColor = .white
        overlayView.alpha = 0.5
        
        // Başlık
        let titleLabel = UILabel()
        titleLabel.text = "green ride"
        titleLabel.font = UIFont(name: "HelveticaNeue-Light", size: 64)
        titleLabel.highlightedTextColor = .black
        titleLabel.textColor = Colors.accent
        
        // Alt başlık
        let subtitleLabel = UILabel()
        subtitleLabel.text = "eco-friendly ride options at your fingertips"
        subtitleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        subtitleLabel.textColor = Colors.primary
        subtitleLabel.textAlignment = .center
        subtitleLabel.numberOfLines = 0
        
        
        let startRidingGradient = CAGradientLayer()
        startRidingGradient.colors = [Colors.accent.cgColor, Colors.primary.cgColor]
        startRidingGradient.startPoint = CGPoint(x: 0, y: 0)
        startRidingGradient.endPoint = CGPoint(x: 1, y: 1)
        startRidingGradient.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        startRidingButton.layer.insertSublayer(startRidingGradient, at: 0)
        
        
        // "Create account" butonu

        
        let createAccountGradient = CAGradientLayer()
        createAccountGradient.colors = [Colors.accent.cgColor, Colors.primary.cgColor]
        createAccountGradient.startPoint = CGPoint(x: 0, y: 0)
        createAccountGradient.endPoint = CGPoint(x: 1, y: 1)
        createAccountGradient.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        createButton.layer.insertSublayer(createAccountGradient, at: 0)
        
        view.addSubview(backgroundImageView)
        view.addSubview(overlayView)
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(startRidingButton)
        view.addSubview(createButton)
        createButton.translatesAutoresizingMaskIntoConstraints = false

        // MARK: - Snapkit
        backgroundImageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(view.frame.height)
        }

        overlayView.snp.makeConstraints { make in
            make.edges.equalTo(backgroundImageView)
        }
        

        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(100)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        

        startRidingButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(subtitleLabel.snp.bottom).offset(475)
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
        
        
        createButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(startRidingButton.snp.bottom).offset(20)
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
        
        
    }
    
    
    // MARK: - Animation
    private func setupAnimation() {
        animationView = .init(name: "flower")
        animationView.frame = CGRect(x: 0, y: 225, width: 400, height: 400)
        animationView.contentMode = .scaleAspectFit
        animationView.animationSpeed = 1
        animationView.loopMode = .loop
        
        animationView.play()
        view.addSubview(animationView)
        
    }
    
    @objc func didTapCreateAccount() {
        let vc = RegisterController()
        // Show navigation bar for the next screen if needed
        navigationController?.isNavigationBarHidden = false
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func didTapLoginAccount() {
        let vc = LoginController()
        // Show navigation bar for the next screen if needed
        navigationController?.isNavigationBarHidden = false
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
