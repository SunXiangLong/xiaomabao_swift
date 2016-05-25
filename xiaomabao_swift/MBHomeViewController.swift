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
        
        let arr = twoSum([1,2,3,4,5,5,5], 7)
        print(arr);
        let sss = twoSums([1,2,3,4,5,5,5], 7)
        print(sss)
 
        let ddd = reverseWords("eulb si yks eht")
        print(ddd)
        
    }
    /**
     给定一个整型数组中有且仅有两个数字之和等于目标值，求两个数字在数组中的序号 时间复杂度 O(n)
     */
    func twoSum(nums: [Int], _ target: Int) -> [Int] {
        var res = [Int]()
        var dict = [Int: Int]()
        
        for i in 0 ..< nums.count {
            guard let lastIndex = dict[target - nums[i]] else {
                dict[nums[i]] = i
                continue
            }
            
            res.append(lastIndex)
            res.append(i)
            break
        }
        
        return res
    }
    /**
     给一个整型数组和一个目标值，判断数组中是否有两个数字之和等于目标值  时间复杂度 O(n)
     */
    func twoSums(nums: [Int], _ target: Int) -> Bool {
        var set = Set<Int>()
        
        for num in nums {
            if set.contains(target - num) {
                return true
            }
            
            set.insert(num)
        }
        
        return false
    }
    /**
     字符串 根据单词反转
     
    每个单词作为一个字符串单独翻转，"eulb si yks eht" -> "blue is sky the"
     */
    func reverseWords(s:String) -> String {
       var char  =  [Character](s.characters)
        var start = 0
        
        _reverse(&char, 0, char.count-1)
        for i in 0 ..< char.count {
            if i == char.count-1||char[i+1] == " " {
                _reverse(&char, start, i)
                start = i+2;
            }
        }
     return String(char)
    }
    /**
     字符串反转
    */
    private  func _reverse(inout chars:[Character],_ start:Int,_ end:Int){
        var start = start
        var end = end
        while start<end {
            _swap(&chars, start, end);
            start += 1
             end -= 1
        }
    }
    
    /**
     首尾互换
     */
    private func _swap(inout chars:[Character],_ p:Int,_ q:Int){
    
        let temp  = chars[p]
        chars[p] = chars[q];
        chars[q] = temp
    }
    func setupChildVcs() {
        
    
        let vc = MBTopCargoController()
        vc.title = "尖儿货"
        self.addChildViewController(vc)
        
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
//        let willShowChildVc = self.childViewControllers[1];
//        willShowChildVc.view.frame  = scrollView.bounds;
//        willShowChildVc.view.setMl_x(UISCREEN_WIDTH)
//        scrollView.addSubview(willShowChildVc.view)
        
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
