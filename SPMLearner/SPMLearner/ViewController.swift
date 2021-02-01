//
//  ViewController.swift
//  SPMLearner
//
//  Created by CuiYingBo on 1/22/21.
//

import UIKit
import Alamofire
import SomeFeature

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        testDependency()
        testSomeFeature()
    }

    func testDependency() -> Void {
        Alamofire.Session.default.request("https://bbs.hupu.com/40622370.html").response { (responseObj) in
            guard let data = responseObj.data else { return }
            let string2:String? =   String.init(data: data, encoding: .utf8)
            guard let str = string2 else { return }
            
            NSLog(str)
        }
    }
    func testSomeFeature() -> Void {
        let hi = SomeFeature()
        NSLog(hi.text)
    }
}

