//
//  MBAffordablePlanetThreeChildCell.swift
//  xiaomabao_swift
//
//  Created by liulianqi on 16/3/30.
//  Copyright © 2016年 sunxianglong. All rights reserved.
//

import UIKit

class MBAffordablePlanetThreeChildCell: UICollectionViewCell {

    @IBOutlet weak var w_view: UIView!
    @IBOutlet weak var h_view: UIView!
    @IBOutlet weak var shop_name: UILabel!
    @IBOutlet weak var showImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.showImageView .contentMode = .ScaleAspectFill
        self.showImageView .autoresizingMask = .FlexibleHeight
        self.showImageView .clipsToBounds = true
    }

}
