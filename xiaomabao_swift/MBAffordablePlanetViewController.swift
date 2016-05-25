//
//  MBAffordablePlanetViewController.swift
//  xiaomabao_swift
//
//  Created by liulianqi on 16/3/30.
//  Copyright © 2016年 sunxianglong. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class MBAffordablePlanetViewController: BaseViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,CirCleViewDelegate {
    var data : [JSON] = [JSON]()
    var category:[JSON] = [JSON]()
    var today_recommend:[JSON] = [JSON]()
    var bandImageArray:[JSON] = [JSON]()
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
         self.automaticallyAdjustsScrollViewInsets = false
        self.navBarView?.removeFromSuperview()
        setCollectionView()
        setdata()
        
      

        
        
        
    }
    
    func setCollectionView() {
        
     
        self.collectionView?.registerNib(UINib(nibName: String(MBAffordablePlanetOneCell), bundle: nil), forCellWithReuseIdentifier: String(MBAffordablePlanetOneCell))
        self.collectionView?.registerNib(UINib(nibName: String(MBAffordablePlanetTwoCell), bundle: nil), forCellWithReuseIdentifier: String(MBAffordablePlanetTwoCell))
        self.collectionView?.registerNib(UINib(nibName: String(MBAffordablePlanetThreeCell), bundle: nil), forCellWithReuseIdentifier: String(MBAffordablePlanetThreeCell))
        self.collectionView.registerClass(UICollectionReusableView.classForCoder(), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "HeaderView1")
        self.collectionView.registerClass(UICollectionReusableView.classForCoder(), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "HeaderView2")
    }
    //获得图片URL数组
    func urlStringArr() ->[String!]
    {
        var arr = [String!]()
        

        for dic in self.bandImageArray {
            arr.append(dic["ad_img"].string)

        }
        print(arr.count)
        return arr
        
    }
    func setdata()  {
        let urlStr = BASE_URL_root+"/AffordablePlanet/index"
        Alamofire.request(.GET, urlStr).validate().responseJSON { response in
            switch response.result {
            case .Success:
                if let value = response.result.value {
                    
                    let json = JSON(value)
//                  print("JSON: \(json)")
                    for (key: String, subJson: NJSON) in json {
                        switch String {
                        case "today_recommend_top":  self.bandImageArray += NJSON.array!; break
                        case "today_recommend_mid":  self.today_recommend.append(NJSON);  break
                        case "today_recommend_bot":  self.today_recommend.append(NJSON);  break
                        case "group_buy_img":         self.today_recommend.append(NJSON); break
                        case "recommend_goods":self.data += NJSON.array!;   break
                        case "category":  self.category += NJSON.array!;    break
                        default: break
                            
                        }
                        
                        
                    }
                    self.collectionView.delegate = self
                    self.collectionView.dataSource = self

                }
            case .Failure(let error):
                print(error)
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    //MARK: - pragma mark-轮播题点击代理方法
    func clickCurrentImage(currentIndxe: Int) {
        print(currentIndxe, terminator: "");
    }
    
   
    //MARK: - pragma mark- 代理 数据源
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        return 3
        
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section==2 {
            return   self.data.count
        }
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        switch kind{
        case        UICollectionElementKindSectionHeader:
            if indexPath.section==0 {
                let header:UICollectionReusableView=collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "HeaderView1", forIndexPath: indexPath)
             
                
                let circleView = CirCleView(frame: CGRectMake(0, 0, UISCREEN_WIDTH, UISCREEN_WIDTH*33/75), imageArray: urlStringArr())
                circleView.delegate = self
                header.addSubview(circleView)

                let view = NSBundle.mainBundle().loadNibNamed(String(MBAffordablePlanetHeadView), owner: nil, options: nil).last!as!MBAffordablePlanetHeadView
                view.frame = CGRectMake(0, UISCREEN_WIDTH*33/75, UISCREEN_WIDTH, 31)
                view.lable.text = "每日必看"
                header.addSubview(view)
                return header
            }else {
                
                let header:UICollectionReusableView=collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "HeaderView2", forIndexPath: indexPath)
                
                let view = NSBundle.mainBundle().loadNibNamed(String(MBAffordablePlanetHeadView), owner: nil, options: nil).last!as!MBAffordablePlanetHeadView
                view.frame = CGRectMake(0, 0, UISCREEN_WIDTH, 31)
                if indexPath.section==1 {
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
        
        if indexPath.section==0 {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(String(MBAffordablePlanetTwoCell), forIndexPath: indexPath)as! MBAffordablePlanetTwoCell
            cell.data(self.today_recommend)
            
            return cell
        }else if indexPath.section==1{
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(String(MBAffordablePlanetThreeCell), forIndexPath: indexPath)as! MBAffordablePlanetThreeCell
            cell.data(self.category)
            return cell
            
            
        }
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(String(MBAffordablePlanetOneCell), forIndexPath: indexPath)as! MBAffordablePlanetOneCell
        let pattern = data[indexPath.item]
        cell.showImageView.animationType = "SlideInLeft";
        cell.showImageView.delay = 0.3
        cell.showImageView.damping = 0.5
        cell.showImageView.velocity = 2
        cell.showImageView.force = 1
        cell.showImageView.animate()
        cell.shop_name.text  = pattern["goods_name"].string
        cell.shop_price.text = "¥ " + pattern["goods_price"].string!
        cell.showImageView.sd_setImageWithURL(pattern["goods_thumb"].URL, placeholderImage: UIImage.init(imageLiteral: "placeholder_num2"))
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        if section==2 {
            return   UIEdgeInsetsMake(10, 9, 10, 9);
        }
        return UIEdgeInsetsMake(0, 0, 0, 0);
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        if section==2 {
            return 9
        }
        return 0
        
    }
    //    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
    //
    //    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSizeMake(UISCREEN_WIDTH, UISCREEN_WIDTH*33/75+20);
        }
        return CGSizeMake(UISCREEN_WIDTH, 31);
        
    }
    //    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
    //
    //    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        if indexPath.section==0 {
            return CGSizeMake(UISCREEN_WIDTH, 40+(UISCREEN_WIDTH-28)/3*232/195+(UISCREEN_WIDTH-23)/2*160/299*2+UISCREEN_WIDTH*231/642);
        }else if indexPath.section==1{
            
            return  CGSizeMake(UISCREEN_WIDTH , ((UISCREEN_WIDTH-18)/4+21)*2);
        }
        return  CGSizeMake((UISCREEN_WIDTH-28)/2,(UISCREEN_WIDTH-47)/2+62);
    }
    
    
    
}
