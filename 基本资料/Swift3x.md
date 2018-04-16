
##### 遍历一个数组
---
````
for item in shoppingList {    print(item)}
````

#### @objc 关键字的使用
````

selector引用的方法必须对ObjC运行时是可见的。
而Swift是静态语言，虽然继承自NSObject的类默认对ObjC运行时是可见的，但如果方法是由private关键字修饰的，
则方法默认情况下对ObjC运行时并不是可见的，所以就导致：unrecognized selector

// MARK:- 事件处理
extension xxxController {
    //通过selector调用，需要加上@objc
    @objc func login() {
        LXFLog("登录")
        ....
    }
}

````

#### 懒加载写法 {}()

````
// 顶部的view
lazy var topView: LXFLoginTopView = {
    guard let topView = LXFLoginTopView.newInstance() else {
        return LXFLoginTopView()
    }
    topView.cancelBlock = { [unowned self] in
        self.dismiss(animated: true, completion: nil)
    }
    return topView
}()

//是因为在闭包里面用到了self,[unowned self]用来避免循环引用
//如果闭包里面没有self，可以不用[unowned self]
````

####extension与协议

````
//一般利用extension来实现协议与单击事件
extension XXXViewController: UITableViewDataSource, UITableViewDelegate {
    .....
}
````

#### ? 可选类型

````
  可以声明一个没有初始值的属性， Swift中引入了可选类型(Optional)来解决这一问题。
  它的定义是通过在类型生命后加加一个 ? 操作符完成的。
  
? 的使用场景: 
1.声明Optional值变量 
2.用在对Optional值操作中，用来判断是否能响应后面的操作 
3.使用 as? 向下转型(Downcast)

var a: String? 为nil 
var b: String
var c = b  // error ：因为没有初始化b，b没有值 

//如果变量是nil，则不能响应后面的方法，所以会直接返回nil
var arrayCount = dataList?.count
//ataList一定是非nil的，所以直接拆包取出原始值进行处理。因此此处如果不小心让dataList为nil，程序就会crash掉。
var arrayCount = dataList!.count


````

#### ！ 强制拆包

````

! 的使用场景：
1.强制对Optional值进行拆包(unwrap) 
2.声明隐式拆包变量，一般用于类中的属性
````

#### ？ ！ 总结：

````
问号？
a.声明时添加？，告诉编译器这个是Optional的，如果声明时没有手动初始化，就自动初始化为nil
b.在对变量值操作前添加？，判断如果变量时nil，则不响应后面的方法。

叹号！
a.声明时添加！，告诉编译器这个是Optional的，并且之后对该变量操作的时候，都隐式的在操作前添加！
b.在对变量操作前添加！，表示默认为非nil，直接解包进行处理
````

#### 参数前加 _ 
````
func someFunction(_ firstParameterName: Int, secondParameterName: Int) {  
     // 在函数体内，firstParameterName 和 secondParameterName 代表参数中的第一个和第二个参数值  
} 

//“_”是代表函数调用时，可以忽略参数名称。
````

####required 关键字
````
1,required修饰符只能用于修饰类初始化方法。
2,当子类含有异于父类的初始化方法时（初始化方法参数类型和数量异于父类），子类必须要实现父类的required初始化方法，并且也要使用required修饰符而不是override。
3,当子类没有初始化方法时，可以不用实现父类的required初始化方法。

required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
}
````

#### 单例写法

````
class LXFChatFindEmotion: NSObject {
    // MARK:- 单例
    static let shared: LXFChatFindEmotion = LXFChatFindEmotion()
    ....
}
````

