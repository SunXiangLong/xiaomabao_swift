//
//  MBAffordablePlanetTwoCell.swift
//  xiaomabao_swift
//
//  Created by liulianqi on 16/3/30.
//  Copyright © 2016年 sunxianglong. All rights reserved.
//

import UIKit
import SwiftyJSON
class MBAffordablePlanetTwoCell: UICollectionViewCell,UICollectionViewDelegate ,UICollectionViewDataSource{

    @IBOutlet weak var collectionView: UICollectionView!
    var VC :BaseViewController!
    private  var dataArray = [JSON](count: 3, repeatedValue:0.0)
    override func awakeFromNib() {
        super.awakeFromNib()
       
      self.collectionView?.registerNib(UINib(nibName: String(MBAffordablePlanetTwoChildeCell), bundle: nil), forCellWithReuseIdentifier: String(MBAffordablePlanetTwoChildeCell))
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
        
        
    }
    func data(Array:[JSON]) {
        if Array.count != 0 {
      
         dataArray[0] = (Array[1])
         dataArray[1] = (Array[2])
         dataArray[2] = (Array[0])
        }

        self.collectionView.reloadData()
    }
   
    //MARK: - pragma mark- 代理 数据源
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
//         print(dataArray)
        return dataArray.count
       
        
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return dataArray[section].count
        
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(String(MBAffordablePlanetTwoChildeCell), forIndexPath: indexPath)as! MBAffordablePlanetTwoChildeCell
        if dataArray.count != 0 {
            if indexPath.section == 0 {
                cell.showImageView.sd_setImageWithURL(dataArray.first?.URL, placeholderImage: UIImage.init(imageLiteral: "placeholder_num3"))
            }else{
               cell.showImageView.sd_setImageWithURL(dataArray[indexPath.section][indexPath.item]["ad_img"].URL, placeholderImage: UIImage.init(imageLiteral: "placeholder_num3"))
            }
        }
       
        
        
        return cell
       
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        if section == 0 {
             return UIEdgeInsetsMake(0, 0, 0, 0);
        
        }
           return   UIEdgeInsetsMake(10, 9, 0, 9);
        
    }
    //    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
    //
    //    }
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
//        return 5
//        
//    }
        func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
            return 5
        }
    //    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
    //
    //    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        if indexPath.section==0 {
             return CGSizeMake(UISCREEN_WIDTH, UISCREEN_WIDTH*231/642);
        }else if indexPath.section==1{
            
           return CGSizeMake((UISCREEN_WIDTH-28)/3, (UISCREEN_WIDTH-28)/3*232/195);
        }
        return  CGSizeMake((UISCREEN_WIDTH-23)/2,(UISCREEN_WIDTH-23)/2*160/299);
    }
    
    

}
