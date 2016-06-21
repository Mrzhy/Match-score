//
//  t1.swift
//  Match score
//
//  Created by Mr.Zhao on 16/6/20.
//  Copyright © 2016年 Mr.Zhao. All rights reserved.
//

import UIKit

class t1: UIViewController {
    
    var db : SQLiteDB!
    
    @IBOutlet weak var remarks1: UITextView!
    
    @IBAction func save(sender: UIButton) {
        saveremarks1()
    }
    
    @IBAction func see(sender: UIButton) {
        initremarks1()
    }
    
    @IBAction func clear(sender: UIButton) {
        let data=db.query("delete  from t_rem1")
        remarks1.text = " "
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        db.execute("create table if not exists t_rem1(uid integer primary key,t1 varchar(20),team2 varchar(20))")
        //如果有数据则加载

        // Do any additional setup after loading the view.
    }
    
    func initremarks1() {
        let data = db.query("select * from t_rem1")
        for var a=0;a<data.count;a++
        {
            //获取最后一行数据显示
            let user = data[a]
            remarks1.text! += (user["team1"] as? String)! + "\n"
        }
    }

    func saveremarks1() {
        let team1 = self.remarks1.text!
        //插入数据库，这里用到了esc字符编码函数，其实是调用bridge.m实现的
        let sql = "insert into t_rem1(team1) values('\(team1)')"
        print("sql: \(sql)")
        //通过封装的方法执行sql
        let result = db.execute(sql)
        print(result)
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
