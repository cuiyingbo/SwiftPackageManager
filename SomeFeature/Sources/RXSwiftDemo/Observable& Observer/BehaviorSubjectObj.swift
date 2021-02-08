//
//  File.swift
//  
//
//  Created by CuiYingBo on 2/6/21.
//当观察者对 BehaviorSubject 进行订阅时，它会将源 Observable 中最新的元素发送出来（如果不存在最新的元素，就发出默认元素）。然后将随后产生的元素发送出来。
//如果源 Observable 因为产生了一个 error 事件而中止， BehaviorSubject 就不会发出任何元素，而是将这个 error 事件发送出来。

import Foundation
import UIKit
import RxCocoa
import RxSwift
public class BehaviorSubjectObj: Any {
    public let  _subject:BehaviorSubject<String?>!
    public var  _result:String?
    public let _disposeBag = DisposeBag()
    
    init() {
        _subject = BehaviorSubject(value: "init")
    }
}
    

extension BehaviorSubjectObj{
   public func test() -> Void {
        _subject.subscribe {
            print("subscription:1 event:",$0)
        }.disposed(by: _disposeBag)
    
    _subject.onNext("oned")
    _subject.onNext("second")
    
         _subject.subscribe {
             print("subscription:2 event:",$0)
         }.disposed(by: _disposeBag)
    _subject.onNext("third")
    _subject.onNext("fourth")
    _subject.subscribe {
        print("subscription:3 event:",$0)
    }.disposed(by: _disposeBag)
    
    }
    
}
