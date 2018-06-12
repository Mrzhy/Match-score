//
//  other.swift
//  Match score
//
//  Created by Mr.Zhao on 16/5/12.
//  Copyright © 2016年 Mr.Zhao. All rights reserved.
//

import UIKit

class other: UIViewController {


    @IBOutlet weak var other: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        other.loadRequest(URLRequest(url:URL(string:"http://www.360doc.com/content/10/0831/23/0_50262757.shtml")!))
        
        
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
