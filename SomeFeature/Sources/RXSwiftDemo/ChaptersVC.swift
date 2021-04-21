//
//  File.swift
//  
//
//  Created by CuiYingBo on 2/8/21.
//
//subject: Observable & Observer 即是可监听序列，也是观察者

import Foundation
import UIKit
import RxSwift
import RxCocoa
public class ChaptersVC:UIViewController{
    @IBOutlet var _pickerButton: UIButton!
    public override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    public static func instaniate() -> ChaptersVC{
        return UIStoryboard(name: "Main", bundle: .module).instantiateViewController(withIdentifier:  "ChaptersVC") as! ChaptersVC
    }
}

extension ChaptersVC{
    
    @IBAction func tapAbservable(_ sender: Any){
        ObserverObj().test()
    }
    @IBAction func tapBehaviorSubject(_ sender: Any){
        BehaviorSubjectObj().test()
    }
    @IBAction func tapDriver(_ sender: Any){
        self.show(DriverVC.instaniate(), sender: nil);
    }
}
extension ChaptersVC{
    func rxPickerButton(){
       
    }
}
