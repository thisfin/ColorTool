//
//  NSObject+Helper.swift
//  ColorTool
//
//  Created by wenyou on 2017/6/24.
//  Copyright © 2017年 wenyou. All rights reserved.
//

import Foundation

extension NSObject {
    func allKeys() -> [String] {
        var temp: UInt32 = 0
        let count: UnsafeMutablePointer<UInt32> = withUnsafeMutablePointer(to: &temp, {$0})
        let properties: UnsafeMutablePointer<objc_property_t?> = class_copyPropertyList(self.classForCoder, count)
        var propertyArray = [String]()
        for i in 0 ..< Int(count.pointee) {
            let propertyName = property_getName(properties[i])
            propertyArray.append(String.init(cString: propertyName!))
        }
        free(properties)
        return propertyArray
    }

    convenience init(properties: Dictionary<String, Any>) {
        self.init()
        self.setValuesForKeys(properties)
    }

    func toDictionary() -> Dictionary<String, Any> {
        return self.dictionaryWithValues(forKeys: self.allKeys())
    }

    func allIvars() -> [String] {
        var temp: UInt32 = 0
        let count: UnsafeMutablePointer<UInt32> = withUnsafeMutablePointer(to: &temp, {$0})
        let ivars: UnsafeMutablePointer<Ivar?>! = class_copyIvarList(self.classForCoder, count)
        var ivarArray = [String]()
        for i in 0 ..< Int(count.pointee) {
            let ivarName = ivar_getName(ivars[i])
            ivarArray.append(String.init(cString: ivarName!))
        }
        free(ivars)
        return ivarArray
    }
}
