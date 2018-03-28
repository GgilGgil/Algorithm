//
//  main.swift
//  Stack
//
//  Created by Park GilNam on 2018. 3. 14..
//  Copyright © 2018년 ParkGilNam. All rights reserved.
//

import Foundation

struct stack<Int> {
    var list:[Int] = [Int]()
    
    mutating func push(_ element:Int) {
        list.append(element)
    }
    
    mutating func pop() -> Int?{
        if list.isEmpty == false {
            let index = list.count - 1
            return list.remove(at: index)
        } else {
            return nil
        }
    }
    
    func peek() -> Int? {
        if list.isEmpty == false {
            return list.last
        } else {
            return nil
        }
    }
    
    func isEmpty() -> Bool {
        return list.isEmpty
    }
}

var aa = "abc"

var aaa = Array(aa)
print(aaa)
//var collection = stack<Int>()
//
//collection.push(10)
//collection.push(11)
//collection.push(12)
//collection.push(13)
//collection.push(14)
//collection.push(15)
//
//print(collection)
//
//print(collection.pop())
//
//print(collection.peek())
//
//print(collection.isEmpty())

