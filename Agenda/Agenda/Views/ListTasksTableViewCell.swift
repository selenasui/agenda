//
//  ListTasksTableViewCell.swift
//  Agenda
//
//  Created by Binjia Chen on 7/6/18.
//  Copyright © 2018 Selena Sui. All rights reserved.
//

import Foundation
import UIKit

class ListTasksTableViewCell: UITableViewCell {
    
    @IBOutlet weak var taskTitleLabel: UILabel!
    @IBOutlet weak var taskTimestampLabel: UILabel!
    @IBOutlet weak var taskDescriptionLabel: UILabel!
    @IBOutlet weak var taskMarkAsCompleteButton: UIButton!
    
    var onButtonTapped: ((UITableViewCell) -> Void)? = nil
    
    @IBAction func onCheckBox(_ sender: Any) {
        taskMarkAsCompleteButton.isSelected = !taskMarkAsCompleteButton.isSelected
        onButtonTapped?(self)
    }
    
}

