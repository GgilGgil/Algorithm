//
//  main.swift
//  SelectionSort
//
//  Created by Park GilNam on 2018. 3. 14..
//  Copyright © 2018년 ParkGilNam. All rights reserved.
//

/*
 선택 정렬은 정렬되지 않은 배열을 통과하고 가장 낮은 값을 찾은 다음 정렬 된 하위 목록으로 배열의 시작 부분에 저장하는 정렬 알고리즘입니다.
 두 번째 요소부터 계속해서 정렬 된 하위 목록의 두 번째 요소로 저장하기 위해 정렬되지 않은 배열에서 가장 낮은 값을 다시 찾습니다.
 이 프로세스는 배열이 정렬 될 때까지 계속됩니다. 선택 정렬은 삽입 정렬 알고리즘과 매우 유사합니다.
 
 최적 케이스 복잡성 : О (n ^ 2) 최악의 복잡도 : О (n ^ 2)
 */

import Foundation

func selectionSort(arr:[Int]) {
    
    var array = arr
    let max = array.count
    
    for i in 0..<max {
        var key = array[i]
        var keyj = i
        
        for j in i+1..<max {
            if array[j] < key {
                key = array[j]
                keyj = j
            }
        }
        
        array[keyj] = array[i]
        array[i] = key
        
        print(array)
    }
}

let array = [6, 7, 2, 5, 1, 4, 3, 8, 10, 9]

selectionSort(arr: array)
