//
//  BasicVC.swift
//  Recipe-App
//
//  Created by Mohamed Salah on 09/09/2023.
//

import UIKit

class BasicVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBaseUI()
    }
}
extension BasicVC {
    func setupBaseUI() {
        let imageView = UIImageView(image: UIImage(named: K.ImageAssets.YummyImage))
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 40)
        navigationItem.titleView = imageView
    }
}
