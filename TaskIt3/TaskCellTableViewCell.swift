//
//  TaskCellTableViewCell.swift
//  TaskIt3
//
//  Created by delmarz on 1/18/15.
//  Copyright (c) 2015 delmarz. All rights reserved.
//

import UIKit

class TaskCellTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var subtaskLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
