//
//  pingpong.swift
//  Match score
//
//  Created by Mr.Zhao on 16/5/12.
//  Copyright © 2016年 Mr.Zhao. All rights reserved.
//

import UIKit

class pingpong: UIViewController {

    
    @IBOutlet weak var pingpong: UIWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pingpong.loadRequest(URLRequest(url:URL(string:"http://baike.baidu.com/link?url=AtS631be3phqA7HQDfbljKdlfkJDoW0muH064iyXtDTYSSm1nwNm2Xj_2CxctmcPQR0mSLjjTvxJWtBbqMpNua")!))
        
        
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
