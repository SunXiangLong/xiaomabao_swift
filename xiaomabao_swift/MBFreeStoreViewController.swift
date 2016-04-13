//
//  MBFreeStoreViewController.swift
//  xiaomabao_swift
//
//  Created by liulianqi on 16/3/30.
//  Copyright © 2016年 sunxianglong. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class MBFreeStoreViewController: BaseViewController,UITableViewDataSource,UITableViewDelegate,CirCleViewDelegate{
    var brandAarray : [JSON] = [JSON]()
    var today_recommend_bot : [JSON] = [JSON]()
    var categoryArray : [JSON] = [JSON]()
    var recommend_goods : [JSON] = [JSON]()

    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
       setdata()
    
        
        self.navBarView?.removeFromSuperview()
       
      
        self.tableView?.registerNib(UINib(nibName: String(MBFreeStoreViewOneCell),bundle: nil), forCellReuseIdentifier: String(MBFreeStoreViewOneCell))
        self.tableView?.registerNib(UINib(nibName: String(MBFreeStoreViewTwoCell),bundle: nil), forCellReuseIdentifier: String(MBFreeStoreViewTwoCell))
        self.tableView?.registerNib(UINib(nibName: String(MBFreeStoreViewThreeCell),bundle: nil), forCellReuseIdentifier: String(MBFreeStoreViewThreeCell))
       
    }

    func setdata()  {
        //设置请求的URLRequest
        let urlStr = BASE_URL_root+"/TaxfreeStore/index"
        
        Alamofire.request(.GET, urlStr, parameters: [:])
            .responseJSON { response in
//                print(response.request)  // 请求对象
//                print(response.response) // 响应对象
//                print(response.data)     // 服务端返回的数据
                
                if let value = response.result.value {
                    let json = JSON(value)
                    
                    for (key: String, subJson: NJSON) in json {
                        switch String {
                        case "today_recommend_top":     self.brandAarray += NJSON.array!; break
                        case "today_recommend_bot":     self.today_recommend_bot += NJSON.array!;  break
                        case "category":                self.categoryArray += NJSON.array!; break
                        case "recommend_goods":         self.recommend_goods += NJSON.array!; break
                        default: break
                            
                        }
                        
                        
                    }
                    self.tableView.delegate = self;
                    self.tableView.dataSource = self;
                   self.tableView.tableHeaderView = self.setShufflingFigure()
                    print("JSON: \(json)")
                    
                }
                
                
                
        }    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setShufflingFigure() -> UIView {
        
        let circleView = CirCleView(frame: CGRectMake(0, 0, UISCREEN_WIDTH, UISCREEN_WIDTH*33/75), imageArray: urlStringArr())
        circleView.delegate = self
       

        return circleView
    }
    //获得图片URL数组
    func urlStringArr() ->[String!]
    {
        var arr = [String!]()
        
        for dic in self.brandAarray {
            arr.append(dic["ad_img"].string)
            
        }
        return arr
    }
    //MARK: - pragma mark-轮播题点击代理方法
    //MARK: - pragma mark-轮播题点击代理方法
    func clickCurrentImage(currentIndxe: Int) {
        print(currentIndxe, terminator: "");
    }
    //MARK: - pragma mark- 代理 数据源
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 2: return self.today_recommend_bot.count
        default: return 1
        }
    }
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 31
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 162
        case 1:
            return  (UISCREEN_WIDTH/4+21)*2+1
        default:
             return UISCREEN_WIDTH*33/75+10
        }
    }
 //MARK: - pragma mark- 代理UI
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = NSBundle.mainBundle().loadNibNamed(String(MBAffordablePlanetHeadView), owner: nil, options: nil).last!as!MBAffordablePlanetHeadView
        view.frame = CGRectMake(0, 0, UISCREEN_WIDTH, 20)
    
        switch section {
        case 0:    view.lable.text = "麻包推荐"
            break
        case 1:     view.lable.text = "国家馆"
                break
        default:    view.lable.text = "HIGH逛全球"
                 break
        }
        return view
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let  cell = tableView.dequeueReusableCellWithIdentifier(String(MBFreeStoreViewOneCell))as!MBFreeStoreViewOneCell
            cell.data(self.recommend_goods)
            return cell
        case 1:
            let  cell = tableView.dequeueReusableCellWithIdentifier(String(MBFreeStoreViewTwoCell))as!MBFreeStoreViewTwoCell
            cell.data(self.categoryArray)
            return cell
        default:
            let pattern = self.today_recommend_bot[indexPath.item]
            let  cell = tableView.dequeueReusableCellWithIdentifier(String(MBFreeStoreViewThreeCell))as!MBFreeStoreViewThreeCell
            cell.showImageView.sd_setImageWithURL(pattern["ad_img"].URL, placeholderImage: UIImage.init(named: "placeholder_num1"))
            return cell
        }
    }
}
