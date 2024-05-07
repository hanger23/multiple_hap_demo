# 单entry多feature

1. 要想在 entry 中启动 feature 的 ability,需要在Edit Configurations中 配置 entry 的 Deploy Multi Hap，
   勾选Deploy Multi Hap Packages，然后选择模块，具体见：
   使用模拟器进行调试
   https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V2/ide_debug_emulator-0000001115721921-V2
2. 要想 feature类型的hap 单独被ide运行安装，需要配置 "visible": true

### product 与  target

类似于android中的 productFlavors 与 flavorDimensions

1. 一个工程可以定义多个product，每个product对应一个定制的app应用包
2. 一个模块(entry或feature)可以定义多个target，每个target对应一个定制的HAP

#### 以 entry 为例：

1. 在 entry 的 build-profile.json5 的 targets 中，添加以下

```json5
 [
  {
    "name": "default",
    "runtimeOS": "HarmonyOS",
  },
  {
    "name": "free",
    "runtimeOS": "HarmonyOS",
  },
  {
    "name": "paid",
    "runtimeOS": "HarmonyOS",
  }
]

```

2. 在工程的 build-profile.json5 的 products 中添加以下

```json5
    [
  {
    "name": "default",
    "signingConfig": "default",
  },
  {
    "name": "free_product",
    "signingConfig": "default",
  },
  {
    "name": "paid_product",
    "signingConfig": "default"
  }
]
```

3. 在工程的 build-profile.json5 的 modules 的 entry 的 targets 中添加以下

```json5
    [
  {
    "name": "default",
    "applyToProducts": [
      "default",
    ]
  },
  {
    "name": "free",
    "applyToProducts": [
      "default",
      "free_product"
    ]
  },
  {
    "name": "paid",
    "applyToProducts": [
      "paid_product"
    ]
  }
]
```

4. 完成后 sync now 后,选择

![1.png](img%2F1.png)

![2.png](img%2F2.png)

![3.png](img%2F3.png)

![4.png](img%2F4.png)

#### 执行编译构建APP/HAP
##### ui点击打包
1. 单击菜单栏的Build > Build Hap(s)/APP(s) > Build APP(s) ，构建指定的Product对应的APP。
   输出路径：build/outputs/<product name>

2. 单击菜单栏的Build > Build Hap(s)/APP(s) > Build Hap(s)，构建指定Product下的所有Target对应发的HAP
   输出路径：entry/build/<product name>/outputs

3. 单击模块名,再单击Build > Make Module '模块名',可以构建这个模块下指定target的HAP
   输出路径：entry/build/<product name>/outputs

##### 命令行打包
###### 命令行打 hap 包

* 当 product 是 default，模块是 entry，target 是 free 时的 hap 包
```bash
./hvigorw clean assembleHap --no-daemon --mode module -p product=default -p module=entry@free -p debuggable=false
```
* 当 product 是 default，模块是 entry，target 是 default 时的 hap 包
```bash
./hvigorw clean assembleHap --no-daemon --mode module -p product=default -p module=entry@default -p debuggable=false
```
* 当 product 是 free_product，模块是 entry，target 是 free 时的 hap 包
```bash
./hvigorw clean assembleHap --no-daemon --mode module -p product=free_product -p module=entry@free -p debuggable=false
```
* 当 product 是 default，模块是 entry 时所有 hap 包
```bash
./hvigorw clean assembleHap --no-daemon --mode module -p product=default -p module=entry
```
* 当 product 是 default 时所有模块的所有 hap 包
```bash
./hvigorw clean assembleHap --no-daemon --mode module -p product=default
```

###### 命令行打 app 包
打 default 的 app 包
```bash
./hvigorw clean assembleApp --no-daemon --mode project -p product=default
```

打 free_product 的 app 包
```bash
./hvigorw clean assembleApp --no-daemon --mode project -p product=free_product
```

说明：( debuggable=false ：release模式)




## 资料

1. [定制多目标构建产物](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V2/customized-multi-targets-and-products-0000001430013853-V2)
2. [HAP唯一性校验逻辑](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V2/verification_rule-0000001406748378-V2)


## 目前未实现：
资源文件(颜色等)共享  （可能无法实现）





## 目前存在得问题，待研究
1. entry/build-profile.json5 中的 targets 的 source 源码集, 
   如果定义了 source，会显示不出页面，很奇怪
2. 关于 distroFilter 分发规则







