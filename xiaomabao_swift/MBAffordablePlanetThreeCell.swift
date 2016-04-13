//
//  MBAffordablePlanetThreeCell.swift
//  xiaomabao_swift
//
//  Created by liulianqi on 16/3/30.
//  Copyright © 2016年 sunxianglong. All rights reserved.
//

import UIKit
import SwiftyJSON
class MBAffordablePlanetThreeCell: UICollectionViewCell,UICollectionViewDelegate ,UICollectionViewDataSource {
    @IBOutlet weak var collectionView: UICollectionView!
    private var dataArray:[JSON] = [JSON]()
    override func awakeFromNib() {
        super.awakeFromNib()
        self.collectionView?.registerNib(UINib(nibName: String(MBAffordablePlanetThreeChildCell), bundle: nil), forCellWithReuseIdentifier: String(MBAffordablePlanetThreeChildCell))
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
    }
    
    func data(Array:[JSON]) {
        if Array.count != 0 {
            dataArray  = Array
        }
    
        self.collectionView.reloadData()
    }

    //MARK: - pragma mark- 代理 数据源
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        return 1
        
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count;
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(String(MBAffordablePlanetThreeChildCell), forIndexPath: indexPath)as! MBAffordablePlanetThreeChildCell
        if indexPath.row==3||indexPath.row==7{
            cell.h_view.hidden = true;
        }
        if indexPath.item>3 {
            cell.w_view.hidden = true;
        }
        if dataArray.count != 0 {
            cell.showImageView.sd_setImageWithURL(dataArray[indexPath.item]["icon"].URL, placeholderImage: UIImage.init(imageLiteral: "placeholder_num2"))
            cell.shop_name.text = dataArray[indexPath.item]["cat_name"].string
        }
        return cell
        
    }
    //     override func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize{
    //    return CGSizeMake(UISCREEN_WIDTH, 20);
    //
    //    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        
            return UIEdgeInsetsMake(0, 0, 0, 0);
            
       
        
    }
    //    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
    //
    //    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
        
    }
        func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
            return 0 ;
        }
    //    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
    //
    //    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
         return  CGSizeMake((UISCREEN_WIDTH-18)/4,(UISCREEN_WIDTH-18)/4+21);
    }


}
