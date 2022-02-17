# Skywalker
### 导入包后需要在Target - General - Frameworks, Libraries and Embedded Content添加Skywalker与SkywalkerOC
## 关于这个包如何最方便最方便最方便给项目使用
####  给Swift项目使用

为了做到全局导入这个Module就在一个文件里
```Swift
@_exported import Skywalker
```

####  给Objective-C项目使用
为了做到全局导入这个Module可以创建PCH文件并在Build Settings - Apple Clang - Language设置PCH文件路径$(SRCROOT)/Target名称/PrefixHeader.pch然后在PCH文件中进行模块导入
```Objective-C
@import Skywalker;
@import SkywalkerOC;
```
无需开启Precompile Prefix Header开了反而有点慢

#### Xcode Swift Package Manager拉取慢可以使用Git Submodule将包作为子模块添加到项目中
第一步在Xcode项目文件夹内创建Packages文件夹(建议创建)
```shell
git submodule add https://github.com/GitHubyangjunyi/Skywalker.git ./Packages/Skywalker
git commit -am '添加子模块'
```
第二步提交添加子模块动作
```shell
git commit -am '添加子模块'
```
第三步如果需要更新子模块
```shell
git submodule update --remote
```
第四步如果克隆使用子模块的项目需要递归克隆或者不进行递归克隆后续手动拉取子模块
```shell
git clone <项目URL> --recurse-submodules
```
或者
```shell
git clone <项目URL>
git submodule update --remote

```
