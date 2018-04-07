# iOS开发体验2
##本小节知识点:
1. 【了解】过度动画
![](http://7xj0kx.com1.z0.glb.clouddn.com/Snip20150601_1.png)
---

##1.显示通知
- 监听界面触摸

```
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
}
```

- 编写过度动画

```
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // 1.创建过度动画
    CATransition *anima = [CATransition animation];
    // 2.设置动画类型
    anima.type = @"cube";
    anima.subtype = kCATransitionFromRight;
    // 3.设置动画时间
    anima.duration = 3;
    // 4.添加动画
    [self.view.layer addAnimation:anima forKey:nil];
}
 ```

---
