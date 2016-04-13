//
//  BaseViewController.swift
//  xioamabao_swift
//
//  Created by liulianqi on 15/12/23.
//  Copyright © 2015年 sunxianglong. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController,BkNavigationBarViewDelegate{
    
    var navBarView:BkNavigationBarView?
    var lefuBut:UIButton?
    var rigBut:UIButton?
//    let Manager = AFHTTPSessionManager.init()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = BACKColor
        self.navigationController?.navigationBar.removeFromSuperview()
        navBarView = navBar()
        self.view .addSubview(navBarView!)
    }
    
    func navBar()->BkNavigationBarView {
        let navBar = BkNavigationBarView()
        navBarView = navBar
        navBar.delegate = self
        navBar.rightStr = rightStr()
        navBar.title = titleStr()
        navBar.leftStr = leftStr()
        navBar.leftImage = leftImage()
        let lefuButton = navBar.leftbutton()
        let titleButton = navBar.titleButton()
        let rightButton = navBar.rightButton()
        lefuBut = lefuButton
        rigBut = rightButton
        navBar.setBack()
        lefuButton.addTarget(self, action: #selector(BaseViewController.leftTitleClick), forControlEvents: UIControlEvents.TouchUpInside)
        
        titleButton.addTarget(self, action: #selector(BaseViewController.titleClick), forControlEvents: UIControlEvents.TouchUpInside)
        
        rightButton.addTarget(self, action: #selector(BaseViewController.rightTitleClick), forControlEvents: UIControlEvents.TouchUpInside)
        if leftImage()==""{}else{
            lefuButton.setImage(UIImage(named: leftImage()), forState: UIControlState.Normal)
            
        }
        
        if titleImage()==""{}else{
            titleButton.setImage(UIImage(named: titleImage()), forState: UIControlState.Normal)
            
        }
        
        if rightImage()==""{}else{
            rightButton.setImage(UIImage(named: rightImage()), forState: UIControlState.Normal)
            
        }
        return navBar
    }
    
    func leftTitleClick(){
        
        
    }
    
    func titleClick(){
        
        
    }
    
    
    func rightTitleClick(){
        
        
    }
    
    
    func rightImage()->String{
        
        return ""
        
    }
    
    
    func titleImage()->String{
        
        return ""
        
    }
    
    
    func leftImage()->String{
        
        return ""
        
    }
    
    func rightStr()->String{
        
        return ""
        
    }
    
    func leftStr()->String{
        
        return ""
        
    }
    
    func titleStr()->String{
        
        return ""
        
        
    }
    func addBottomLineView(addLineView:UIView)->UIView{
        let lineView = UIView()
        lineView.tag = 1111111
        lineView.frame = CGRectMake(0, addLineView.ml_height()-PX_ONE, addLineView.ml_width(), PX_ONE)
        lineView.backgroundColor = UIColor.colorWithHexString("d7d7d7")
        addLineView.addSubview(lineView)
        return lineView
        
    }
    func addTopLineView(addLineView:UIView)->UIView{
        let lineView = UIView()
        lineView.tag = 1111111
        lineView.frame = CGRectMake(0, PX_ONE, addLineView.ml_width(), PX_ONE)
        lineView.backgroundColor = UIColor.colorWithHexString("d7d7d7")
        addLineView.addSubview(lineView)
        return lineView
        
    }
    func navigationBarViewPopController(navigationBarView: BkNavigationBarView) {
        
        
        self.navigationController?.popViewControllerAnimated(true)
        
    }
    //MARK:设置navbar的颜色
    func setNavBarViewBackgroundColor(color:UIColor){
        navBarView?.backgroundColor = color
    }
    //MARK:pus到下一个界面 若当前界面有tabbar则调用这个pus方法
    func pushViewController(viewController:UIViewController,animated:Bool){
        self.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(viewController, animated: animated)
        self.hidesBottomBarWhenPushed = false
        
    }
    //MARK:pus到下一个界面 若当前界面无tabbar则调用这个pus方法
    func pushViewControllerNoTabbar(viewController:UIViewController,animated:Bool){
        self.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(viewController, animated: animated)
      
        
    }
    func popViewControllerAnimated(animated:Bool)->UIViewController{
        
        return (self.navigationController?.popViewControllerAnimated(animated))!
    }
    
//    private func showLoadingHUD() {
//        let hud = MBProgressHUD.showHUDAddedTo(view, animated: true)
//        
//        hud.labelText = "Loading..."
//    }
//    
//    private func hideLoadingHUD() {
//        MBProgressHUD.hideAllHUDsForView(view, animated: true)
//    }
}
