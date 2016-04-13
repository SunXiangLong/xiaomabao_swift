//
//  MBFreeStoreViewOneCell.swift
//  xiaomabao_swift
//
//  Created by liulianqi on 16/3/30.
//  Copyright © 2016年 sunxianglong. All rights reserved.
//

import UIKit
import SwiftyJSON
class MBFreeStoreViewOneCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource {
   private  var dataArray = [JSON]()
    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .Horizontal
        flowLayout.minimumLineSpacing = 5
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.sectionInset = UIEdgeInsetsMake(7, 8, 7, 8)
        flowLayout.itemSize = CGSizeMake(114, 147)
        self.collectionView.collectionViewLayout = flowLayout
        self.collectionView.showsVerticalScrollIndicator = false
        self.collectionView.showsHorizontalScrollIndicator = false
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView?.registerNib(UINib(nibName: String(MBFreeStoreViewOnechildCell), bundle: nil), forCellWithReuseIdentifier: String(MBFreeStoreViewOnechildCell))
    }
    func data(Array:[JSON]) {
        if Array.count != 0 {
            dataArray  = Array
        }
        print(dataArray.count)
        self.collectionView.reloadData()
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
               let pattern = self.dataArray[indexPath.item]
    
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(String(MBFreeStoreViewOnechildCell), forIndexPath: indexPath)as! MBFreeStoreViewOnechildCell
        
       cell.shop_price.text  = "¥"+pattern["goods_price"].string!
       cell.shop_name.text  = pattern["goods_name"].string!
        cell.showImageView.sd_setImageWithURL(pattern["goods_thumb"].URL, placeholderImage: UIImage.init(named: "placeholder_num2"))
        return cell
        
    }
}
