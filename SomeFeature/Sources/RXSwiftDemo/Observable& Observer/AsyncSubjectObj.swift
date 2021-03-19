//
//  File.swift
//  
//
//  Created by CuiYingBo on 2/8/21.
//AsyncSubject 将在源 Observable 产生完成事件后，发出最后一个元素（仅仅只有最后一个元素），如果源 Observable 没有发出任何元素，只有一个完成事件。那 AsyncSubject 也只有一个完成事件。
//它会对随后的观察者发出最终元素。如果源 Observable 因为产生了一个 error 事件而中止， AsyncSubject 就不会发出任何元素，而是将这个 error 事件发送出来。

import Foundation
import RxCocoa
import RxSwift
class AsyncSubjectObj: Any {
    private let _disposeBag = DisposeBag()
    private let _subject: AsyncSubject<String>
    
    init(subject:AsyncSubject<String> = AsyncSubject<String>()) {
        _subject = subject
    }
}
 
extension AsyncSubjectObj{
    func test() -> Void {
        _subject.subscribe{ print("subcription:1 event: ",$0 ) }
            .disposed(by: _disposeBag)
        _subject.onNext("one")
        _subject.onNext("second")
        _subject.onNext("third")
        _subject.onNext("fourth")
    }
}
