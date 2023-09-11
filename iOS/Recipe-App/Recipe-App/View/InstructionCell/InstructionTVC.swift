//
//  InstructionTVC.swift
//  Recipe-App
//
//  Created by Mohamed Salah on 10/09/2023.
//

import UIKit

class InstructionTVC: UITableViewCell {

    @IBOutlet weak var currentStepLabel: UILabel!
    @IBOutlet weak var instructionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
