# iOS开发体验4
##本小节知识点:
1. 【了解】全景看车
![](http://7xj0kx.com1.z0.glb.clouddn.com/Snip20150511_177.png)
---

##1.自定义动画
- 在界面上添加图片容器
    + ![](http://7xj0kx.com1.z0.glb.clouddn.com/Snip20150511_174.png)

- 通过代码关联图片容易, 以便于以后操作
    + ![](http://7xj0kx.com1.z0.glb.clouddn.com/Snip20150511_175.png)

- 定义容易保存所有图片(序列帧)
```
// 1.初始化所有图片
    self.images = [NSMutableArray array];
    for (int i = 1; i <= 36; i++) {
        NSString *imageName = [NSString stringWithFormat:@"img_360car_black_%02d", i];
        UIImage *image = [UIImage imageNamed:imageName];
        [self.images addObject:image];
    }
```
- 监听屏幕点击

```
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{

}
```

- 添加需要播放的动画帧
```
 // 1.设置动画图片
    self.imageContainer.animationImages = self.images;
```

- 设置动画属性
```
    // 2.播放动画
    // 2.1设置动画时长
    self.imageContainer.animationDuration = 8;
    // 2.2设置动画重复次数
    self.imageContainer.animationRepeatCount = 1;
```

- 播放动画
```
    // 2.3播放动画
    [self.imageContainer startAnimating];
```

---
