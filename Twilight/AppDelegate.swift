//
//  AppDelegate.swift
//  Twilight
//
//  Created by Gckit on 2019/04/07.
//  Copyright (c) 2019 SeongBrave. All rights reserved.
//

import UIKit
import UtilCore
import Carlisle
import Alice
import URLNavigator
import NetWorkCore
import Bella
import Jacob

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let navigator = Navigator()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        AppRouter.initialize(navigator: navigator)
        setCommonAppleance()
        configModule()
        setupRootViewController()
        // Override point for customization after application launch.
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

extension AppDelegate {
    
    /**
     设置导航等 的主题颜色
     */
    func setCommonAppleance(){
        
        UIApplication.shared.statusBarStyle = .lightContent
        let navigationBarAppearance = UINavigationBar.appearance()
        //设置显示的颜色
        navigationBarAppearance.barTintColor = UIColor.white
        navigationBarAppearance.tintColor = Theme.btn.normal
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black]

        let tabBarAppearance = UITabBar.appearance()
        tabBarAppearance.tintColor = Theme.btn.normal
        tabBarAppearance.barTintColor = UIColor.white
        tabBarAppearance.isOpaque = true
        
    }
    
    /*
     模块化基础配置
     */
    func configModule() {
        Envs.baseUrl = ["http://seongbrave.cn/api/v1/"]
        Envs.isDebug = true
        NetWorkCore.baseUrl = Envs.baseUrl
        Global.shared.updateUserFromService()
        //错误码为200010 表示回话过期
        UtilCore.sharedInstance.toLoginErrorCode = 200010;
    }
    
    func setupRootViewController() {
        self.window = UIWindow(frame: UIScreen.main.bounds);
        self.window!.backgroundColor=UIColor.white;
        setTabBarVc()
    }
    
    func setTabBarVc() {
        let tabbar0 = UITabBarItem(title: "首页", image:UIImage(named: "home_unselected") ,selectedImage:UIImage(named: "home_selected")?.withRenderingMode(.alwaysOriginal))
        tabbar0.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -2)
        let tabbar1 = UITabBarItem(title: "分类", image:UIImage(named: "category_unselected") ,selectedImage:UIImage(named: "category_selected")?.withRenderingMode(.alwaysOriginal))
        tabbar1.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -2)
        let tabbar2 = UITabBarItem(title: "发现", image:UIImage(named: "discovery_unselected") ,selectedImage:UIImage(named: "discovery_selected")?.withRenderingMode(.alwaysOriginal))
        tabbar2.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -2)
        let tabbar3 = UITabBarItem(title: "购物车", image:UIImage(named: "shopcart_unselected") ,selectedImage:UIImage(named: "shopcart_selected")?.withRenderingMode(.alwaysOriginal))
        tabbar3.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -2)
        let tabbar4 = UITabBarItem(title: "我的", image:UIImage(named: "me_unselected") ,selectedImage:UIImage(named: "me_selected")?.withRenderingMode(.alwaysOriginal))
        tabbar4.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -2)
        
        let homeVc = JacobCore.home_vc
        homeVc.title = "首页"
        let nav0 = Base_Nav(rootViewController: homeVc)
        nav0.tabBarItem = tabbar0
        
        let categoryVc = JacobCore.productVc
        categoryVc.title = "分类"
        let nav1 = Base_Nav(rootViewController: categoryVc)
        nav1.tabBarItem = tabbar1
        
        /*
         🥳 这块由于精力有限，其它模块其实和JacobCore(商品相关的)模块类似了，这块为了测试简单在主项目中完成其它模块的界面，正常情况下是主工程只负责配置，关联各个模块，没有任何业务相关的界面
         */
        let mainStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
        
        let discoveryVc = mainStoryboard.instantiateViewController(withIdentifier: "Discovery_vc")
        let nav2 = Base_Nav(rootViewController: discoveryVc)
        nav2.tabBarItem = tabbar2
        
        let shopCartVc = mainStoryboard.instantiateViewController(withIdentifier: "Shopcart_vc")
        let nav3 = Base_Nav(rootViewController: shopCartVc)
        nav3.tabBarItem = tabbar3
        
        let meVc = mainStoryboard.instantiateViewController(withIdentifier: "Me_vc")
        let nav4 = Base_Nav(rootViewController: meVc)
        nav4.tabBarItem = tabbar4
        
        let tabVc = UITabBarController()
        tabVc.viewControllers = [nav0,nav1,nav2,nav3,nav4]
        self.window?.rootViewController = tabVc
    }
}
