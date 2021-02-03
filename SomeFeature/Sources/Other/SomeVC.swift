//
//  File.swift
//  
//
//  Created by CuiYingBo on 2/3/21.
//

import Foundation
import UIKit

public class SomeVC:UIViewController{
    
}
public extension SomeVC {
    static func instantiate() -> SomeVC{
        let storyboard = UIStoryboard(name: "Main", bundle: .module)
        return storyboard.instantiateViewController(identifier: "SomeVC") as! SomeVC
    }
}
