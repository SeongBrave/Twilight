//
//  AppRouter.swift
//  Twilight
//
//  Created by Gckit on 2019/04/07.
//  Copyright (c) 2019 SeongBrave. All rights reserved.
//

import Foundation
import URLNavigator
import UtilCore
import Carlisle
import Jacob

public struct AppRouter {
    
    public static func initialize(navigator: NavigatorType) {
        UtilCoreNavigatorMap.initialize(navigator: navigator)
        Carlisle_router.initialize(navigator: navigator)
        Jacob_router.initialize(navigator: navigator)
    }
}
