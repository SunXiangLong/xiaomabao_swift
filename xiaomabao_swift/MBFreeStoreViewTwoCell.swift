//
//  MBFreeStoreViewTwoCell.swift
//  xiaomabao_swift
//
//  Created by liulianqi on 16/3/30.
//  Copyright © 2016年 sunxianglong. All rights reserved.
//

import UIKit
import SwiftyJSON
class MBFreeStoreViewTwoCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource{
   private  var dataArray = [JSON]()
    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
         self.collectionView?.registerNib(UINib(nibName: String(MBAffordablePlanetTwoChildOneCell), bundle: nil), forCellWithReuseIdentifier: String(MBAffordablePlanetTwoChildOneCell))
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func data(Array:[JSON]) {
    if Array.count != 0 {
    dataArray  = Array
    }
    print(dataArray.count)
    self.collectionView.reloadData()
    }
    //MARK: - pragma mark- 代理 数据源
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        return 1
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8;
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let pattern = self.dataArray[indexPath.item]
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(String(MBAffordablePlanetTwoChildOneCell), forIndexPath: indexPath)as! MBAffordablePlanetTwoChildOneCell
        if indexPath.row==3||indexPath.row==7{
            cell.h_view.hidden = true;
        }
        if indexPath.item>3 {
            cell.w_view.hidden = true;
        }
        cell.showImageView.sd_setImageWithURL(pattern["c_img"].URL, placeholderImage: UIImage.init(named: "placeholder_num2"))
        cell.name.text = pattern["c_name"].string
        return cell
        
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsetsMake(0, 0, 0, 0);
        
        
        
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
        
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0 ;
    }
 
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
         return  CGSizeMake(UISCREEN_WIDTH/4,UISCREEN_WIDTH/4+21);
    }
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    
}
