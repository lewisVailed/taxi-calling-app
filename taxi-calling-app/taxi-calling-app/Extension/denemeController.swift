import UIKit
import SceneKit

class denemeController: UIViewController {
    var sceneView: SCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1️⃣ SceneKit için bir kutu (container) oluştur
        let containerView = UIView(frame: CGRect(x: 50, y: 150, width: 300, height: 300))
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 20  // Köşeleri yuvarla
        containerView.layer.borderWidth = 2
        containerView.layer.borderColor = UIColor.gray.cgColor
        view.addSubview(containerView)
        
        // 2️⃣ SceneKit Görünümü Oluştur
        sceneView = SCNView(frame: containerView.bounds)
        sceneView.backgroundColor = .clear
        containerView.addSubview(sceneView)
        
        // 3️⃣ 3D Sahne Oluştur
        let scene = SCNScene()
        sceneView.scene = scene
        
        // 4️⃣ 3D Modeli Yükle ve Küçült
        if let modelNode = SCNScene(named: "containerfree.usdz")?.rootNode.childNodes.first {
            modelNode.position = SCNVector3(0, -0.5, -10)  // Modeli daha uzağa koy
            modelNode.scale = SCNVector3(0.1, 0.1, 0.1)    // Modeli küçült
            scene.rootNode.addChildNode(modelNode)
        }
        
        // 5️⃣ Kamerayı Daha Uzağa Al (Obje İçinde Olmamak İçin)
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(x: 0, y: 1.0, z: 15) // Kamerayı daha uzağa çektik
        scene.rootNode.addChildNode(cameraNode)
        
        // 6️⃣ Işıklandırma Ekle (Daha Net Görünüm İçin)
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light?.type = .omni
        lightNode.position = SCNVector3(x: 5, y: 5, z: 10)
        scene.rootNode.addChildNode(lightNode)
        
        // 7️⃣ Kullanıcı Etkileşimini Aktif Et
        sceneView.allowsCameraControl = true
    }
}

