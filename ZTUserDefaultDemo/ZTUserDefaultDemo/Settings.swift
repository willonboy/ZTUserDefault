//
//  Settings.swift
//  ZTUserDefaultDemo
//
//  Created by zt on 2024/8/27.
//

import Foundation

class Settings {
    @UserDefaultOptional(key: "version")
    static var ver:Int?
    
    @UserDefault(key: "name", defaultValue: "Jack")
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
        self.name = "Tom"
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
        
        self.ver = 204
        self.name = "Jerry"
    }
}

struct School : Equatable, ZTCoding, CustomStringConvertible {
    var description: String {
        "\(name): \(students): \(teachers)"
    }
    
    var name: String
    var students: [Student]
    var teachers: [Teacher]
}

struct Teacher : ZTCoding, Equatable {
    var name:String
    var age: Int
    var category:String
}

struct Student : ZTCoding, Equatable {
    var name:String
    var age: Int
}

