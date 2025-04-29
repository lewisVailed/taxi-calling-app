//
//  Extension.swift
//  taxi-calling-app
//
//  Created by Ayberk Bilgiç on 4.02.2025.
//

import Foundation
import UIKit

// Your imports remain the same

extension UIViewController {
    
    func makeOpaqueNavBar() {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = Colors.background
            
            // Add shadow configuration
            appearance.shadowColor = .systemGray3
            appearance.shadowImage = UIImage()  // This ensures shadow is visible
            
            // Add these shadow layer properties
            navigationController?.navigationBar.layer.shadowColor = UIColor.black.cgColor
            navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 2)
            navigationController?.navigationBar.layer.shadowRadius = 4
            navigationController?.navigationBar.layer.shadowOpacity = 0.3
            
            appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: Colors.accent]
            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
        }
    }
}

// End of file. No additional code.
