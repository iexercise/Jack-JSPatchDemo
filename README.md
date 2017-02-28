# Jack-JSPatchDemo
Jack-JSPatchDemo
**具体聊一下注意事项**
- (官方)手动集成无法断点调试 JSPatch 核心源码，推荐使用 cocoapods 方式集成
- (官方)建议同时[接入扩展](http://jspatch.com/Docs/extensions)
- (个人)我自己采用的是拖包集成的,官方建议使用时cocoapods,添加依赖框架的时候要注意,其中*libz.dylib*这个依赖在xcode8.1添加是不存在的本人是直接在Demo的文件中copy的~[Demo地址](https://github.com/bang590/JSPatch/tree/master/Demo) bang神 的jspatch demo都在这里 集成很简单~
- (个人)如果不想使用官方的集成包,可以直接使用demo中的开源包,也就是下图这些,这样你可以看具体源码是怎么写的~
![开源包截图](http://upload-images.jianshu.io/upload_images/951690-22f97457a3afe4d8.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
****
- **接入**
*如果是使用的是官方或者拖官方包*
<code>#debug
[JSPatch setupDevelopment];
[JSPatch sync];
</code>
<code>#release
[JSPatch sync];
</code>
*setupDevelopment这个方法存在在开发者预览模式下发的情况下,所在app才会被下发补丁包,所以我把它写在debug环境下~sync是请求下发*
*如果你想使用本地的js补丁包应用在应用上,这时候你可以使用官方的testScriptInBundle 这个方法(但是注意:我在测试的时候发现这个方法无效,不知道是我的操作有问题还是什么问题~)*
<code>#debug
[JSPatch testScriptInBundle];
</code>
*当你也遇到上面和我一样的情况,这时候你可以考虑试试下面的这个方法,我估摸着这个方法就是testScriptInBundle的实现,这个方法是苹果官方JavaScriptCore运行本地js文件的方法*
<code>#debug
[JPEngine startEngine];
NSString *sourcePath = [[NSBundle mainBundle] pathForResource:@"main" ofType:@"js"];
NSString *script = [NSString stringWithContentsOfFile:sourcePath encoding:NSUTF8StringEncoding error:nil];
[JPEngine evaluateScript:script];
</code>
*如果你使用的是demo包也是采用上面的方法运行你本地的js补丁文件*
****
- **开发**
**开发注意的地方**
- 这里是JSPatch官方Wiki - [链接](https://github.com/bang590/JSPatch/wiki)
- 这里是JSPatch官方转化器 - [链接](http://bang590.github.io/JSPatchConvertor/)
- 注意如果你是新手你可以直接看wiki,因为wiki完全能够满足你的需求,并且配合转化器使用,但是注意转化器不是万能的,很多东西都不能转~所以你不能转化的都需要参考wiki来学习~

****
- **最后**
我把我的源码贴在这里你可以看一下如果喜欢的话可以点一下喜欢
