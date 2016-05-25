//
//  MBTopCargoController.swift
//  xiaomabao_swift
//
//  Created by liulianqi on 16/4/20.
//  Copyright © 2016年 sunxianglong. All rights reserved.
//

import UIKit

class MBTopCargoController: BaseViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,CirCleViewDelegate  {

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
         setCollectionView()
        
    }
    func setCollectionView() {
        
          self.navBarView?.removeFromSuperview()
        
        self.collectionView?.registerNib(UINib(nibName: String(MBTopCargoCell), bundle: nil), forCellWithReuseIdentifier: String(MBTopCargoCell))
        
        self.collectionView.registerClass(UICollectionReusableView.classForCoder(), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "HeaderView1")
        self.collectionView.registerClass(UICollectionReusableView.classForCoder(), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "HeaderView2")
        self.collectionView.registerClass(UICollectionReusableView.classForCoder(), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "HeaderView3")
    }
    
    //获得图片URL数组
    func urlStringArr() ->[String!]
    {
        var arr = [String!]()
        
        
        for _ in 0..<3 {
            arr.append("")
            
        }
        print(arr.count)
        return arr
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - pragma mark-轮播题点击代理方法
    func clickCurrentImage(currentIndxe: Int) {
        print(currentIndxe, terminator: "");
    }
    
    //MARK: - pragma mark- 代理 数据源
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        return 4
        
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (section == 0) {
            return 5;
        }else if(section == 1){
            return 1;
        }else if(section == 2){
            
            return 4;
            
        }
            return 8;
    }
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        switch kind{
        case        UICollectionElementKindSectionHeader:
            if indexPath.section==0 {
                let header:UICollectionReusableView=collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "HeaderView1", forIndexPath: indexPath)
                
                let circleView = CirCleView(frame: CGRectMake(0, 0, UISCREEN_WIDTH, UISCREEN_WIDTH*33/75), imageArray: urlStringArr())
                circleView.delegate = self
                header.addSubview(circleView)
                

                return header
            }else if(indexPath.section==1) {
                let header:UICollectionReusableView=collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "HeaderView2", forIndexPath: indexPath)
                
                let view = NSBundle.mainBundle().loadNibNamed(String(MBAffordablePlanetHeadView), owner: nil, options: nil).last!as!MBAffordablePlanetHeadView
                view.frame = CGRectMake(0, 0, UISCREEN_WIDTH, 31)
                view.lable.text = "每日必看"
                header.addSubview(view)
                return header
                
                
                
            }else{
                let header:UICollectionReusableView=collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "HeaderView3", forIndexPath: indexPath)
                
                let view = NSBundle.mainBundle().loadNibNamed(String(MBAffordablePlanetHeadView), owner: nil, options: nil).last!as!MBAffordablePlanetHeadView
                view.frame = CGRectMake(0, 0, UISCREEN_WIDTH, 31)
                if indexPath.section==2 {
                    view.lable.text = "全部分类"
                }else{
                    view.lable.text = "推荐单品"
                }
                header.addSubview(view)
                return header
            }
            
            
            
            
            
            
        default:
            return UICollectionReusableView()
        }
        
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(String(MBTopCargoCell), forIndexPath: indexPath)as! MBTopCargoCell
        cell.backgroundColor = UIColor(red: CGFloat(arc4random_uniform(255)) / 255.0, green: CGFloat(arc4random_uniform(255)) / 255.0, blue: CGFloat(arc4random_uniform(255)) / 255.0, alpha: 1.0)
        
     
        
        
        return cell

        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        if (section == 0) {
            
            return   UIEdgeInsetsMake(0, 0, 10, 0)
            
        }else if(section == 1){
            
            return   UIEdgeInsetsMake(0, 0, 0, 0)
            
        }
        
        return   UIEdgeInsetsMake(8, 8, 8, 8)

        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        switch (section) {
        case 0:   return 0
        case 1:   return 16
        case 2:   return 8
        default:  return 8
        }

        
    }
        func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
            switch (section) {
            case 0:  return   1
            case 1:  return  25
            case 2:  return   8
            default: return  12
            }
        }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if (section == 0) {
            return CGSizeMake(UISCREEN_WIDTH, UISCREEN_WIDTH*33/75)
        }
        return CGSizeMake(UISCREEN_WIDTH, 31)
        
    }
//        func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
//            
//    
//        }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        if (indexPath.section==0) {
            
            return CGSizeMake((UISCREEN_WIDTH-4)/5, (UISCREEN_WIDTH-4)/5*14/19+30);
            
        }else if (indexPath.section==1) {
            
            return CGSizeMake(UISCREEN_WIDTH, (UISCREEN_WIDTH-16-25)/2*54/43 + 16);
            
        }else if(indexPath.section==2){
            
            if (indexPath.row==0) {
                return CGSizeMake((UISCREEN_WIDTH-16), (UISCREEN_WIDTH-16)*430/916);
            }
            
            return CGSizeMake((UISCREEN_WIDTH-32)/3,(UISCREEN_WIDTH-32)/3);
        }else {
            return  CGSizeMake((UISCREEN_WIDTH-16-12)/2,(UISCREEN_WIDTH-16-12)/2);
        }
    
   
    }
}
