//
//  main.swift
//  DepthFirstSearch
//
//  Created by Park GilNam on 2018. 3. 16..
//  Copyright © 2018년 ParkGilNam. All rights reserved.
//

import Foundation

struct Stack<Int> {
    var list:[Int] = [Int]()
    
    mutating func push(_ element:Int) {
        list.append(element)
    }
    
    mutating func pop() -> Int? {
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

let vertexList = [0, 1, 2, 3, 4, 5, 6]
let edgeList = [[0, 1], [0, 2], [1, 0], [1, 3], [2, 0], [2, 4], [2, 5], [3, 1], [4, 2], [4, 6], [5, 2], [6, 4]]
var adjecencyList = [[Int]](repeating: Array(repeating: 0,count: 0), count: vertexList.count)

for edge in edgeList {
    adjecencyList[edge[0]].append(edge[1])
}

var visitedVertex = [Int]()

var stack = Stack<Int>()

stack.push(vertexList[0])

while stack.isEmpty() == false{
    
    let current = stack.pop()
    
    if current == nil {
        break
    }
    
    for adjecency in adjecencyList[current!] {
        if visitedVertex.contains(adjecency) == false {
            stack.push(adjecency)
        }
    }
    
    visitedVertex.append(current!)
}

print(visitedVertex)
