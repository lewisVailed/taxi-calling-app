
import UIKit

class HomeController: UIViewController {
   
    
    
    // MARK: - UI Elements
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Find Your Close Taxi"
        label.font = .systemFont(ofSize: 32, weight: .bold)
        label.textColor = Colors.accent
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let locationTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.placeholder = "Enter your location"
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let destinationTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.placeholder = "Enter destination or ride type"
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let transportStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 40
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let callTaxiButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = Colors.primary
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        view.backgroundColor = Colors.background
        
        setupTitleLabel()
        setupTextFields()
        setupTransportIcons()
        setupCallTaxiButton()
    }
    
    private func setupTitleLabel() {
        view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    private func setupTextFields() {
        view.addSubview(locationTextField)
        view.addSubview(destinationTextField)
        
        NSLayoutConstraint.activate([
            locationTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            locationTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            locationTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            locationTextField.heightAnchor.constraint(equalToConstant: 50),
            
            destinationTextField.topAnchor.constraint(equalTo: locationTextField.bottomAnchor, constant: 16),
            destinationTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            destinationTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            destinationTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setupTransportIcons() {
        view.addSubview(transportStackView)
        
        let icons = ["car.fill", "bus.fill", "tram.fill"]
        icons.forEach { iconName in
            let iconView = TransportIconView(iconName: iconName)
            transportStackView.addArrangedSubview(iconView)
        }
        
        NSLayoutConstraint.activate([
            transportStackView.topAnchor.constraint(equalTo: destinationTextField.bottomAnchor, constant: 30),
            transportStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            transportStackView.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
    
    private func setupCallTaxiButton() {
        view.addSubview(callTaxiButton)
        
        let attributedString = NSMutableAttributedString(string: "Call Taxi    100-120$")
        attributedString.addAttributes([
            .font: UIFont.systemFont(ofSize: 20, weight: .semibold),
            .foregroundColor: UIColor.white
        ], range: NSRange(location: 0, length: attributedString.length))
        
        callTaxiButton.setAttributedTitle(attributedString, for: .normal)
        
        NSLayoutConstraint.activate([
            callTaxiButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            callTaxiButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            callTaxiButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            callTaxiButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

// MARK: - Custom Views
class CustomTextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTextField()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupTextField()
    }
    
    private func setupTextField() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 50))
        leftView = paddingView
        leftViewMode = .always
        
        let arrowImageView = UIImageView(image: UIImage(systemName: "arrow.right"))
        arrowImageView.tintColor = Colors.accent
        arrowImageView.contentMode = .center
        arrowImageView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        
        rightView = arrowImageView
        rightViewMode = .always
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.1
    }
}

class TransportIconView: UIView {
    init(iconName: String) {
        super.init(frame: .zero)
        setupIcon(named: iconName)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupIcon(named iconName: String) {
        backgroundColor = Colors.secondary
        layer.cornerRadius = 35
        
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: iconName)
        imageView.tintColor = Colors.accent
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(imageView)
        
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: 70),
            heightAnchor.constraint(equalToConstant: 70),
            
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 30),
            imageView.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}

