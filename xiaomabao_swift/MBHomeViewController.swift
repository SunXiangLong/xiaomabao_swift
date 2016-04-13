//
//  MBHomeViewController.swift
//  xiaomabao_swift
//
//  Created by liulianqi on 16/3/29.
//  Copyright © 2016年 sunxianglong. All rights reserved.
//

import UIKit
import SDWebImage
class MBHomeViewController: BaseViewController,UIScrollViewDelegate {
    var titlesView:UIView?
    var  scrollView:UIScrollView?
    var titleButtons:NSMutableArray?
    var lastButton:UIButton?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        titleButtons = NSMutableArray()
        setupChildVcs()
        setupTitlesView()
        setupScrollView()
        
    }
    
    func setupChildVcs() {
        let vc1 = MBAffordablePlanetViewController()
        vc1.title = "实惠星球"
        self.addChildViewController(vc1)
        let vc2 = MBFreeStoreViewController()
        vc2.title = "免税店"
        self.addChildViewController(vc2)
    }
    
    func setupTitlesView()   {
        let titlesView = UIView()
        titlesView.frame = CGRectMake(0,TOP_Y, UISCREEN_WIDTH, UISCREEN_HEIGHT)
        self.view.addSubview(titlesView)
        self.titlesView = titlesView
        let count = self.childViewControllers.count
        
        let titleButtonH:CGFloat = 30
        let titleButtonW:CGFloat =  (UISCREEN_WIDTH-1)/CGFloat(count)
        for  i in 0..<count {
            let titleButton = UIButton()
            titleButton.addTarget(self, action: #selector(self.titleClick(_:)), forControlEvents:.TouchUpInside)
            titleButton.backgroundColor      = NavBar_Color;
            titleButton.setTitle(self.childViewControllers[i].title, forState: .Normal)
            titleButton.titleLabel?.font     = UIFont.init(name: "MFTongXin_Noncommercial-Regular", size: 12)
            titleButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            titleButton.frame                = CGRectMake(CGFloat(i)*(titleButtonW+1)+1, 1, titleButtonW, titleButtonH)
            self.titleButtons!.addObject(titleButton)
            if i==0 {
            self.lastButton                  = titleButton;
            self.lastButton!.backgroundColor = UIColor.colorWithHexString("dd9682")
            }
            titlesView.addSubview(titleButton)
        }
        
        
        
    }
    func titleClick(titleButton:UIButton) {
        
        if ((self.lastButton?.isEqual(titleButton)) != nil) {
            self.lastButton?.backgroundColor = NavBar_Color
            self.lastButton                  = titleButton
            self.lastButton?.backgroundColor = UIColor.colorWithHexString("dd9682")
            var offset                       = self.scrollView?.contentOffset
            offset?.x                        = UISCREEN_WIDTH*CGFloat( (self.titleButtons?.indexOfObject(titleButton))!)
            self.scrollView?.setContentOffset(offset!, animated: true)
        }
    }
    func setupScrollView() {
  
        
        let scrollView = UIScrollView.init(frame: CGRectMake(0, 31+TOP_Y, UISCREEN_WIDTH, UISCREEN_HEIGHT-31-49-TOP_Y))
       scrollView.delegate = self
        scrollView.pagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.contentSize = CGSizeMake(CGFloat(self.childViewControllers.count)*UISCREEN_WIDTH, 0)
        self.view .addSubview(scrollView)
        self.scrollView = scrollView
        let willShowChildVc = self.childViewControllers[1];
        willShowChildVc.view.frame  = scrollView.bounds;
        willShowChildVc.view.setMl_x(UISCREEN_WIDTH)
        scrollView.addSubview(willShowChildVc.view)
        
        self.scrollViewDidEndScrollingAnimation(scrollView)
        
    }
    
    override func titleStr() -> String {
        return "小麻包"
    }
    override func rightImage() -> String {
        return "search_image"
    }
    override func rightTitleClick() {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func scrollViewDidEndScrollingAnimation(scrollView: UIScrollView) {
        // 取出对应的子控制器
        let number = NSInteger(scrollView.contentOffset.x / scrollView.ml_width());
        let willShowChildVc = self.childViewControllers[number];
        // 如果控制器的view已经被创建过，就直接返回
        if willShowChildVc.isViewLoaded(){
         return;
        }
        
        // 添加子控制器的view到scrollView身上
       
        willShowChildVc.view.frame = scrollView.bounds;
        scrollView.addSubview(willShowChildVc.view);
    }
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        self.scrollViewDidEndScrollingAnimation(scrollView);
        
        // 点击按钮
       let number = NSInteger(scrollView.contentOffset.x / scrollView.ml_width());
        self.titleClick(self.titleButtons![number] as! UIButton);
    }
   }
