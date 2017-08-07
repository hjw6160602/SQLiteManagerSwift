//
//  ViewController.swift
//  SQLiteManagerSwiftDemo
//
//  Created by shoule on 16/9/7.
//  Copyright © 2016年 SaiDicaprio. All rights reserved.
//

import UIKit

//MARK: - 将数据库表转为plist
class ViewController: UIViewController {
    
//    let person = Person(dict: ["name": "rose" as AnyObject, "age": 19 as AnyObject])
    let person = Person(dict: ["name": "jack" as AnyObject, "age": 20 as AnyObject])
    
    let tables = ["AbroadFromDestTable", "FromDestTable", "HotelLandmarksTable", "MicroTourFromDestTable"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        _ = Person.loadPersons()
        readDataFromTable()
    }
    
    func readDataFromTable() {
        for tableName in tables {
            let table = loadDataFromTable(tableName) as NSArray
            saveWithFile(file: table, fileName: tableName)
            print(table)
        }
    }
    
    func loadDataFromTable(_ tableName: String) -> [[String: AnyObject]] {
        let sql = "SELECT * FROM \(tableName);"
        print(sql)
        let res = SQLiteManager.sharedManager().execRecordSQL(sql)
        return res
    }
    
    func saveWithFile(file:NSArray, fileName:String) {
        let plistName = fileName + ".plist"
        // 获取文本文件路径
        let filePath = plistName.docDir();
        // 4、将数据写入文件中
        file.write(toFile: filePath, atomically: true);
    }
}

//MARK: - 增删改查
extension ViewController {
 
    /** 增 */
    @IBAction func insertAction(_ sender: AnyObject) {
        print(person.insertPerson())
    }
    
    /** 删 */
    @IBAction func deleteAction(_ sender: AnyObject) {
        print(person.updatePerson("rose"))
    }
    
    /** 改 */
    @IBAction func updateAction(_ sender: AnyObject) {
        print(person.deletePerson())
    }
    
    /** 查 */
    @IBAction func selectAction(_ sender: AnyObject) {
        let models = Person.loadPersons()
        print(models)
    }
}
