####属性关键字
* strong、week的区别
	* strong、week在arc下针对对象的所有权，不能针对非对象；
	* strong强调指针是个强指针，持有对象的所有权。（如果有strong这个指针将持有对象的所有权）
	* week不持有对象的所有权。
* 什么时候应该持有对象的所有权？
* 什么时候使用week?
 * 我们在写委托的时候（避免循环引用），delgate一般用week指针来限定它
 * 在用storyboard搭建界面的时候，拖出来的控件都是用week声明的。（以button为例：控制器持有view,view持有button,如果view被动态移除了，控制器再持有button就没有意义了，所有控制器没有必须持有button的所有权（属性在控制器中，控制器拥有button的属性），交给view持有button的所有权即可）
 
* week与assign的区别
	* week只能修饰对象指针，assign可以修饰任意类型的指针
	* week指针指向对象如果被释放，week指针自动置为nil,assign不会自动置为nil
* 循环引用：
* copy关键字如何使用？
	* 使用block的时候，一般在方法或函数内使用block。block在站区分配内存，栈区的内存由操作系统管理，函数结束后就被释放掉。所以我们要先拷贝一份到堆区
	* NSString,NSArray,NSDictionary，因为它们存在对应的可变类型； 可变字符串 copy 将变为 不可变字符串。父类指针可以指向子类对象，我们不确定要指向（子类）是否为可变对象。而copy时，将会拷贝一份并持有；
* @property(copy)NSMutableArray *array;这个写法会有什么问题；
	* 首先要明白assain、atomic、readwrite默认就有 
	* copy最终得到都是一个不可变对象（可变、不可变->不可变）
	* mutablecopy最终得到是一个可变对象（可变、不可变->可变）
	* 所以这里用copy声明NSMutableArray，但其实得到是一个不可变的数组，不能对这个数组进行添加、删除操作；
	* atomic属于线程安全，会降低性能；在iOS开发中，一般用nonatomic就可以了
* self super
 ![](img/01.png)
	* self
	* super 当前
	* 这里涉及到运行时机制
     

* isKindOfClass与isMemberOfClass的区别？
	* 都是NSObject的比较Class的方法.（相同点）
	* isKindOfClass:确定一个对象是否是一个类的成员,或者是派生自该类的成员.
	* isMemberOfClass:确定一个对象是否是当前类的成员.