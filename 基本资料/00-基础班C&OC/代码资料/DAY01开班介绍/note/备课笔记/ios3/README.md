# iOS开发体验3
##本小节知识点:
1. 【了解】打电话/发短信

---

##1.打电话
- 设置电话号码
```
    // 1.设定电话号码
    NSURL *url = [NSURL URLWithString:@"tel://110"];
```

- 拨号
```
    // 2.开始拨号(调用系统的拨号程序)
    [[UIApplication sharedApplication] openURL:url];
```

---
##2.发短信
- 设定电话号码
```
    // 1.设定电话号码
    NSURL *url = [NSURL URLWithString:@"sms://110"];
```

- 拨号
```
    // 2.开始拨号(调用系统的拨号程序)
    [[UIApplication sharedApplication] openURL:url];
```

---
