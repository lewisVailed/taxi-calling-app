//
//  CustomButton.swift
//  taxi-calling-app
//
//  Created by Ayberk Bilgiç on 17.11.2024.
//

import UIKit

class CustomButton: UIButton {

    enum FontSize {
        case big
        case medium
        case small
    }
    
    // Butonun içeriğini belirlemek için bir enum
    enum ButtonContentType {
        case logo(image: UIImage)
        case text(title: String)
    }


        // İlk initializer: Logo için
    init(content: ButtonContentType, fontSize: FontSize, hasBackground: Bool) {
        super.init(frame: .zero) // UIButton'un temel init metodu
            
        self.backgroundColor = hasBackground ? .red: .clear
        self.setTitleColor(hasBackground ? .white: .lightGray, for: .normal)
        self.layer.cornerRadius = 20
            
        switch fontSize {
        case .big:
            self.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        case .medium:
            self.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        case .small:
            self.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        }
            
        setupContent(content: content)
    }
        
        // Zorunlu initializer (Storyboard için)
        required init?(coder: NSCoder) {
            
            
            super.init(coder: coder)
        }
        
        // İçeriğe göre butonu yapılandıran özel bir metod
        private func setupContent(content: ButtonContentType) {
            switch content {
            case .logo(let image):
                self.setImage(image, for: .normal)
                self.imageView?.contentMode = .scaleAspectFit
                self.setTitle(nil, for: .normal) // Metni kaldır
                self.widthAnchor.constraint(equalToConstant: 50).isActive = true
                self.heightAnchor.constraint(equalToConstant: 50).isActive = true
            case .text(let title):
                self.setTitle(title, for: .normal)
                self.setImage(nil, for: .normal) // Görseli kaldır
            }
        }
        
        

}

        
      
