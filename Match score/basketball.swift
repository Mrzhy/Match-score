//
//  basketball.swift
//  Match score
//
//  Created by Mr.Zhao on 16/5/9.
//  Copyright © 2016年 Mr.Zhao. All rights reserved.
//

import UIKit

class basketball: UIViewController {
    
    
    
    @IBOutlet weak var basketball: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        basketball.loadRequest(NSURLRequest(URL:NSURL(string:"http://baike.baidu.com/link?url=ArzvSNncjDdYyha326BtmttWHkxM2VYYahnSN3HyRJbQ9QCXiqjTswKDpts1fer55a1LKyG3OCTJ_uinSpssia")!))
        
    }
    

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

    /*override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

}*/
