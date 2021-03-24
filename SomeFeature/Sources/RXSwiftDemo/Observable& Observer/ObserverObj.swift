//
//  File.swift
//  
//
//  Created by CuiYingBo on 2/8/21.
//

import Foundation
import RxSwift
import RxCocoa
import Alamofire
public class ObserverObj:Any{
    private let _observer: AnyObserver<String>
    private var _message: Observable<String>!
    private let _disposeBag: DisposeBag = DisposeBag()
    private let _dispose = Disposables.create()//注意这里一定声明Disposable作为属性，否则 .disposed(by: _disposeBag)会提前执行，导致网络请求完成时，observer已经释放
    init() {
        _observer = AnyObserver{ event in
            switch event{
            case: .next(let string)
                print("_observer:" + string)
            default:
                break
            }
        }
    }
}

extension ObserverObj{
    func test(){
        
        _message = self.request(inputText: "abc")
        _message.bind(to: _observer).disposed(by: _disposeBag)
    }
    
    func request(inputText: String) -> Observable<String> {
        print("请求网络了\(Thread.current)")
        return Observable<String>.create { [self] (ob) -> Disposable in
            Alamofire.Session.default.request("http://61.143.224.166:8071/phone/servertimeios").response { (response:AFDataResponse<Data?>) in
                guard let data = response.data,
                      let string = String(data: data, encoding: .utf8 ) else{ return }
                print("发送之前看看:\(Thread.current)")
                ob.onNext("已经输入了:\(inputText),返回结果:\(string)")
                ob.onCompleted()
            }
            return _dispose
        }
    }
}
