//
//  HomeController.swift
//  hq_home
//
//  Created by 娄汉清 on 2023/6/3.
//

import UIKit
import CTMediator

import HQSearchExtension
import HQNewsCategory

open class HomeController: UIViewController {
    
    
    var callBack: ((String)->Void)!

    open override func viewDidLoad() {
        super.viewDidLoad()

        
        let button = UIButton(type: .custom)
        button.addTarget(self, action: #selector(buttonClick(_ :)), for: .touchUpInside)
        button.frame = CGRect(x: 100, y: 100, width: 100, height: 30)
        button.setTitle("Home", for: .normal)
        button.backgroundColor = .black
        view.addSubview(button)
        
        let button1 = UIButton(type: .custom)
        button1.addTarget(self, action: #selector(button1Click(_ :)), for: .touchUpInside)
        button1.frame = CGRect(x: 100, y: 250, width: 100, height: 30)
        button1.setTitle("Swift Action", for: .normal)
        button1.backgroundColor = .cyan
        view.addSubview(button1)
        
        let button2 = UIButton(type: .custom)
        button2.addTarget(self, action: #selector(button2Click(_ :)), for: .touchUpInside)
        button2.frame = CGRect(x: 100, y: 400, width: 100, height: 30)
        button2.setTitle("OC Action", for: .normal)
        button2.backgroundColor = .cyan
        view.addSubview(button2)
        
        
        var homePath = Bundle.main.url(forResource: "HQHome", withExtension: "framework", subdirectory: "Frameworks")
        if let homeBundleUrl = homePath?.appendingPathComponent("HQHome").appendingPathExtension("bundle"),
            let homeBundle = Bundle(url: homeBundleUrl) {

            let scale: Int = Int(UIScreen.main.scale)
            let imgName = "boss_btn_close1@\(scale)x.png"

            let imageView = UIImageView(image: UIImage(contentsOfFile: (homeBundle.path(forResource: imgName, ofType: nil))!))
            imageView.backgroundColor = .black
            imageView.frame = CGRect(x: 10, y: 450, width: UIScreen.main.bounds.width - 20, height: 200)
            view.addSubview(imageView)
        }
        
//        let imageView = UIImageView(image: UIImage(named: "boss_title_sel"))
//        imageView.backgroundColor = .black
//        imageView.frame = CGRect(x: 10, y: 450, width: UIScreen.main.bounds.width - 20, height: 200)
//        view.addSubview(imageView)
        
        
        
        
        callBack = { str in
            button1.setTitle(str, for: .normal)
        }
    }
    
    @objc
    func buttonClick(_ sender: UIButton){
        let vc = HomeDetailViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc
    func button1Click(_ sender: UIButton){
        
        let vc = CTMediator.sharedInstance().searchDetailViewController(parames: ["title": "来自Home", "callBack": callBack!])
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc
    func button2Click(_ sender: UIButton){
        
        // 将closure类型转化为block类型
        let callbackBlock = callBack as @convention(block) (String) -> Void
        let callbackBlockObject = unsafeBitCast(callbackBlock, to: AnyObject.self)
        
        let vc = CTMediator.sharedInstance().newsDetailViewController(["title": "来自Home", "callBack": callbackBlockObject])
        navigationController?.pushViewController(vc, animated: true)
    }

}
