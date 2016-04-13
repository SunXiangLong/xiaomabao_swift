//
//  MBBabyViewController.swift
//  xiaomabao_swift
//
//  Created by liulianqi on 16/3/29.
//  Copyright © 2016年 sunxianglong. All rights reserved.
//

import UIKit

class MBBabyViewController: BaseViewController {

    @IBOutlet weak var ssscc: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

    
       
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    @IBAction func ssss(sender: AnyObject) {
        print("1111111")
        self.ssscc.hidden = true
        
    }
    
    @IBAction func bbbb(sender: AnyObject) {
         print("222222222")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
