//
//  main.swift
//  Eight_Queens_Problem
//
//  Created by Park GilNam on 2018. 3. 28..
//  Copyright © 2018년 ParkGilNam. All rights reserved.
//

import Foundation

class ChessBoard {
    var n = 0
    var result = 0
    
    var cols:[Int] = [Int]()
    
    init(n:Int) {
        self.n = n
        self.cols = Array(repeatElement(-1, count: n + 1))
    }
    
    func queens(queen:Int) {
        if promising(queen: queen) {
            if queen == n {
                //printQueens()
                result += 1
            } else {
                for i in 0..<n {
                    cols[queen + 1] = i
                    queens(queen: queen + 1)
                }
            }
        }
    }
    
    func promising(queen:Int) -> Bool {
        
        var k = 1
        var bSwitch = true
        
        while k < queen && bSwitch {
            if cols[queen] == cols[k] || abs(cols[queen] - cols[k]) == queen - k {
                bSwitch = false
            }
            
            k += 1
        }
        
        return bSwitch
    }
    
    func printQueens() {
        print(cols)
    }
}



let chessBoard = ChessBoard(n: 13)
chessBoard.queens(queen:0)

print(chessBoard.result)
