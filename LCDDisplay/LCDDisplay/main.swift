//
//  main.swift
//  LCDDisplay
//
//  Created by Park GilNam on 2018. 3. 19..
//  Copyright © 2018년 ParkGilNam. All rights reserved.
//

import Foundation

/*
 각 번호 별 표시되는 위치
 0 : 상단 -
 1 : 상단 왼쪽 |
 2 : 상단 오른쪽 |
 3 : 중간 -
 4 : 하단 왼쪽 |
 5 : 하단 오른쪽 |
 6 : 하단 -
*/
var table:[[Int]] = [
    [2, 3, 5, 6, 7, 8, 9, 0],   //0
    [4, 5, 6, 7, 8, 9, 0],      //1
    [1, 2, 3, 4, 7, 8, 9, 0],   //2
    [2, 3, 4, 5, 6, 8, 9],      //3
    [2, 6, 8, 0],               //4
    [1, 3, 4, 5, 6, 7, 8, 9, 0], //5
    [2, 3, 5, 6, 8, 9, 0]       //6
]

while true {
    
    let data = readLine()!.components(separatedBy: " ").map{Int($0)!}
    
    let size = data[0]
    let number = data[1]

    if size == 0 && number == 0 {
        break
    }
    
    let strNumbers =  String(number)
    
    var i = 0
    
    for _ in 0..<5{
        switch i {
        case 0, 3, 6 :
            var display = ""
            
            for strNumber in strNumbers.enumerated() {
                let number = Int(String(strNumber.element))!
                
                var charY = ""
                if table[i].contains(number) {
                    charY = "-"
                } else {
                    charY = " "
                }
                
                let displayY = " " + Array(repeatElement(charY, count: size)).joined() + " "
                display += displayY
            }
            
            print(display)
            i += 1
        default:
            for _ in 0..<size {
                var display = ""
                
                for strNumber in strNumbers.enumerated() {
                    let number = Int(String(strNumber.element))!
                
                    var displayX = ""
                    if table[i].contains(number) && table[i+1].contains(number) {
                        displayX = "|" + Array(repeatElement(" ", count: size)).joined() + "|"
                    } else if table[i].contains(number) && table[i+1].contains(number) == false {
                        displayX = "|" + Array(repeatElement(" ", count: size + 1)).joined()
                    } else if table[i].contains(number) == false && table[i+1].contains(number) {
                        displayX = Array(repeatElement(" ", count: size + 1)).joined() + "|"
                    } else {
                        displayX = Array(repeatElement(" ", count: size + 2)).joined()
                    }
                    
                    display += displayX
                }
            
                print(display)
            }
            i += 2
        }

    }
}

