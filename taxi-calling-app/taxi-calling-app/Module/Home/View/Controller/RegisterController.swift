import UIKit
import SnapKit

class RegisterController: UIViewController {

    // MARK: - Button Components
    let googleButton = CustomButton(content: .logo(image: UIImage(named: "instaIcon")!),
                                    fontSize: .big,
                                    hasBackground: false)
    let instagramButton = CustomButton(content: .logo(image: UIImage(named: "googleIcon")!),
                                       fontSize: .medium,
                                       hasBackground: false)
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - UI Setup
    func setupUI() {

    
        // MARK: - UI Components
        view.backgroundColor = .white
        // Üst arka plan görseli
        let backgroundImageView = UIImageView(image: UIImage(named: "doga")) // Resmi ekleyin
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.clipsToBounds = true
        backgroundImageView.alpha = 0.6 // Add transparency
        view.addSubview(backgroundImageView)
        
        // Add overlay view for additional transparency effect
        let overlayView = UIView()
        overlayView.backgroundColor = .white
        overlayView.alpha = 0.3
        view.addSubview(overlayView)
        
        // Alt beyaz alan
        let whiteContainer = UIView()
        whiteContainer.backgroundColor = .white
        whiteContainer.layer.cornerRadius = 40 // Kenarları yumuşat
        whiteContainer.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner] // Sadece üst köşeler
        whiteContainer.layer.masksToBounds = true
        view.addSubview(whiteContainer)
        
        // Başlık
        let titleLabel = UILabel()
        titleLabel.text = "request ride"
        titleLabel.font = UIFont(name: "HelveticaNeue-Light", size: 40)
        titleLabel.textColor = Colors.accent
        titleLabel.textAlignment = .center
        view.addSubview(titleLabel)
        

        // Alt başlık
        let subtitleLabel = UILabel()
        subtitleLabel.text = "book a ride, save the planet"
        subtitleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        subtitleLabel.textColor = Colors.accent
        subtitleLabel.textAlignment = .center
        view.addSubview(subtitleLabel)
        
        // Form başlığı
        let formTitleLabel = UILabel()
        formTitleLabel.text = "Create Account"
        formTitleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        formTitleLabel.textColor = .black
        whiteContainer.addSubview(formTitleLabel)
        
        // "Join" butonu
        let joinButton = UIButton()
        joinButton.setTitle("Join", for: .normal)
        joinButton.setTitleColor(.white, for: .normal)
        joinButton.layer.cornerRadius = 10
        joinButton.layer.masksToBounds = true
        whiteContainer.addSubview(joinButton)
        
        let joinButtonGradient = CAGradientLayer()
        joinButtonGradient.colors = [Colors.accent.cgColor, Colors.primary.cgColor]
        joinButtonGradient.startPoint = CGPoint(x: 0, y: 0)
        joinButtonGradient.endPoint = CGPoint(x: 1, y: 1)
        joinButtonGradient.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        joinButton.layer.insertSublayer(joinButtonGradient, at: 0)

        let socialMediaStackView = UIStackView(arrangedSubviews: [instagramButton, googleButton])
        socialMediaStackView.axis = .horizontal
        socialMediaStackView.alignment = .center
        socialMediaStackView.distribution = .equalSpacing
        socialMediaStackView.spacing = 20
        whiteContainer.addSubview(instagramButton)
        whiteContainer.addSubview(googleButton)
        
        // Form alanları
        let fields = ["Email", "Password", "Name", "Full Name", "Email Address"]
        var lastField: UIView? = nil
        
        // MARK: - Snapkit
        
        for field in fields {
            let textField = CustomTextField()
            textField.placeholder = field
            textField.backgroundColor = .systemBackground
            textField.layer.borderColor = UIColor.white.cgColor
            textField.layer.borderWidth = 1.5
            textField.layer.cornerRadius = 15
            
            textField.rightView = nil
            textField.rightViewMode = .never
            
            whiteContainer.addSubview(textField)

            textField.returnKeyType = .done
            textField.autocorrectionType = .no
            textField.autocapitalizationType = .none
            
            textField.snp.makeConstraints { make in
                make.leading.equalToSuperview().offset(20)
                make.trailing.equalToSuperview().offset(-20)
                make.height.equalTo(50)
                if let last = lastField {
                    make.top.equalTo(last.snp.bottom).offset(15)
                } else {
                    make.top.equalTo(formTitleLabel.snp.bottom).offset(20)
                }
            }

            lastField = textField
        }
        
        backgroundImageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(view.frame.height * 0.35)
        }


        overlayView.snp.makeConstraints { make in
            make.edges.equalTo(backgroundImageView)
        }


        whiteContainer.snp.makeConstraints { make in
            make.top.equalTo(backgroundImageView.snp.bottom).offset(-50)
            make.leading.trailing.bottom.equalToSuperview()
        }


        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
        }


        
        subtitleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
        }


        formTitleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(40)
        }

        
        joinButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.width.equalTo(200)
            make.centerX.equalToSuperview()
            make.top.equalTo(lastField!.snp.bottom).offset(30)
        }
        
        
        instagramButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(140)
            make.height.equalTo(50)
            make.top.equalTo(joinButton.snp.bottom).offset(30)
        }
        googleButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-140)
            make.height.equalTo(50)
            make.top.equalTo(joinButton.snp.bottom).offset(30)
        }
        
    }
    
    
}
