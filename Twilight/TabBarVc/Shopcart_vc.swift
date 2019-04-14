//
//  Shopcart_vc.swift
//  Twilight
//
//  Created by Gckit on 2019/04/07.
//  Copyright (c) 2019 SeongBrave. All rights reserved.
//


import RxSwift
import UtilCore

class Shopcart_vc: Base_Vc {
    
    /****************************Storyboard UI设置区域****************************/
    @IBOutlet weak var test_btn: UIButton!
    
    /*----------------------------   自定义属性区域    ----------------------------*/
    
    
    /****************************Storyboard 绑定方法区域****************************/
    
    
    
    /**************************** 以下是方法区域 ****************************/
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    /**
     界面基础设置
     */
    override func setupUI() {
        
    }
    /**
     app 主题 设置
     */
    override func setViewTheme() {
        
    }
    /**
     绑定到viewmodel 设置
     */
    override func bindToViewModel() {
        self.test_btn
            .rx.tap
            .map({("homevc",nil)})
            .bind(to: self.view.rx_openUrl)
            .disposed(by: disposeBag)
    }
}
