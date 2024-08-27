//
//  Settings.swift
//  ZTUserDefaultDemo
//
//  Created by zt on 2024/8/27.
//

import Foundation


class Settings: ObservableObject {
    @UserDefaultOptional(key: "version")
    static var ver:Int?
    
    @UserDefault(key: "name", defaultValue: "")
    static var name
    
    @UserDefaultOptional(key: "school")
    static var school: School?
    
    static func update() {
        var sts:[Student] = []
        sts.append(Student(name: "张三", age: 18))
        sts.append(Student(name: "李四", age: 19))
        
        var ts:[Teacher] = []
        ts.append(Teacher(name: "孔子", age: 35, category: "政治"))
        ts.append(Teacher(name: "老子", age: 45, category: "哲学"))
        let s = School(name: "小圣贤庄", students: sts, teachers: ts)
        self.school = s
        
        self.ver = 203
        self.name = "this is name"
    }
    
    static func update2() {
        var sts:[Student] = []
        sts.append(Student(name: "张三2", age: 18))
        sts.append(Student(name: "李四2", age: 19))
        
        var ts:[Teacher] = []
        ts.append(Teacher(name: "孔子2", age: 35, category: "政治"))
        ts.append(Teacher(name: "老子2", age: 45, category: "哲学"))
        let s = School(name: "小圣贤庄2", students: sts, teachers: ts)
        self.school = s
        
        self.ver = 2032
        self.name = "this is name2"
    }
}

class School : ObservableObject, ZTCoding {
    var name: String
    var students: [Student]
    var teachers: [Teacher]
    
    init(name:String, students: [Student], teachers:[Teacher]) {
        self.name = name
        self.students = students
        self.teachers = teachers
    }
}

class Teacher : ZTCoding {
    var name:String
    var age: Int
    var category:String
    init(name: String, age: Int, category: String) {
        self.name = name
        self.age = age
        self.category = category
    }
}

class Student : ZTCoding {
    var name:String
    var age: Int
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

