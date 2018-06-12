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
    
    var time : Timer!
    
    var timer:Int = 0
    
    var alert:UIAlertView!
    
    var isstart=false
    
    var isclean=false
    
    @IBOutlet weak var team1: UITextField!
    
    @IBOutlet weak var team2: UITextField!
    
    @IBOutlet weak var score1: UITextField!
    
    @IBOutlet weak var score2: UITextField!
    
    @IBOutlet weak var time1: UILabel!
    
    @IBOutlet weak var time2: UILabel!
    
    var a=0
    var b=0

    @IBAction func screen1add(_ sender: UIButton) {
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
        saveTime()
    }
    
    @IBAction func screen1subtract(_ sender: UIButton) {
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
        saveTime()
    }
    
    @IBAction func screen2add(_ sender: UIButton) {
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
        saveTime()
    }
    
    @IBAction func screen2subtract(_ sender: UIButton) {
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
        saveTime()
    }
    
    @IBAction func clean(_ sender: UIButton) {
        isclean=true
        score1.text = "0"
        score2.text = "0"
        time1.text = "0"
        time2.text = "0"
        team1.text = ""
        team2.text = ""
        time?.invalidate()
        timer = 0
        saveUser()
        saveMark()
        saveTime()
    }
    
    @IBAction func start(_ sender: UIButton) {
            time = Timer.scheduledTimer(timeInterval: 1,
                target:self,selector:#selector(ViewController.tickDown),
                userInfo:nil,repeats:true)
            isstart=true
    }
    
    func tickDown()
    {
        timer += 1
        let sec = timer%60
        let min = timer/60
        time1.text = String(min)
        time2.text = String(sec)
        saveUser()
        saveMark()
        saveTime()
    }
    
    @IBAction func stop(_ sender: UIButton) {
        if isstart==true
        {
            time?.invalidate()
            time = nil;
            saveUser()
            saveMark()
            saveTime()
            isstart=false
        } else {
            alert = UIAlertView()
            alert.title = "提示"
            alert.message = "请先开始计时"
            alert.addButton(withTitle: "确定")
            alert.show()
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //获取数据库实例
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        db.execute("create table if not exists t_user(uid integer primary key,team1 varchar(20),team2 varchar(20))")
        //如果有数据则加载
        initUser()
        
        db = SQLiteDB.sharedInstance()
        db.execute("create table if not exists t_mark(uid integer primary key,score1 varchar(20),score2 varchar(20))")
        initMark()
        
        db = SQLiteDB.sharedInstance()
        db.execute("create table if not exists t_time(uid integer primary key,min varchar(20),sec varchar(20))")
        initTime()
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

    func initTime() {
        let data = db.query("select * from t_time")
        if data.count > 0 {
            //获取最后一行数据显示
            let time = data[data.count - 1]
            time1.text = time["min"] as? String
            time2.text = time["sec"] as? String
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

    func saveTime() {
        let time1 = self.time1.text!
        let time2 = self.time2.text!
        //插入数据库，这里用到了esc字符编码函数，其实是调用bridge.m实现的
        let sql2 = "insert into t_time(min,sec) values('\(time1)','\(time2)')"
        print("sql2: \(sql2)")
        //通过封装的方法执行sql
        let result2 = db.execute(sql2)
        print(result2)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

