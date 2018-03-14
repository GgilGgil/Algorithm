//
//  main.swift
//  BricksGame
//
//  Created by Park GilNam on 2018. 2. 26..
//  Copyright © 2018년 ParkGilNam. All rights reserved.
//

import Foundation

func sumfn(n:Int, bricks:[Int]) -> Int{
    
    for i in 0..<n {
        
    }
}

var t = Int(readLine()!)!

for _ in 0..<t {
    
    let n = Int(readLine()!)!
    
    let bricks = readLine()!.components(separatedBy: " ").flatMap { Int($0) }
    
    print(sumfn(n: n, bricks: bricks))
}


