//
//  Public.swift
//  xioamabao_swift
//
//  Created by liulianqi on 15/12/24.
//  Copyright © 2015年 sunxianglong. All rights reserved.
//

import UIKit
extension  UIColor{

    class func colorWithHexString(stringToConvert:NSString)->UIColor? {
       
        let hexString = stringToConvert.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        let scanner   = NSScanner(string: hexString)
        
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        
        var hex: UInt32 = 0
        
        if scanner.scanHexInt(&hex) {
            let mask = 0x000000FF
            
            let r = Int(hex >> 16) & mask
            let g = Int(hex >> 8) & mask
            let b = Int(hex) & mask
            
            let red   = CGFloat(r) / 255
            let green = CGFloat(g) / 255
            let blue  = CGFloat(b) / 255
            
            return UIColor(red:red, green:green, blue:blue, alpha:1)
        }
        else {
            return nil
        }

      
        
        }
    
   
}
extension UIView{

    func ml_width()->CGFloat{
    
    return self.frame.size.width
    }
    
     func ml_height()->CGFloat{
        
        return self.frame.size.height
    }
    
    func ml_y()->CGFloat{
        
        return self.frame.origin.y
    }

    func ml_x()->CGFloat{
        
        return self.frame.origin.x
    }
    func ml_size()->CGSize{
        
        return self.frame.size
    }
    
    func setMl_x(x:CGFloat){
        var frame = self.frame;
        frame.origin.x = x;
        self.frame = frame;
    }
    func setMl_y(y:CGFloat) {
        var frame = self.frame;
        frame.origin.y = y;
        self.frame = frame;
    }
}
public  func getImgView(imgName:NSString)->UIImage {
    
    var image : UIImage = UIImage(named: imgName as String)!
    image = image.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal);
    
    return image
}
public let BACKColor = UIColor.colorWithHexString("ecedf1")
public let BASE_URL_root =  "http://api.xiaomabao.com";
public let BG_COLOR = UIColor.colorWithHexString("d7d7d7")
public let NavBar_Color = UIColor.colorWithHexString("d66263")
public let LINE_COLOR = UIColor.colorWithHexString("e2e2e2")
public let ios_7  = UIDevice .currentDevice().systemVersion>="7.0"
public let UISCREEN_WIDTH = UIScreen .mainScreen().bounds.size.width
public let UISCREEN_HEIGHT = UIScreen .mainScreen().bounds.size.height
public let PX_ONE = (1/UIScreen.mainScreen().scale)
public let NAV_H:CGFloat  = 44.00
public let TOP_Y:CGFloat  = (ios_7 ? 64.00 : NAV_H)