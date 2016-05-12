//
//  badminton.swift
//  Match score
//
//  Created by Mr.Zhao on 16/5/12.
//  Copyright © 2016年 Mr.Zhao. All rights reserved.
//

import UIKit

class badminton: UIViewController {

    
    @IBOutlet weak var badminton: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        badminton.loadRequest(NSURLRequest(URL:NSURL(string:"http://jingyan.baidu.com/article/fdbd427732b19db89e3f48a0.html")!))
        
        
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
