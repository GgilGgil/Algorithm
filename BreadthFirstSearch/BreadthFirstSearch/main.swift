//
//  main.swift
//  BreadthFirstSearch
//
//  Created by Park GilNam on 2018. 3. 16..
//  Copyright © 2018년 ParkGilNam. All rights reserved.
//

import Foundation

struct Queue<Int> {
    var list:[Int] = [Int]()
    
    mutating func enqueue(_ element:Int) {
        list.append(element)
    }
    
    mutating func dequeue() -> Int? {
        if list.isEmpty == false {
            return list.removeFirst()
        } else {
            return nil
        }
    }
    
    func peek() -> Int? {
        if list.isEmpty == false {
            return list[0]
        } else {
            return nil
        }
    }
    
    func isEmpty() -> Bool {
        return list.isEmpty
    }
}

//let vertexList = [0, 1, 2, 3, 4, 5, 6]
//let edgeList = [[0, 1], [0, 2], [1, 0], [1, 3], [2, 0], [2, 4], [2, 5], [3, 1], [4, 2], [4, 6], [5, 2], [6, 4]]

let vertexList = [9, 7, 1, 5, 8, 2, 3, 4]
let edgeList = [[9, 7], [9, 1], [7, 9], [7, 5], [5, 7], [1, 9], [1, 8], [1, 2], [8, 1], [8, 3], [8, 4], [3, 8], [4, 8], [2, 1]]

var adjecencyList:[Int:[Int]] = [Int:[Int]]()

for edge in edgeList {
    if adjecencyList[edge[0]] == nil {
        adjecencyList[edge[0]] = [edge[1]]
    } else {
        adjecencyList[edge[0]]?.append(edge[1])
    }
}

var visitedList = [Int]()

var queue = Queue<Int>()

queue.enqueue(vertexList[0])

while queue.isEmpty() == false {
    let current = queue.dequeue()
    
    if current == nil {
        break
    }
    
    let edge = adjecencyList[current!]
    
    for adjecency in edge! {
        if visitedList.contains(adjecency) == false{
            queue.enqueue(adjecency)
        }
    }
    
    visitedList.append(current!)
}

print(visitedList)
