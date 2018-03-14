//
//  main.swift
//  InsertionSort
//
//  Created by Park GilNam on 2018. 3. 14..
//  Copyright © 2018년 ParkGilNam. All rights reserved.
//

/*
 삽입 정렬은 배열 (일반적으로 첫 번째 요소)에서 요소를 선택하고 현재 색인에서 꺼내
 '정렬 된 하위 목록'내의 올바른 위치에 '삽입'하는 정렬 알고리즘입니다
 첫 번째 요소의 값이 두 번째 요소보다 큰 경우 요소는 인덱스를 바꿉니다.
 그렇지 않으면 첫 번째 요소가 '정렬 된 하위 목록'의 일부가되는 반면 두 번째 요소와 세 번째 요소가 반복되어 오름차순인지 확인합니다.
 인접 요소를 비교하는이 프로세스는 끝까지 도달 할 때까지 배열 전체에서 계속됩니다.
 
 최상의 케이스 복잡성 : О (n) 최악의 복잡도 : О (n ^ 2)
*/
import Foundation

func insertionSort(arr:[Int]) {
    
    var array = arr
    
    print("before : \(array)")
    
    for i in 0..<array.count {
        let key = array[i]
        var j = i - 1
        
        while j >= 0 && array[j] > key {
            array[j+1] = array[j]
            j = j - 1
            array[j+1] = key
        }
    }
    
    print("after : \(array)")
}

let array = [5, 3, 2, 4, 1]

insertionSort(arr: array)
