
import UIKit
import SnapKit

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
    
    private let callTaxiButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = Colors.primary
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "Estimated cost \(HomeViewEntity.init(cost: 20))"
        label.font = .systemFont(ofSize: 32, weight: .bold)
        label.textColor = Colors.accent
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let tesla1Button = CustomButton(content: .logo(image: UIImage(named: "tesla-models")!), fontSize: .tesla, hasBackground: false)
    private let tesla2Button = CustomButton(content: .logo(image: UIImage(named: "tesla-cybertruck")!), fontSize: .tesla, hasBackground: false)
    private let tesla3Button = CustomButton(content: .logo(image: UIImage(named: "tesla-semitruck")!), fontSize: .tesla, hasBackground: false)
    
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
        setupCallTaxiButton()
        makeOpaqueNavBar()
        setupPriceLabel()
        self.navigationItem.title = "Home"
        
        
        
        
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
        
        view.addSubview(tesla1Button)
        view.addSubview(tesla2Button)
        view.addSubview(tesla3Button)
        
        let teslaButtons = [tesla1Button, tesla2Button, tesla3Button]
                
                // Buton stillerini for döngüsü ile ayarlayalım
                for button in teslaButtons {
                    view.addSubview(button)
                    button.layer.cornerRadius = 40
                    button.clipsToBounds = true
                    button.layer.borderWidth = 2.0
                    button.layer.borderColor = Colors.primary.cgColor
                    button.layer.shadowColor = UIColor.black.cgColor
                    button.layer.shadowOffset = CGSize(width: 0, height: 4)
                    button.layer.shadowRadius = 5
                    button.layer.shadowOpacity = 0.2
                }
                
                // Butonların konumlarını for döngüsü ile ayarlayalım
                let buttonWidth: CGFloat = 80
                let spacing: CGFloat = 30 // Butonlar arası boşluk
                let totalWidth = buttonWidth * 3 + spacing * 2 // 3 buton ve 2 boşluk
                let startX = (view.bounds.width - totalWidth) / 2 // Ekranın ortasından başlaması için
                
                for (index, button) in teslaButtons.enumerated() {
                    let xPosition = startX + CGFloat(index) * (buttonWidth + spacing)
                    
                    button.snp.makeConstraints { make in
                        make.top.equalTo(destinationTextField.snp.bottom).offset(40)
                        make.width.height.equalTo(buttonWidth)
                        make.left.equalTo(view.snp.left).offset(xPosition)
                    }
                }
    }
    
 
    
        

    
    private func setupPriceLabel() {
        // Tahmini Fiyat
        let priceLabel = UILabel()
        priceLabel.text = "Estimated price: 20$"
        priceLabel.font = UIFont.boldSystemFont(ofSize: 18)
        priceLabel.textColor = Colors.accent
        priceLabel.textAlignment = .center
        view.addSubview(priceLabel)
        
        self.view.addSubview(priceLabel)
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(destinationTextField.snp.bottom).offset(200)
            make.centerX.equalToSuperview()
        }
    }

    
    private func setupCallTaxiButton() {
        view.addSubview(callTaxiButton)
        
        let attributedString = NSMutableAttributedString(string: "Call Taxi    100-120$")
        attributedString.addAttributes([
            .font: UIFont.systemFont(ofSize: 20, weight: .semibold),
            .foregroundColor: UIColor.white
        ], range: NSRange(location: 0, length: attributedString.length))
        
        callTaxiButton.setAttributedTitle(attributedString, for: .normal)
        
        callTaxiButton.snp.makeConstraints { make in
            make.top.equalTo(destinationTextField.snp.bottom).offset(400)
            make.height.equalTo(50)
            make.trailing.equalTo(-50)
            make.leading.equalTo(50)
        }
       
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
        // Soldaki padding view
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 50))
        leftView = paddingView
        leftViewMode = .always

        // Sağdaki ok işareti için UIImageView
        let arrowImageView = UIImageView(image: UIImage(systemName: "arrow.right"))
        arrowImageView.tintColor = Colors.accent
        arrowImageView.contentMode = .center
        arrowImageView.frame = CGRect(x: 0, y: 0, width: 50, height: 50) // Ok işareti boyutları

        // Ok işareti için kapsayıcı UIView
        let rightContainerView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        rightContainerView.addSubview(arrowImageView)

        // Ok işaretini sola kaydırmak için merkezini ayarla
        arrowImageView.center = CGPoint(x: rightContainerView.frame.width - 20, y: rightContainerView.frame.height / 2)

        rightView = rightContainerView
        rightViewMode = .always

        // Gölge efektleri
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 10, height: 2)
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

