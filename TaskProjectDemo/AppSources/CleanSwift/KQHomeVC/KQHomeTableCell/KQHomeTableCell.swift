//
//  KQHomeTableCell.swift
//  TaskProjectDemo
//
//  Created by Muhammad Qasim Muhammad Mubeen on 28/01/2022.
//

import UIKit
import Foundation

class KQHomeTableCell: UITableViewCell {
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var subTitleLbl: UILabel!
    @IBOutlet weak var detailsLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}

