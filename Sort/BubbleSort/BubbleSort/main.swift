//
//  main.swift
//  BubbleSort
//
//  Created by Park GilNam on 2018. 3. 14..
//  Copyright © 2018년 ParkGilNam. All rights reserved.
//

/*
 버블 정렬은 매우 기본적인 정렬 알고리즘입니다.
 배열의 시작 부분에서 시작하여 첫 번째 몇 요소를 비교하여 사용됩니다.
 첫 번째 요소의 값이 두 번째 요소보다 큰 경우 요소 만 바뀝니다.
 인접 요소를 비교하는이 프로세스는 끝까지 도달 할 때까지 배열 전체에서 계속 수행되고 배열이 정렬 될 때까지 0 번째 인덱스에서 다시 반복됩니다.
 이 정렬 알고리즘은 실제 코드에서 구현하는 것이 느려지므로 학습 목적을 벗어나 사용되지 않습니다.
 
 최상의 케이스 복잡성 : О (n) 최악의 복잡도 : О (n ^ 2)
 */

import Foundation

//func bubbleSort(_ arr:[Int]) -> [Int] {
//    var array = arr
//
//    print(array)
//
//    for _ in 0..<array.count {
//        for i in 0..<array.count - 1 {
//            if array[i] > array[i+1] {
//                let temp = array[i]
//                array[i] = array[i+1]
//                array[i+1] = temp
//            }
//        }
//    }
//
//    return array
//}

func bubbleSort(_ arr:[Int]) -> [Int] {
    var array = arr
    
    print(array)
    
    for _ in 0..<array.count {
        for i in 0..<array.count - 1 {
            if array[i] > array[i + 1] {
                let temp = array[i]
                array[i] = array[i + 1]
                array[i + 1] = temp
            }
        }
    }
    
    return array
}


var array = [5, 1, 3, 8, 6, 2, 4, 7, 10, 9]

print(bubbleSort(array))
