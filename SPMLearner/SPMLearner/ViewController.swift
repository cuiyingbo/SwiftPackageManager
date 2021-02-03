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
        SomeFeature().testAlamofire()
        
    }

    func testDependency() -> Void {
        Alamofire.Session.default.request("http://61.143.224.166:8071/phone/servertimeios?from=2&fromKind=2&r=1612170416&version=5.71").response { (responseObj) in
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
    @IBAction func tapSomeVC(_ sender: Any) {
        let vc = SomeVC.instantiate()
        show(vc, sender: nil)
    }
    @IBAction func tapOtherSomeVC(_ sender: Any) {
        let vc = SomeFeature.init().otherSomeVC()
        show(vc, sender: nil)
    }
}

