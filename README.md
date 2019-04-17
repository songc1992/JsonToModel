# JsonToModel
基于 YYModel ,利用 macOS 程序将 JSON 字符串转化成 OC 的 Model 类。

# 使用步骤
- 将项目拉到本地
- 将 [iOS Categories](https://github.com/songc1992/JsonToModel/tree/master/JsonTransitionToModel/iOS%20Categories) 文件夹下的 `Category` 拖到 iOS 项目中。
- 在 `iOS` 项目添加并第一次请求新接口时，在返回请求结果的方法中，让需要转成 `Model` 的 `ResponseObject` 调用 `- (void)jsonStringToPasteboard;` 方法，调用这个方法，会自动将格式化的 JSON 字符串复制到系统粘贴板。
- 打开并运行此 JsonToModel 项目。
- 项目运行的 macOS 应用窗口打开以后，将系统粘贴板内容 Command + V 到左下角的输入框中，并根据需要填写 `Class Name`、`ProjectName`、`Author Name`，点击 `Generate Class File`，文件生成成功会弹框提示，点击 OK 自动打开生成路径。
- 把生成的 Model 文件拖到 iOS 项目中

# 注意事项
1. iOS 模拟器设置需要在 `Edit` 选项中勾选 `Automatically Sync Pasteboard` 选项，这样才能跟 macOS 共享粘贴板数据，如果是模拟器默认打开了该选项，仍然不能共享数据，需要手动取消勾选再选中
2. 可以拉取完此项目以后，先根据自己的情况修改一部分代码，比如把继承改为自己项目中 Model 的基类；添加默认的 Author Name 和 Project Name，不用每次都填写。