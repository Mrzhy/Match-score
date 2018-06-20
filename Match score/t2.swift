//
//  t1.swift
//  Match score
//
//  Created by Mr.Zhao on 16/6/20.
//  Copyright © 2016年 Mr.Zhao. All rights reserved.
//

import UIKit

class t2: UIViewController {
    
    var db : SQLiteDB!
    
    @IBOutlet weak var remarks2: UITextView!
    
    @IBAction func save(_ sender: UIButton) {
        saveremarks2()
    }
    
    @IBAction func see(_ sender: UIButton) {
        initremarks2()
    }
    
    @IBAction func clear(_ sender: UIButton) {
        _=db.query(sql: "delete  from t_rem2")
        remarks2.text = " "
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        db = SQLiteDB.shared
        //打开数据库
        _ = db.openDB()
        //如果表还不存在则创建表（其中uid为自增主键）
        let result_t2 = db.execute(sql: "create table if not exists t_rem2(uid integer primary key,t2 varchar(20),team2 varchar(20))")
        //如果有数据则加载
        print(result_t2)
        initremarks2()
        
        // Do any additional setup after loading the view.
    }
    
    func initremarks2() {
        let data = db.query(sql: "select * from t_rem2")
        for a in 0 ..< data.count
        {
            //获取最后一行数据显示
            let user = data[a]
            remarks2.text! += (user["t2"] as? String)! + "\n"
        }
    }
    
    func saveremarks2() {
        let t2 = self.remarks2.text!
        //插入数据库，这里用到了esc字符编码函数，其实是调用bridge.m实现的
        let sql = "insert into t_rem2(t2) values('\(t2)')"
        print("sql: \(sql)")
        //通过封装的方法执行sql
        let result_t2 = db.execute(sql: sql)
        print(result_t2)
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
