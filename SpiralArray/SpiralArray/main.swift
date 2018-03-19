//
//  main.swift
//  SpiralArray
//
//  Created by Park GilNam on 2018. 3. 19..
//  Copyright © 2018년 ParkGilNam. All rights reserved.
//

import Foundation

enum Direction {
    case LTR //왼쪽 -> 오른쪽
    case TTB //위 -> 아래
    case RTL //오른쪽 -> 왼쪽
    case BTT //아래 -> 우
}

let xy = readLine()!.components(separatedBy: " ").map{ Int($0)! }

var max_x = xy[0]
var max_y = xy[1]
var min_x = 0
var min_y = 0

var list:[[Int]] = Array(repeating: Array(repeating: -1,count: max_y), count: max_x)

var arr_x = 0
var arr_y = 0
var count = 0

var direction:Direction = Direction.LTR

while list[arr_x][arr_y] == -1 {
    
    list[arr_x][arr_y] = count
    count += 1
    
    switch direction {
    case Direction.LTR: //왼->오
        if arr_y == max_y - 1 {
            arr_x += 1
            min_x += 1
            direction = Direction.TTB
        } else {
            arr_y += 1
        }
    case Direction.TTB: //위->아래
        if arr_x == max_x - 1{
            arr_y -= 1
            max_y -= 1
            direction = Direction.RTL
        } else {
            arr_x += 1
        }
    case Direction.RTL: //오->왼
        if arr_y == min_y{
            arr_x -= 1
            max_x -= 1
            direction = Direction.BTT
            
        } else {
            arr_y -= 1
        }
    case Direction.BTT: //아래->위
        if arr_x == min_x{
            arr_y += 1
            min_y += 1
            direction = Direction.LTR
        } else {
            arr_x -= 1
        }
    }
}


for i in 0..<list.count {
    print(list[i])
}

