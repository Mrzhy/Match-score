//
//  ViewController.swift
//  Match score
//
//  Created by Mr.Zhao on 16/4/21.
//  Copyright © 2016年 Mr.Zhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var db : SQLiteDB!

    @IBOutlet weak var team1: UITextField!
    
    @IBOutlet weak var team2: UITextField!
    
    @IBOutlet weak var score1: UITextField!
    
    @IBOutlet weak var score2: UITextField!
    
    var a=0
    var b=0
    
    @IBAction func screen1add(sender: UIButton) {
        if(!score1.text!.isEmpty) {
            a=(score1.text! as NSString).integerValue
            a=a+1
            score1.text=("\(a)")
        } else {
            a=a+1
            score1.text=("\(a)")
        }
        saveUser()
        saveMark()
    }
    
    @IBAction func screen1subtract(sender: UIButton) {
        if(!score1.text!.isEmpty) {
            a=(score1.text! as NSString).integerValue
            if a>0{
                a=a-1
                score1.text=("\(a)")
            }
            score1.text=("\(a)")
        } else {
            if a>0{
                a=a-1
                score1.text=("\(a)")
            }
            score1.text=("\(a)")
        }
        saveUser()
        saveMark()
    }
    
    @IBAction func screen2add(sender: UIButton) {
        if(!score2.text!.isEmpty) {
            b=(score2.text! as NSString).integerValue
            b=b+1
            score2.text=("\(b)")
        } else {
            b=b+1
            score2.text=("\(b)")
        }
        saveUser()
        saveMark()
    }
    
    @IBAction func screen2subtract(sender: UIButton) {
        if(!score2.text!.isEmpty) {
            b=(score2.text! as NSString).integerValue
            if b>0{
                b=b-1
                score2.text=("\(b)")
            }
            score2.text=("\(b)")
        } else {
            if b>0{
                b=b-1
                score2.text=("\(b)")
            }
            score2.text=("\(b)")
        }
        saveUser()
        saveMark()
    }

    @IBAction func clean(sender: UIButton) {
        score1.text = "0"
        score2.text = "0"
        saveUser()
        saveMark()
    }
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //获取数据库实例
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        db.execute("create table if not exists t_user(uid integer primary key,team1 varchar(20),team2 varchar(20))")
        //如果有数据则加载
        initUser()
        
        //获取数据库实例
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        db.execute("create table if not exists t_mark(uid integer primary key,score1 varchar(20),score2 varchar(20))")
        //如果有数据则加载
        initMark()
    }
    
    //从SQLite加载数据
    func initUser() {
        let data = db.query("select * from t_user")
            if data.count > 0 {
            //获取最后一行数据显示
            let user = data[data.count - 1]
            team1.text = user["team1"] as? String
            team2.text = user["team2"] as? String
        }
    }
    
    func initMark() {
        let data = db.query("select * from t_mark")
        if data.count > 0 {
            //获取最后一行数据显示
            let mark = data[data.count - 1]
            score1.text = mark["score1"] as? String
            score2.text = mark["score2"] as? String
        }
    }

    
    //保存数据到SQLite
    func saveUser() {
        let team1 = self.team1.text!
        let team2 = self.team2.text!
        //插入数据库，这里用到了esc字符编码函数，其实是调用bridge.m实现的
        let sql = "insert into t_user(team1,team2) values('\(team1)','\(team2)')"
        print("sql: \(sql)")
        //通过封装的方法执行sql
        let result = db.execute(sql)
        print(result)
    }
    
    func saveMark() {
        let score1 = self.score1.text!
        let score2 = self.score2.text!
        //插入数据库，这里用到了esc字符编码函数，其实是调用bridge.m实现的
        let sql1 = "insert into t_mark(score1,score2) values('\(score1)','\(score2)')"
        print("sql1: \(sql1)")
        //通过封装的方法执行sql
        let result1 = db.execute(sql1)
        print(result1)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

