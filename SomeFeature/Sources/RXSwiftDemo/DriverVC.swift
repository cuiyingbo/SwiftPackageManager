//
//  File.swift
//  
//
//  Created by CuiYingBo on 2/4/21.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift
import Alamofire
public class DriverVC: UIViewController{
    @IBOutlet public private(set) weak var inputTextField: UITextField!
    @IBOutlet public private(set) weak var resultLabel: UILabel!
    private let _disposeBag: DisposeBag = DisposeBag()
    

    public static func instaniate() -> DriverVC{
        let storyboard = UIStoryboard(name: "Main", bundle: .module)
        return storyboard.instantiateViewController(withIdentifier: "DriverVC") as! DriverVC
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.observer()
    }
}
extension DriverVC{
    func observer(){
        let result = inputTextField.rx.text.skip(1).flatMap { (input) -> Observable<Any>  in
            return self.request(inputText: input!).observeOn(MainScheduler.instance).catchErrorJustReturn("检查到了错误")
        }.share(replay: 1, scope: .whileConnected)
        result.subscribe { (even) in
            print(even)
            print("subscribe:\(Thread.current)")
        }.disposed(by:_disposeBag )
        
        result.subscribe { (even:Event<Any>) in
            print(even)
            print("subscribe:\(Thread.current)")
            guard let value = even.element as? String else {return}
            self.resultLabel.text = value
                
        }.disposed(by: _disposeBag)
    }
    func request(inputText: String) -> Observable<Any> {
        print("请求网络了\(Thread.current)")
        return Observable<Any>.create { (ob) -> Disposable in
            if inputText == "1234" {
                ob.onError(NSError.init(domain: "xxx.com", code: 10086, userInfo: nil))
            }
            Alamofire.Session.default.request("http://61.143.224.166:8071/phone/servertimeios").response { (response:AFDataResponse<Data?>) in
                guard let data = response.data,
                      let string = String(data: data, encoding: .utf8 ) else{ return }
                print("发送之前看看:\(Thread.current)")
                ob.onNext("已经输入了:\(inputText),返回结果:\(string)")
                ob.onCompleted()
            }
            return Disposables.create()
        }
    }
}
extension DriverVC{
    @IBAction func tapButton1(_ sender: Any){
        
    }
}
