//
//  main.swift
//  BubbleSort
//
//  Created by Park GilNam on 2018. 3. 14..
//  Copyright © 2018년 ParkGilNam. All rights reserved.
//

import Foundation

func bubblesort(arr:[Int] ) {
    
    var array = arr
    
    print("before : \(array)")
    
    for _ in 0..<array.count {
        for j in 0..<array.count - 1 {
            if array[j] > array[j + 1] {
                array.swapAt(j, j + 1)
            }
        }
    }
    
    print("after : \(array)")
}

var array = [5, 1, 3, 8, 6, 2, 4, 7, 10, 9]

bubblesort(arr: array)
