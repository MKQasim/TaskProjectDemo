//
//  KQHomeTableCell.swift
//  TaskProjectDemo
//
//  Created by Muhammad Qasim Muhammad Mubeen on 28/01/2022.
//

import UIKit

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
//        profileImageView.roundCorners(corners: .allCorners, radius: profileImageView.frame.width/2)
        profileImageView.contentMode = .scaleToFill
        // Configure the view for the selected state
    }
    
//    func configureCell(post:Post?){
//        titleLbl.text = post?.title
//        subTitleLbl.text = post?.byline
//        detailsLbl.text = post?.perFacet?.first?.description.components(separatedBy: ",").first
//        dateLbl.text = post?.publishedDate
//        let url = URL(string: (post?.media?.first?.mediaMetadata?.first?.url)!)!
//        self.profileImageView.load(url: url)
//    }

    
}

