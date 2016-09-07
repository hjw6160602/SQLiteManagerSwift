//
//  ViewController.swift
//  SQLiteManagerSwiftDemo
//
//  Created by shoule on 16/9/7.
//  Copyright © 2016年 SaiDicaprio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let person = Person(dict: ["name": "rose", "age": 19])
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func insertAction(sender: AnyObject) {
        print(person.insertPerson())
    }

    @IBAction func deleteAction(sender: AnyObject) {
        print(person.updatePerson("rose"))
    }
    
    @IBAction func updateAction(sender: AnyObject) {
        print(person.deletePerson())
    }

    @IBAction func selectAction(sender: AnyObject) {
        let models = Person.loadPersons()
        print(models)
    }


}

