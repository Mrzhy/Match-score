//
//  ViewController.swift
//  Match score
//
//  Created by Mr.Zhao on 16/4/21.
//  Copyright © 2016年 Mr.Zhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var screen1: UITextField!
    
    @IBOutlet weak var screen2: UITextField!
    
    var a=0
    var b=0
    
    @IBAction func screen1add(sender: UIButton) {
        a=a+1
        screen1.text=("\(a)")
            }
    
    @IBAction func screen1subtract(sender: UIButton) {
        if a>0{
            a=a-1
            screen1.text=("\(a)")
            return
        }
        screen1.text=("\(a)")
    }
    
    @IBAction func screen2add(sender: UIButton) {
        b=b+1
        screen2.text=("\(b)")
    }
    
    @IBAction func screen2subtract(sender: UIButton) {
        if b>0{
            b=b-1
            screen2.text=("\(b)")
            return
        }
        screen1.text=("\(b)")
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

