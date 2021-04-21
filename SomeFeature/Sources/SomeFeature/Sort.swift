//
//  File.swift
//  
//
//  Created by CuiYingBo on 4/7/21.
//  https://github.com/chefyuan/algorithm-base

import Foundation

class Sort: Any {
    static var list = [4,3,1,5,3,2,9,6,5,7];
    
    /// 插入排序：类似完扑克牌
    static func insertSort(){
        for i in (1 ..< list.count) {
            let temp = list[i];
            for j in stride(from: i-1, through: 0, by: -1) {
                if temp < list[j] {
                    list[j+1] = list[j];
                    list[j] = temp;
                    continue;
                }
                break;
            }
        }
        print(list)
    }
    
    /// 归并排序：分而治之
    /// https://github.com/chefyuan/algorithm-base/blob/main/animation-simulation/%E6%95%B0%E6%8D%AE%E7%BB%93%E6%9E%84%E5%92%8C%E7%AE%97%E6%B3%95/%E5%BD%92%E5%B9%B6%E6%8E%92%E5%BA%8F.md
    /// 1.创建一个额外大集合用于存储归并结果，长度则为那两个小集合的和（这里使用了append）
    /// 2.我们从左自右比较两个指针指向的值，将较小的那个存入大集合中，存入之后指针移动，并继续比较，直到某一小集合的元素全部都存到大集合中。
    /// 3.当某一小集合元素全部放入大集合中，则需将另一小集合中剩余的所有元素存到大集合中
    static func mergeSortList(){
        
        var list = [4,3,1,5,3,2,9,6,5,7];
        Sort .mergeSort(array: &list, left: 0, right: list.count - 1)
        print(list)
    }
    static func mergeSort( array:inout Array<Int>, left:Int, right:Int) {

        if left < right {
            let mid = left + ((right - left) >> 1)
            mergeSort(array: &array, left: left, right: mid)
            mergeSort(array: &array, left: mid+1 , right: right)
            merge(array: &array, left: left, mid: mid, right: right)
        }
    }
    static func merge(array:inout Array<Int>, left:Int, mid:Int, right:Int) {
        var tempArray:Array<Int> = Array<Int>()
        var temp1 = left, temp2 = mid+1
        var index = 0
        while temp1 <= mid && temp2 <= right {
            if array[temp1] < array[temp2] {
                tempArray.append(array[temp1])
                index += 1
                temp1 += 1
            }else{
                tempArray.append(array[temp2])
                index += 1
                temp2 += 1
            }
        }
        
        if temp1 <= mid {
            while temp1 <= mid {
                tempArray.append(array[temp1])
                index += 1
                temp1 += 1
            }
        }
        if temp2 <= right {
            while temp1 <= mid {
                tempArray.append(array[temp2])
                index += 1
                temp2 += 1
            }
        }
        
        var tempIndex = left
        for index in (0 ..< tempArray.count) {
            array[tempIndex] = tempArray[index]
            tempIndex = tempIndex+1
        }
        
    }
    
    
    
    /// 快速排序：以第一位作为基准，将小于基准的放左边，大于基准的放右边，递归处理
    static func quickSorter(){
        var list = [4,3,1,5,3,2,9,6,5,7];
        Sort .quickSort(array: &list, low: 0, hight: list.count-1)
        print(list)
    }
    static func quickSort(array:inout Array<Int> , low: Int, hight: Int){
        if low < hight {
            let index = Sort.quickPatition(array: &array, low: low, hight: hight)
            quickSort(array: &array, low: low, hight: index-1)
            quickSort(array: &array, low: index+1, hight: hight)
        }
    }
    static func quickPatition(array:inout Array<Int> , low: Int, hight: Int) -> Int{
        let tempPivot = array[low];
        var tempLow = low;
        var tempHight = hight ;
        //坑位定在low
        //hight--，如果大于pivot。如果小于pivot，将其与坑位互换
        //low++，如果小于privot。如果大于rivot，将其与坑位互换
        //重复直到 low 跟 hight 一样，排序完成
        while tempLow < tempHight {
            while tempLow < tempHight && array[tempHight] >= tempPivot {
                tempHight -= 1
            }
            if low < hight {
                array[tempLow] = array[tempHight]
            }
            while tempLow < tempHight &&  array[tempLow] <= tempPivot {
                tempLow += 1
            }
            if low < hight {
                array[tempHight] = array[tempLow]
            }
        }
        array[tempLow] = tempPivot
        return tempLow
    }
}
