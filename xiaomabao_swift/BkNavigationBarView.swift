//
//  BkNavigationBarView.swift
//  xioamabao_swift
//
//  Created by liulianqi on 15/12/23.
//  Copyright © 2015年 sunxianglong. All rights reserved.
//

import UIKit
let NAV_BAR_HEIGHT:CGFloat = 44
let NAV_BAR_Y:CGFloat = 20
let NAV_BAR_W:CGFloat = 55
class BkNavigationBarView: UIView
{
    var title:String=""
    var leftStr:String=""
    var rightStr:String=""
    var leftImage:String=""
    var back:Bool = true
    weak var delegate:BkNavigationBarViewDelegate?
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = CGRectMake(0, 0,UISCREEN_WIDTH , ios_7 ?64:44)
        self.backgroundColor = UIColor.colorWithHexString("d66263")
    }
    
    
    func leftbutton()->UIButton{
            let leftbutton = UIButton(type:.Custom)
            leftbutton.frame = CGRectMake(10, NAV_BAR_Y, NAV_BAR_W, NAV_BAR_HEIGHT)
            leftbutton.setTitle(leftStr, forState: UIControlState.Normal)
            leftbutton.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
            leftbutton.titleLabel?.font = UIFont.systemFontOfSize(18)
           
            addSubview(leftbutton)
        
      return leftbutton
    }
    
    func titleButton()->UIButton{
        let titleButton = UIButton(type:.Custom)
        titleButton.frame = CGRectMake(NAV_BAR_W, NAV_BAR_Y, self.ml_width() - NAV_BAR_W * 2 , NAV_BAR_HEIGHT)
        titleButton.setTitle(title, forState: UIControlState.Normal)
        titleButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        
   
        
        
        
        titleButton.titleLabel?.font = UIFont.systemFontOfSize(18)
        addSubview(titleButton)
        
     return titleButton
    }
    
    func rightButton()->UIButton{
    
        let rightButton = UIButton(type:.Custom)
        rightButton.frame = CGRectMake(self.ml_width() - NAV_BAR_W, NAV_BAR_Y, NAV_BAR_W, NAV_BAR_HEIGHT)
        rightButton.setTitle(rightStr, forState: UIControlState.Normal)
        rightButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        rightButton.titleLabel?.font = UIFont.systemFontOfSize(18)
       
        addSubview(rightButton)
        
        return rightButton

    
    
    }
    func setBack(){
        
        
        if back&&leftImage==""{
        
            let button = UIButton(type: .Custom)
            button.setImage(UIImage(named: "nav_back"), forState: UIControlState.Normal)
            button.frame  = CGRectMake(0, NAV_BAR_Y, NAV_BAR_W, NAV_BAR_HEIGHT)
            button.addTarget(self, action: #selector(BkNavigationBarView.goBack(_:)), forControlEvents: UIControlEvents.TouchUpInside)
            addSubview(button)
        
        }
    
    }
    func goBack(button:UIButton){
    self.delegate?.navigationBarViewPopController(self)
    
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}

 protocol BkNavigationBarViewDelegate :NSObjectProtocol{
    
    func navigationBarViewPopController(navigationBarView:BkNavigationBarView)
    
    
    
}
