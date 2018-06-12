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
    
    @IBAction func see(_ sender: UIButton) {
        initUser()
    }
    
    @IBAction func dec(_ sender: UIButton) {
        dec()
        dec1()
        dec2()
    }
    
    func dec()
    {
        let data=db.query("delete  from t_mark")
        record.text = " "
    }
    
    func dec1()
    {
        let data=db.query("delete  from t_user")
        record.text = " "
    }
    func dec2()
    {
        let data=db.query("delete  from t_time")
        record.text = " "
    }

    
    func initUser() {
        let data = db.query("select * from t_user")
        let data1 = db.query("select * from t_mark")
        let data2 = db.query("select * from t_time")
        //if data.count > 0 
        for var a=0;a<data.count;a += 1
            {
                //获取最后一行数据显示  可能值？ 确定有！
                let user = data[a]
                record.text! += "队伍一：" + (user["team1"] as? String)! + "\n" + "队伍二：" +  (user["team2"] as? String)! + "\n"
                    if data1.count > 0 {
                        let user = data1[a]
                        record.text! += "队伍一比分：" + (user["score1"] as? String)!  + "\n" + "队伍二比分：" +  (user["score2"] as? String)! + "\n"
                    }
                    if data2.count > 0 {
                        let user = data2[a]
                        record.text! += "时间" + (user["min"] as? String)! + " : " + (user["sec"] as? String)! + "\n\n"
                    }

            }
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
