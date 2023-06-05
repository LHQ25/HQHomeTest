//
//  HomeController.swift
//  hq_home
//
//  Created by 娄汉清 on 2023/6/3.
//

import UIKit
//import CTMediator


class Target_HQHome: NSObject {
    
    /*
     Swift工程声明Target-Action的注意事项
        Target对象必须要继承自NSObject
        Action方法必须带@objc前缀
        Action方法第一个参数不能有Argument Label
     */
    @objc
    public func Action_HomeViewController(_ param: NSDictionary?) -> UIViewController {
        
        
        let vc = HomeController()
        return vc
    }
    
    @objc
    public func Action_HomeDetailViewController(_ param: NSDictionary?) -> UIViewController {
        
        
        var callBack: ((String)->Void)?
        if let actionParams = param {
            let block = actionParams["callBack"]

            // OC的block 转换一下 Closure(闭包)，否则不用转换，可以直接使用
            typealias CallbackType = @convention(block) (String) -> Void
            let blockPtr = UnsafeRawPointer(Unmanaged<AnyObject>.passUnretained(block as AnyObject).toOpaque())
            
            // 此时block就变成了closure，就可以正常调用了
            callBack = unsafeBitCast(blockPtr, to: CallbackType.self)
        }
        
        let vc = HomeDetailViewController()
        vc.str = param?["title"] as? String
        vc.callBack = callBack
        return vc
    }
    
    // 正确的Action声明
//    @objc func Action_viewController(_ params:[AnyHashable:Any]?) -> UIViewController {
//
//    }
    
    // MARK: - 例子
    // params 的类型也可以为NSDictionary，所以这么写也是可以的：
//    func Action_viewController(params:NSDictionary) -> UIViewController {
//
//    }
    
    // 错误的Action声明：没有带@objc前缀
//    func Action_viewController(_ params:[AnyHashable:Any]?) -> UIViewController {
//
//    }
    
    // 错误的Action声明：方法带上了Argument Label
//    func Action_viewController(viewControllerParams params:[AnyHashable:Any]?) -> UIViewController {
//
//    }
    
    // 错误的Action声明：方法带上了Argument Label
//    func Action_viewController(params:[AnyHashable:Any]?) -> UIViewController {
//
//    }
    
}

