//
//  CellPostTableViewCell.swift
//  demo-mobile
//
//  Created by k on 30/12/2019.
//  Copyright © 2019 k. All rights reserved.
//

import UIKit

class CellPost: UITableViewCell {
    @IBOutlet var iv_avatar: UIImageView!
    @IBOutlet var lbl_n: UILabel!
    @IBOutlet var lbl_t: UILabel!
    @IBOutlet var lbl_c: UILabel!
    @IBOutlet var iv_main: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.iv_avatar.frame.size = CGSize(width:70,height:70)
        self.iv_avatar.layer.cornerRadius = self.iv_avatar.frame.size.width / 2.0
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
