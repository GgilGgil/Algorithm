//
//  main.swift
//  MergeSort
//
//  Created by Park GilNam on 2018. 3. 14..
//  Copyright © 2018년 ParkGilNam. All rights reserved.
//

/*
 병합 정렬은 배열을 두 부분으로 나누는 정렬 알고리즘으로 중간 바로 아래에 있습니다.
 [3,4,5,1,0,8,1]배열은 네 번째 요소 뒤에 분할되어 두 개의 하위 목록을 만듭니다.
 이 과정은 소수의 단일 요소 (정확히이 상황에서 7 개)가 서로 다른 '정렬 된'하위 목록이있을 때까지 반복됩니다.
 하나씩 요소가 비교되고 정렬 된 배열로 병합됩니다.
 
 최적 케이스 복잡성 : O (n log (n)) 최악의 경우의 복잡성 : O (n log (n))
 */

import Foundation

func mergeSort(arr:[Int]) -> [Int] {
    
    var array = arr
    let n = array.count
    
    if n == 1 {
        return array
    }
    
    var l1:[Int] = [Int](array[0...n/2-1])
    var l2:[Int] = [Int](array[n/2..<n])
    
    l1 = mergeSort(arr: l1)
    l2 = mergeSort(arr: l2)
    
    return merge(l1: l1, l2: l2)
}

func merge(l1:[Int], l2:[Int]) -> [Int] {
    var a = l1
    var b = l2
    var c:[Int] = [Int]()
    
    while a.count > 0 && b.count > 0 {
        if a[0] > b[0] {
            c.append(b[0])
            b.remove(at: 0)
        } else {
            c.append(a[0])
            a.remove(at: 0)
        }
    }
    
    while a.count > 0 {
        c.append(a[0])
        a.remove(at: 0)
    }
    
    while b.count > 0 {
        c.append(b[0])
        b.remove(at: 0)
    }
    
    return c
}

let array = [6, 7, 2, 5, 1, 4, 3, 8, 10, 9]

print("before:\(array)")
print("after:\(mergeSort(arr: array))")

