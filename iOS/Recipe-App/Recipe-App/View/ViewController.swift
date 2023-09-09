//
//  ViewController.swift
//  Recipe-App
//
//  Created by Mohamed Salah on 09/09/2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
        // Do any additional setup after loading the view.
    }
//    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
//          return .portrait
//      }

    @IBAction func goToSplashScreen(_ sender: UIButton) {
        let splashController = SplashVC()
        splashController.modalPresentationStyle = .overCurrentContext
        present(splashController, animated: true, completion: nil)
    }
}

