import UIKit
import SnapKit

class CustomTabBar: UITabBar {
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.background // Beyaz arka plan
        view.layer.cornerRadius = 24
        
        // Shadow için masksToBounds false olmalı
        view.layer.masksToBounds = false
        
        // Daha yumuşak ve doğal görünen shadow ayarları
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 0) // Shadow'u her yöne eşit dağıtmak için
        view.layer.shadowRadius = 15 // Daha geniş ve yumuşak bir dağılım
        view.layer.shadowOpacity = 0.20 // Çok hafif bir opaklık
        
        // Blur effect ekleyerek daha yumuşak bir görünüm
        view.layer.shouldRasterize = true
        view.layer.rasterizationScale = UIScreen.main.scale
        
        // Shadow path ekleyerek performansı artırma
        let shadowPath = UIBezierPath(
            roundedRect: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 32, height: 60),
            cornerRadius: 24
        )
        view.layer.shadowPath = shadowPath.cgPath
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTabBar()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupTabBar()
    }
    
    private func setupTabBar() {
        backgroundColor = .clear
        backgroundImage = UIImage()
        shadowImage = UIImage()
        
        // Container view'ı ekle
        addSubview(containerView)
        
        // Constraints
        containerView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(24)
            make.right.equalToSuperview().offset(-24)
            make.bottom.equalToSuperview().offset(-32)
            make.top.equalToSuperview().offset(-6)
        }
        
        // Item pozisyonlarını ayarla
        itemPositioning = .centered
        itemWidth = 75
        
        // Seçili item için özel indicator
        selectionIndicatorImage = UIImage()
    }
    
    // Orijinal hit test metodunu override et
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let convertedPoint = containerView.convert(point, from: self)
        return containerView.bounds.contains(convertedPoint)
    }
    
    // Sadece container içindeki alanın tıklanabilir olmasını sağla
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        guard let view = super.hitTest(point, with: event) else { return nil }
        
        if self == view {
            let convertedPoint = containerView.convert(point, from: self)
            if !containerView.bounds.contains(convertedPoint) {
                return nil
            }
        }
        return view
    }
}
