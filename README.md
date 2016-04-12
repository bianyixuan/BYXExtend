# BYXExtend

> iOS项目开发前期目录结构整理，采用主目录按照模块划分，内目录按照业务分类，网络层AFN二次封装，采用Cocoapods进行第三方框架整合，使用[mock](http://rap.taobao.org/org/index.do)造接口，制作自己需要的数据结构。[完整项目Demo下载](https://github.com/bianyixuan/BYXExtend.git)

### 一、目录结构整理

采用主目录按照模块划分，内目录按照业务划分

![目录结构](http://ww3.sinaimg.cn/large/a9c94283jw1f2tpfnbw61j20aj0ei3zt.jpg)

以上分类不是绝对的，具体还需要按照业务需求来调整。或者课可以多观察身边大神搭建的项目，会吸取到其中的奥秘。当然，代码也可以多模仿大神写的代码，甚至模仿大神写代码风格，也许自己也会被膜拜！！！

目录中备注中文目录虽然low，但是确实是很有需要的，让代码一目了然，这事个人看法，当然非常有经验的工程师不会这么干。多写注释，就算你看不懂我的代码，也一定能知道这事干什么的。方便自己也方便别人，最后我想说，目录没有真正的好坏之分，只要适用于自己的业务，就是最好的目录。

### 二、网络层AFN的二次封装

##### BYXHttpTool.h类

网络请求工具类，负责整个项目的所有http请求，

![](http://ww3.sinaimg.cn/large/a9c94283jw1f2tpvlmy4hj20yx0fo7aw.jpg)

里面添加了一些私有方法，比如：设置网络超时时间，添加网络请求头信息。

![](http://ww1.sinaimg.cn/large/a9c94283jw1f2tpwfnjaej20lj05m0u6.jpg)

打印一些网络请求的url，返回的json数据，请求的参数等信息，用于开发调试。

![](http://ww2.sinaimg.cn/large/a9c94283jw1f2tpwqc3tpj214o09pdjt.jpg)


##### BYXServiceBaseTool.h类

该类是网络请求的业务基础类，该类的每个子类对应一个host主机

![](http://ww2.sinaimg.cn/large/a9c94283jw1f2tq53pe8hj213o0h7n53.jpg)

对网络请求到的数据通过MJExtension进行处理，方便子类使用。

![](http://ww1.sinaimg.cn/large/a9c94283jw1f2tq5k06qjj20wk0b7tc6.jpg)

网络监测，放在基础类，如果网络不通，可以自行进行处理

![](http://ww4.sinaimg.cn/large/a9c94283jw1f2tq5wnfvuj20to08zq63.jpg)

##### HttpServices.h 网络请求的最上层

该层继承自 ByxServiceBaseTool类，主要是设置请求的参数内容，请求的url，以及根据该方法的业务以及数据类型，设置请求的class，最终将处理好的数据返回给ViewController。

##### 最终ViewController使用

![](http://ww3.sinaimg.cn/large/a9c94283jw1f2tr1e5x57j20oi05lab0.jpg)


### 三、采用cocoapods

##### 什么是cocoapods

cocoapods是库管理工具。

##### cocoapods的用途

解决库之间的依赖关系。如前文所述: ***一个开源的项目可能是另一个项目的基础***, A依赖B, B依赖C和D, D又依赖EFG... 如果纯手工去处理这种依赖关系，会死人的！

##### cocoapods的优点

1. 免去手工处理依赖关系之苦
2. 集中管理应用的库
3. 易于更新这些库

##### 如何安装cocoapods

请参考：[cocoapods使用指南
](http://www.jianshu.com/p/7884ec8da77e)



### 四、mock不依靠服务端，客户端自己制造假数据来制作自己需要的模型

>RAP是一个可视化接口管理工具 通过分析接口结构，动态生成模拟数据，校验真实接口正确性， 围绕接口定义，通过一系列自动化工具提升我们的协作效率。

  [具体请看官网:](http://rap.taobao.org/org/index.do)



