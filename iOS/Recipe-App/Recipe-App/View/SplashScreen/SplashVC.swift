//
//  SplashVC.swift
//  Recipe-App
//
//  Created by Mohamed Salah on 09/09/2023.
//

import UIKit

class SplashVC: UIViewController {
    
    @IBOutlet weak var buttonImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeImageClickaple()
    }
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
}
extension SplashVC {
    func makeImageClickaple() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(SplashVC.imageTapped(gesture:)))
        buttonImage.addGestureRecognizer(tapGesture)
        buttonImage.isUserInteractionEnabled = true
    }
    @objc func imageTapped(gesture: UIGestureRecognizer) {
        if (gesture.view as? UIImageView) != nil {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let homeVC = storyboard.instantiateViewController(withIdentifier: K.ViewsControllers.UITabBarVC)
            if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
                UIView.transition(with: sceneDelegate.window!, duration: 0.3, options: .transitionCrossDissolve, animations: {
                    sceneDelegate.window?.rootViewController = homeVC
                }, completion: nil)
                UserDefaults.standard.set(true, forKey: K.UserDefaults.hasSeenOnboarding)
            }
        }
    }
    
}
