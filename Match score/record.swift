//
//  record.swift
//  Match score
//
//  Created by Mr.Zhao on 16/5/16.
//  Copyright © 2016年 Mr.Zhao. All rights reserved.
//

import UIKit

class record: UIViewController {
    
    var db : SQLiteDB!
    
    @IBOutlet weak var record: UITextView!
    
    @IBAction func see(sender: UIButton) {
        initUser()
    }
    
    
    
    @IBAction func dec(sender: UIButton) {
        dec()
    }
    
    func dec()
    {
        let data=db.query("delete  from t_mark")
        record.text = " "
    }
    
    
    func initUser() {
        let data = db.query("select * from t_user")
        let data1=db.query("select * from t_mark")
        if data.count > 0 {
            //获取最后一行数据显示
            let user = data[data.count - 1]
            record.text = "队伍1："+(user["team1"] as? String)! + "   " + "队伍2：" +  (user["team2"] as? String)!+"\n"
        }
        //for var a=0;a<data1.count;a++
        //{
            let user = data1[data1.count-1]
            let user1=db.query("select count(*) from t_mark")
            record.text!+=(user["score1"] as? String)!  + "   " + (user["score2"] as? String)!+"\n"
        //}
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //获取数据库实例
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        db.execute("create table if not exists t_user(uid integer primary key,team1 varchar(20),team2 varchar(20))")
        //如果有数据则加载

     
        db = SQLiteDB.sharedInstance()
        db.execute("create table if not exists t_mark(uid integer primary key,score1 varchar(20),score2 varchar(20))")
//
//        db = SQLiteDB.sharedInstance()
//        db.execute("create table if not exists t_time(uid integer primary key,min varchar(20),sec varchar(20))")
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
