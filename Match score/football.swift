//
//  football.swift
//  Match score
//
//  Created by Mr.Zhao on 16/5/9.
//  Copyright © 2016年 Mr.Zhao. All rights reserved.
//

import UIKit

class football: UIViewController {

    
    
    @IBOutlet weak var footboll: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        footboll.loadRequest(NSURLRequest(URL:NSURL(string:"http://baike.baidu.com/link?url=b1vckeZA2ehnsBc7EF0C1ocDVuPf12a7zLOClza7xIMOoFBeDP02v-gPfamWhuVa4zDLATMU7W7amT6LHIadaa")!))
        
        
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
