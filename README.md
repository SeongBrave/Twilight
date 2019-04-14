# Twilight

> 主工程模块,项目取自暮光之城名字
> 模块路由注册、主题等参数配置

## 模块说明

### 业务模块

| 模块          | 介绍               | 地址                                          |
| ------------- | ------------------ | --------------------------------------------- |
| Carlisle      | 登陆注册模块       | `https://github.com/SeongBrave/Carlisle.git`  |
| Bella         | 上下文模块         | `https://github.com/SeongBrave/Bella.git`     |
| Alice         | 项目配置模块       | `https://github.com/SeongBrave/Alice.git`     |
| Jacob         | 首页模块           | `https://github.com/SeongBrave/Jacob`         |
| Twilight      | 主工程项目         | `https://github.com/SeongBrave/Twilight.git`  |
| TwilightSpecs | CocoaPods 私有仓储 | `https://github.com/SeongBrave/TwilightSpecs` |

### 公用模块

| 模块          | 介绍                       | 地址                                          |
| ------------- | -------------------------- | --------------------------------------------- |
| UtilCore      | 基础工具库                 | `https://github.com/SeongBrave/UtilCore`      |
| NetWorkCore   | 网络工具库                 | `https://github.com/SeongBrave/NetWorkCore`   |
| EmptyDataView | 列表为空时自定义展示空界面 | `https://github.com/SeongBrave/EmptyDataView` |

## 路由注册

```Swift
public struct AppRouter {

    public static func initialize(navigator: NavigatorType) {
        UtilCoreNavigatorMap.initialize(navigator: navigator)
        Carlisle_router.initialize(navigator: navigator)
        Jacob_router.initialize(navigator: navigator)
    }
}
```
