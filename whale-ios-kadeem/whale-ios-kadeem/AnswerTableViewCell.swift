//
//  AnswerTableViewCell.swift
//  whale-ios-kadeem
//
//  Created by Kadeem Palacios on 4/10/17.
//  Copyright © 2017 Kadeem Palacios. All rights reserved.
//

import UIKit
import AVFoundation

class AnswerTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()

    }
    


    @IBOutlet weak var answerTextLabel: UILabel!
    @IBOutlet weak var thumbnailButton: UIButton!
    


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
