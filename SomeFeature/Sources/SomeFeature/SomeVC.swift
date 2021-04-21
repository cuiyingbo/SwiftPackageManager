//
//  File.swift
//  
//
//  Created by CuiYingBo on 2/2/21.
//

import Foundation
import UIKit
public class SomeVC:UIViewController{
    @IBAction
    func tapShowTxt() -> Void {
        guard let url = Bundle.module.url(forResource: "some", withExtension: "txt"),
              let data = try? Data(contentsOf: url) ,
              let string = String(data: data, encoding: .utf8) else {
            return
        }
        alert(message: string)
        Sort.insertSort()
        Sort.mergeSortList()
        Sort.quickSorter()
    }
    func alert(message:String) -> Void {
       let alert = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "确定", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
        
    }
    
  
}
public extension SomeVC {
    static func instantiate() -> SomeVC{
        let storyboard = UIStoryboard(name: "Main", bundle: .module)
        return storyboard.instantiateViewController(identifier: "SomeVC") as! SomeVC
    }
}
