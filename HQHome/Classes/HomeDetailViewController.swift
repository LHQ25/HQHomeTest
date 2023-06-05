//
//  HomeDetailViewController.swift
//  HQHome
//
//  Created by 娄汉清 on 2023/6/4.
//

import UIKit

class HomeDetailViewController: UIViewController {
    
    var str: String?

    var callBack: ((String)->Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        title = str
        
        let button = UIButton(type: .custom)
        button.addTarget(self, action: #selector(buttonClick(_ :)), for: .touchUpInside)
        button.frame = CGRect(x: 100, y: 100, width: 100, height: 30)
        button.setTitle("回调", for: .normal)
        button.backgroundColor = .cyan
        view.addSubview(button)
    }

    @objc
    func buttonClick(_ sender: UIButton){
        print("执行 回调")
        if let callBack = callBack {
            callBack("Swift <-> 回调")
        }
    }
}
