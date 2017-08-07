//
//  Person.swift
//  SQLite基本使用
//
//  Created by SaiDicaprio on 15/9/20.
//  Copyright © 2015年 SaiDicaprio. All rights reserved.
//

import UIKit

class Person: NSObject {
    var id: Int = 0
    var age: Int = 0
    var name: String = ""
    
    
    // MARK: - 执行数据源CRUD的操作
    class func loadPersons() -> [Person] {
        let sql = "SELECT * FROM T_Person;"
        let res = SQLiteManager.sharedManager().execRecordSQL(sql)
        print(res)
        var models = [Person]()
        for dict in res {
            models.append(Person(dict: dict))
        }
        return models
    }
    
    /** 删除记录 */
    func deletePerson() -> Bool {
        // 1.编写SQL语句
        let sql = "DELETE FROM T_Person WHERE age IS \(age);"
        
        // 2.执行SQL语句
        return SQLiteManager.sharedManager().execSQL(sql)
    }
    
    /** 更新 */
    func updatePerson(_ name: String) -> Bool {
        // 1.编写SQL语句
        let sql = "UPDATE T_Person SET name = '\(name)' WHERE age = \(age);"
        print(sql)
        // 2.执行SQL语句
        return SQLiteManager.sharedManager().execSQL(sql)
    }
    /** 插入一条记录 */
    func insertPerson() -> Bool {
        // 1.编写SQL语句
        let sql = "INSERT INTO T_Person (name, age) VALUES ('" +
                    name + "',\(age));"
        
        // 2.执行SQL语句
        return SQLiteManager.sharedManager().execSQL(sql)
    }
    
    // MARK: - 系统内部方法
    init(dict: [String: AnyObject]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    
    override var description: String {
        return "id = \(id), age = \(age), name = \(name)"
    }
}
