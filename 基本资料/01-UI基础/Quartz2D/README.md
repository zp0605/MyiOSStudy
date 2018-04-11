####第一天备课大纲

01-PPT介绍

	1.什么是Quartz2D?
		他是一个二维的绘图引擎,同时支持iOS和Mac系统
		
	2.Quartz2D能完成的工作
		画基本线条,绘制文字,图片,截图,自定义UIView.
		
	3.Quartz2D实例演示.
	
	4.Quartz2D在开发中的价值
	 	当我们的控件样式极其复杂时,可以把控件内部的结构给画出画,就是自定义控件.
	 	
	5.什么是图形上下文,上下文的类型有哪些?
		图形上下文是用来保存用户绘制的内容状态,并决定绘制到哪个地方的.
		用户把绘制好的内容先保存到图形上下文,
		然后根据选择的图形上下文的不同,绘制的内容显示到地方也不相同,即输出目标也不相同.
		
		图形上下文的类型有:
			Bitmap Graphics Context(位图上下文)
			PDF Graphics Context
			Window Graphics Context 
			Layer Graphics Context(图层上下文,自定义UIView取得上下文就是图层上下文.
			UIView之所以能够显示就是因为他内部有一个图层)
			Printer Graphics Context
			
	6.如何自定义UIView,步骤是什么?
		
		首先得要有上下文,有了上下文才能决定把绘制的东西显示到哪个地方去.
		其次就是这个上下文必须得和View相关联.才能将内容绘制到View上面.
		
		步骤:
		1.要先自定定UIView
		2.实现DrawRect方法
		3.在DrawRect方法中取得跟View相关联的上下文.
		4.绘制路径(描述路径长什么样).
		5.把描述好的路径保存到上下文(即:添加路径到上下文)
		6.把上下文的内容渲染到View


02-基本线条绘制
	
	1.DrawRect方法作用?什么时候调用.
		DrawRect作用:专用在这个方法当中绘图的.只有在这个方法当中才能取得跟View相关联的上下文.
		DrawRect是系统自己调用的, 它是当View显示的时候自动调用.
	
	2.画线(基本步骤描述)
		2.1获取跟View相关联的上下文
		 CGContextRef ctx = UIGraphicsGetCurrentContext();
		 
		2.2绘制路径
		UIBezierPath *path = [UIBezierPath bezierPath];
		
		2.2.1设置起点
	    [path moveToPoint:CGPointMake(10, 125)];
	    
	    2.2.2添加一根线到某个点
	    [path addLineToPoint:CGPointMake(200, 125)];
	    
		2.3把路径添加到上下文
		 CGContextAddPath(ctx,path.CGPath);
		 
		2.4把上下文的内容渲染到View上面.	
		 CGContextStrokePath(ctx);
	 	
	 3. 想要再添加一根线怎么办?
	 	第一种方法:重新设置起点,添加一根线到某个点,一个UIBezierPath路径上面可以有多条线.
	 	第二种方法:直接在原来的基础上添加线.把上一条的终点当做下一条线的起点.添加一根线到某个点
	 			  直接在下面addLineToPoint:
	 
	 4.怎么样设置线的宽度,颜色,样式?
	 	设置这些样式,我们称为是修改图形上下文的状态.
	 	设置线宽:CGContextSetLineWidth(ctx, 20);
	 	设置线段的连接样式: CGContextSetLineJoin(ctx, kCGLineJoinRound);
	 	添加顶角样式:CGContextSetLineCap(ctx, kCGLineCapRound);
	 	设置线的颜色: [[UIColor redColor] setStroke];
	 	
	 5.如何画曲线?
	 	
	 	画曲线方法比较特殊需要一个控制点来决定曲线的弯曲程度.画曲线方法为:
	 	先设置一个曲线的起点
	 	[path moveToPoint:CGPointMake(10, 125)];
	 	再添加到个点到曲线的终点.同时还须要一个controlPoint(控件点决定曲线弯曲的方法程序)
        [path addQuadCurveToPoint:CGPointMake(240, 125) controlPoint:CGPointMake(125, 10)];
        
     6.如何画矩形,圆角矩形?
     	
     	画矩形直接利用UIBezierPath给我们封装好的路径方法
     	(x,y)点决定了矩形左上角的点在哪个位置
     	(width,height)是矩形的宽度高度
     	bezierPathWithOvalInRect:CGRectMake(x, y, width, height)
     	
     	圆角矩形的画法多了一个参数,cornerRadius
     	cornerRadius它是矩形的圆角半径.
     	通过圆角矩形可以画一个圆.当矩形是正方形的时候,把圆角半径设为宽度的一半,就是一个圆.
     	bezierPathWithRoundedRect:CGRectMake(10, 100, 50, 50) cornerRadius:10
     	
     7.如果画椭圆,圆?
     	
     	画椭圆的方法为:
     	前两个参数分别代码圆的圆心,后面两个参数分别代表圆的宽度,与高度.
     	宽高都相等时,画的是一个正圆, 不相等时画的是一个椭圆
     	bezierPathWithOvalInRect:CGRectMake(10, 100, 50, 50)
     	
	 8.如何利用UIKit封装的上下文进行画图?
	 	直接来个:[path stroke]就可以了.
	 	它底层的实现,就是获取上下文,拼接路径,把路径添加到上下文,渲染到View
	 	
	 9.如何画圆弧?
	 	
	 	 首先要确定圆才能确定圆弧,圆孤它就圆上的一个角度嘛
	 	 
	 	 Center:圆心
         radius:圆的半径
         startAngle:起始角度
         endAngle:终点角度
         clockwise:Yes顺时针,No逆时针
     
         注意:startAngle角度的位置是从圆的最右侧为0度.
         
	 	 UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(125, 125)
	 	 									                  radius:100 
	 	 									                  startAngle:0 
	 	 									                  endAngle:M_PI * 2 
	 	 									                  clockwise:YES];
	 	 
	 	 
	 10.如果画扇形.
	 	画扇形的方法为:先画一个圆孤再添加一个一根线到圆心,然后关闭路径.
	 				 关闭路径就会自动从路径的终点到路径的起点封闭起下
	 	用填充的话,它会默认做一个封闭路径,从路径的终点到起点. 
	 	关闭路径,
	 	[path closePath];
	 	[path fill];
	 	
	 	
	
	
03-下载进条.
	
	1.搭建界面.
	
	2.拖动滑竿的时候让他里面的能够跟着我的拖动,数字在改变.
	  数字改变时有一个注意点, 就是要显示%,它是一个特殊的符号,要用两个%%代表一个%
	  
	3.拖动滑竿的时候就是在上面画弧.
	 从最上面,按顺时针画,所以,它的起始角度是-90度.结束角度也是-90度
     也是从起始角度开始画,
     起始角度-90度, 看你下载进度是多少
     假如说你下载进度是100,就是1 * 360度
     也就是说这个进度占你360度多少分之一
 
     CGContextRef ctx = UIGraphicsGetCurrentContext();
     CGPoint center = CGPointMake(50, 50);
     CGFloat radius = rect.size.width * 0.5;
     CGFloat startA = -M_PI_2;
     CGFloat endA = -M_PI_2 + M_PI * 2 * progress;
     
     UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center 
     											          radius:radius 
     											          startAngle:startA 
     											          endAngle:endA 
     											          clockwise:YES];
     
    要获得Progress的值,这个进度值没有, 所以要传进来才能画.弄一个成员变量
    要在值改变的时候就要传进来.
    要拿到ProgressView才能够传进来,所以要拖线,拿到ProgressView
    所有都做好的, 发现没有画圆孤?
    为什么?
    问题:drawRect方法总共调用多少次?
         总共就调用一次, 第一次Progress为0,以后都不会执行了
    解决:每次传的时候,就要画一次,
        重写Progress方法
     -(void)setProgress:(CGFloat)progress{
        _progress = progress;
        手动调用drawRect方法, 让它重新绘制
        [self setNeedsDisplay];
     }
     运行发现还是不画,为什么?
     原因:drawRect方法是不能手动调用,因为在drawRect方法中才能获取跟View相关联的上下文
         系统在调用DrawRect方法时,会自动帮你创建一个跟View相关联的上下文,并且传递给它.
        自己调用的,没有给drawRect方法传递上下文.所以在draw方法中拿不到上下文.
 
     解决办法:想要重绘,调用[self setNeedsDisplay];
            告诉系统重新绘制View,系统就会自动帮你调用drawRect方法,系统在调用
            drawRect方法,它会帮你创建上下文
	  

04-画饼图

	
        第一步, 获取上下文
        第二步,拼接路径 ,绘制第一个扇形
         获取上下文
         CGContextRef ctx =  UIGraphicsGetCurrentContext();
         CGPoint center = CGPointMake(125, 125);
         CGFloat radius = 100;
         CGFloat startA = 0;
         CGFloat endA = 0;
         CGFloat angle = 25 / 100.0 * M_PI * 2;
         endA = startA + angle;
         拼接路径
         UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center 
         										              radius:radius 
         										              startAngle:startA 
         										              endAngle:endA 
         										              clockwise:YES];
         添加一根线到圆心
         [path addLineToPoint:center];
         把路径添加到上下文
         CGContextAddPath(ctx, path.CGPath);
         把上下文渲染到View
         CGContextFillPath(ctx);
        
         注意点: CGFloat angle = 25 / 100.0 * M_PI * 2; 
                100.0一定要加一个.0

        绘制第二个扇形
        一样的, 把路径描述第二个扇形就好了
        直接来个path =
        让Path指针重新指向一个新的对象.也就是把指针重复利用了
        之前的那个对象已经用完了,已经添加到了上下文当中了.
 
         第二个扇形
         startA = endA;
         angle = 25 / 100.0 * M_PI * 2;
         endA = startA + angle;
         path = [UIBezierPath bezierPathWithArcCenter:center
         										 radius:radius 
         										 startAngle:startA 
         										 endAngle:endA 
         										 clockwise:YES];
         [path addLineToPoint:center];
         把二个路径添加到上下文
         CGContextAddPath(ctx, path.CGPath);
         把上下文渲染到View
         CGContextFillPath(ctx);
 
 
        添加第二个扇形之后, 发现它们的颜色都一样,想要修改它的颜色
        在下面再写一个
        [[UIColor greenColor] set];
        下面的一个颜色把之前的东西给覆盖了.
        解决办法, 让它渲染两次
 
        第三个扇形,把第二个拷贝一下就好了
 
 
        总结:
            有没有发现在画三个扇形用太多代码了,
            里面有很多代码相似.
            是不是可以把代码给抽一下
            可以用便利数组的的方式
            发现就两个地方变了, 一个数字变了, 一个颜色变了.
 
 
        抽取代码:
            假设他给一组数据
            NSArray datas =  @[@25,@25,@50];
            把数组便利出来
            
 
         NSArray *datas =  @[@25,@25,@50];
         
         CGPoint center = CGPointMake(125, 125);
         CGFloat radius = 100;
         CGFloat startA = 0;
         CGFloat angle = 0;
         CGFloat endA = 0;
         
         for (NSNumber *number in datas) {
         
         startA = endA;
         angle = number.intValue / 100.0 * M_PI * 2;
         endA = startA + angle;
         
         描述路径
         UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center 
         									  radius:radius
         									  startAngle:startA
         									  endAngle:endA
         									  clockwise:YES];
         
         [path addLineToPoint:center];
         [[self randomColor] set];
         [path fill];
         
         }

         - (UIColor *)randomColor{
         CGFloat r = arc4random_uniform(256)/ 255.0;
         CGFloat g = arc4random_uniform(256)/ 255.0;
         CGFloat b = arc4random_uniform(256)/ 255.0;
         return [UIColor colorWithRed:r green:g blue:b alpha:1];
         
         }
            
        随机颜色:alpha通道它的取值范围是0-255;
                OC里面的取值范围只能是0到1,把它 / 255.0就让它到这个范围了,
                arc4random_uniform(256)随机产生 0 - 255的数.
                颜色通道它的取值范围是0 到 255.
                所以说要把0 到 255转换成0 到 1
                直接是  0 ~ 255 / 255.0就可以了.
                刚好是255就是255 / 255.0 就是1,
                刚才是0 就是 0 / 255.0 就是0.
                
                
	
	
	 	

05-UIKit绘图演练
	
	一般使用UIKit给我们提供的绘图来绘制一些文字,图片这些东西.
	UIKit给我们提供画图的方法底层也是分为四步.所以也必须在drawRect方法当中去写.
	1.如何画文字?
		先创建好要画的文字
		使用UIKit提供的方法进行绘制.
		方法说明:
		drawAtPoint:要画到哪个位置
		withAttributes:文本的样式.
		[str drawAtPoint:CGPointZero withAttributes:nil];
		
	2.如何添加绘制文字属性?
		通过绘制方法的最后一个属性withAttributes来设置文字属性.
		它要求传入的是一个字典.它是通过字典的key和Value的形式来设置文字样式. 
		那传什么key,什么值我们可以在UIKit头文件当中的NSAttributedString类当中去找.
		使用形式如下:
		
		 创建一个可变的字典,设置key,value
		 NSMutableDictionary *dict = [NSMutableDictionary dictionary];
	     字体
	     dict[NSFontAttributeName] = [UIFont systemFontOfSize:50];
	     颜色
	     dict[NSForegroundColorAttributeName] = [UIColor redColor];
	     设置边框颜色
	     dict[NSStrokeColorAttributeName] = [UIColor redColor];
	     dict[NSStrokeWidthAttributeName] = @1;
	     阴影
	     NSShadow *shadow = [[NSShadow alloc] init];
	     shadow.shadowOffset = CGSizeMake(10, 10);
	     shadow.shadowColor = [UIColor greenColor];
	     shadow.shadowBlurRadius = 3;
	     dict[NSShadowAttributeName] = shadow;
	
	 3.drawAtPoint:和drawInRect:的区别?
	 	 drawAtPoint:不能够自动换行
	 	 drawInRect:能够自动换行
	 	 
	 4.如果绘制图片?
	 	绘制图片同样开始要先把图片素材导入.
	 	AtPoint:参数说明图片要绘制到哪个位置.
	 	通过调用UIKit的方法drawAtPoint:CGPointZero方法进行绘制;
	 	
	 5.在绘制图片过程当中.drawAtPoint:和drawInRect:两个方法的区别?
	 	drawAtPoint:绘制出来的图图片跟图片的实际尺寸一样大
	 	drawInRect:使用这个方法绘制出来的图片尺寸会和传入的rect区域一样大.
	 
	 6.如果进行平铺图片?
	 	[image drawAsPatternInRect:rect];
	 
	 7.如何选用UIKit提供的方法快速画一个矩形?
	    快速的用矩形去填充一个区域
	 	UIRectFill(rect);
	 	
	 8.如何利用UIKit裁剪一个区域?
	   UIRectClip(CGRectMake(0, 0, 50, 50));
	   这个方法必须要设置好裁剪区域,才能有裁剪
	   
	   
06-模仿系统的UIImageView

	整体思路:
	我们想要模仿系统的UIImageView,我们必须得要知道系统的UIView怎么用.
	系统的用法是创建一个UIImageView对象,设置frame,给它传递一个UIImage,再把它添加到一个View上面就可以了.
	可以切换图片.
	这是第一个用法.
	第二种用法,就是在创建的时候直接传递一个UIImage对象,使用initWithImage的方法进行创建一个UImageView的方式
	用这种做法创建出来的UIImageView它的尺寸大小和原始图片的尺寸大小一样大.
	所以我们自己的UIImageView也要具有这些功能.
	
	实现步骤:
	第一步:新建一个UIView,起名XMGImageView.
	第二步:给XMGImageView添加一个UIImage属性,供外界传递图片
	第三步:在DrawRect方法当中把传递的图片绘制到View上面
		  绘制方法为:[_image drawInRect:rect],绘制的图片尺寸大小和UIView的尺寸大小一样大.
	第四步:重写UIImage属性的set方法,在set方法当中让View重新绘制.目的为了能够办到切换图片.
	第五步:提供一个- (instancetype)initWithImage:(UIImage *)image方法.
		  在这个方法当中重写init方法
		  在初始化时,让View尺寸和图片的实际大小一样大.
		  然后再给UIImage属性赋值.
		  这样在绘制图片的时候,显示出来的View已经有尺寸了, 尺寸大小和图片的实际大小一样大.
		  
		    具体代码实现:
		    - (instancetype)initWithImage:(UIImage *)image{
		    if (self = [super init]) {
		        self.frame = CGRectMake(0, 0, image.size.width, image.size.height);
		        _image = image;
		    }
		    	return self;
			}

    
		   -(void)setImage:(UIImage *)image{
		  	  _image = image;
	         [self setNeedsDisplay];
		   }
		  
		   - (void)drawRect:(CGRect)rect {
			    [_image drawInRect:rect];
		   }

	
	
07-定时器,雪花

	1.定时器雪花整体思路:
		先在控制器View面绘制一个雪花.
		在View加载完毕后,添加一个定时器.
		在定时器方法当中调用得绘方法.
		在绘图方法当不段的去修改雪花的Y值.
		当雪花的Y值超过屏幕的高度时,让雪花的Y值重新设为0.从最顶部开始.
		
	2.添加定时器实现方案
		第一种采用NSTime
		第二种采用CADisplayLink
		最终采用CADisplayLink方案.
		
		2.1为什么采用CADisplayLink方案不用NSTime?
		
		   首先要了解setNeedsDisplay
		   setNeedsDisplay底层会调用DrawRect方法重绘.
		   但是它不是立马就进行重绘.它仅仅是设置了一个重绘标志,等到下一次屏幕刷新的时候才会调用DrawRect方法.
		   
		   如果使用NSTime的话,假设是0.01调用一次重绘.假设屏幕0.02秒的时候它才刷新一次.中间就会等0.01秒.
		   也就是每次都会等0.01秒这样累加上去.让变的越来越卡顿.
		   
		   使用CADisplayLink时,它的定时器方法就是屏幕每次刷新的时候就会调用(通常屏幕一秒钟刷新60次)
		   它和setNeedsDisplay调用DrawRect方法的时机正好吻合,不会出间等待间隔.不会出现屏幕卡顿现象.
		   
	    2.2如何使用CADisplayLink添加定时器?
	    	Target:哪个对象要监听方法.
	    	selector:监听的方法名称.
	    	CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self
	    							selector:@selector(setNeedsDisplay)];
	    	想要让CADisplayLink工作,必须得要把它添加到主运行循环.
	    	只要添加到主运行循环, 跟模式没有关系
	    	[link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
	  
	  3.具体实现代码如下:
	  
			 -(void)awakeFromNib{
			    CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self
			    					    selector:@selector(setNeedsDisplay)];
			    [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
		    
			  }
			  
						  
			 - (void)drawRect:(CGRect)rect {
			    if(_snowY > rect.size.height){
			        _snowY = 0;
			    }
			    UIImage *image = [UIImage imageNamed:@"雪花"];
			    [image drawAtPoint:CGPointMake(0, _snowY)];
			    _snowY += 10;
			 }
	    	
		   
	
		 
	  
		
		
	
08-图形上下文状态栈

	上下文状态栈为内存中的一块区域,它用来保存前上下文当的状态.
	我们获取的图层上下文当中其实两块区域,一个是存放添加的路径,一个是用来保存用户设置的状态,
	这些状态包括线条的颜色,线宽等.
	当我们把上下文的内容渲染到View上面的时候, 
	它会自动将设置的所有上下文状态运行到保存的路径上面显示到View上面.
	
	如果想要有多种状态,可以先把路径渲染到View上面,
	再从新添加路径.添加完路径之后,重新设置上下文的状态.
	再把新设置的上下文状态渲染到View上面.
	
	我们可以利用上下文状态栈的方式,在设置状态之前,把之前的状态保存到上下文状态栈里面.
	下一次想要再使用之前的状态时, 可以从上下文状态当中取出之前保存的上下文状态.
	
	1.如何把上下文状态保存到上下文状态栈?
	   CGContextSaveGState(ctx);
	2.如何从上下文状态栈中取出上下文状态?
	   CGContextRestoreGState(ctx);
	   
09-上下文的矩阵操作

	 上下文的矩阵操作其实就是修改上下文的形变,
	  主要有以下几种
	  平移
	  CGContextTranslateCTM(ctx, 100, 100);
	  旋转
	  CGContextRotateCTM(ctx, M_2_PI);
	  缩放
	  CGContextScaleCTM(ctx, 0.5, 0.5);
	  注意:上下文操作必须得要在添加路径之前去设置
	  
10.给图片添加水印.

	 给图片水印的目的:
	 告诉别人图片的来源.
	 防止别人盗用图片.打广告.
	 
	 添加水印它最终是生成了一个新的图片.
	 生成图片要用到了图片上下文.不需要再去自定义View,
	 之前一直在自定义View,是因为要拿跟View相关联的上下文.
	 跟View相关联的上下文是系统自动帮我们创建的,所以不需要我们自己手动创建,
	 但是图片上下文需要我们自己去手动创建.还需要我们自己手动去关闭.
	 
	 实现水印效果的思路:
	 开启一个和原始图片一样的图片上下文.
	 把原始图片先绘制到图片上下文.
	 再把要添加的水印(文字,logo)等绘制到图片上下文.
	 最后从上下文中取出一张图片.
	 关闭图片上下文.
	
	 1.如何开启一个图片上下文?
	     size:开启多大的上文
	     opaque:不透明度
	     scale:缩放上下文.
	     UIGraphicsBeginImageContextWithOptions(image.size, YES, 0);
	     
     2.如何从图片上下文当中生成一张图片?
     	UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
     
     3.如何关闭上下文?
     	UIGraphicsEndImageContext();
	
	   
 11-简单圆形图片裁剪
 
	裁剪图片思路.
    开启一个图片上下文.
    上下文的大小和原始图片保持一样.以免图片被拉伸缩放.
    在上下文的上面添加一个圆形裁剪区域.圆形裁剪区域的半径大小和图片的宽度一样大.
    把要裁剪的图片绘制到图片上下文当中.
    从上下文当中取出图片.
    关闭上下文.
    
    1.如何设置圆形路径?
    	 UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:
    	 					CGRectMake(0, 0, image.size.width, image.size.width)];
    
    	 					
    2.如何把一个路径设为裁剪区域?
    	[path addClip];
	 


01-带有边框的图片裁剪
	
	具体实现思路:
	1.假设边框宽度为BorderW
	2.开启的图片上下文的尺寸就应该是原始图片的宽高分别加上两倍的BorderW,这样开启的目的是为了不让原始图片变形.
	3.在上下文上面添加一个圆形填充路径.位置从0,0点开始,宽高和上下文尺寸一样大.设置颜色为要设置的边框颜色.
	4.继续在上下文上面添加一个圆形路径,这个路径为裁剪路径.
	  它的x,y分别从BorderW这个点开始.宽度和高度分别和原始图片的宽高一样大.
	  将绘制的这个路径设为裁剪区域.
	5.把原始路径绘制到上下文当中.绘制的位置和是裁剪区域的位置相同,x,y分别从border开始绘制.
	6.从上下文状态当中取出图片.
	7.关闭上下文状态.
	

02-截屏
	
	截屏效果实现具体思路为:把UIView的东西绘制图片上下文当中,生成一张新的图片.
	注意:UIView上的东西是不能直接画到上下文当中的.
		UIView之所以能够显示是因为内部的一个层(layer),所以我要把层上的东西渲染到UIView上面的.
		怎样把图层当中的内容渲染到上下文当中?
		
		直接调用layer的renderInContext:方法
		renderInContext:带有一个参数, 就是要把图层上的内容渲染到哪个上下文.
		
		截屏具体实现代码为:
		    1.开启一个图片上下文
    		UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, NO, 0);
		    获取当前的上下文.
		    CGContextRef ctx = UIGraphicsGetCurrentContext();
		    2.把控制器View的内容绘制上下文当中.
		    [self.view.layer renderInContext:ctx];
		    3.从上下文当中取出图片
		    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
		    4.关闭上下文.
		    UIGraphicsEndImageContext();
	
	
	
	
03-图片擦除

	图片擦除思路.
	弄两个不同的图片.上面一张, 下面一张.
	添加手势,手指在上面移动,擦除图片.
	擦除前要先确定好擦除区域.
	假设擦除区域的宽高分别为30.
	那点当前的擦除范围应该是通过当前的手指所在的点来确定擦除的范围,位置.
	那么当前擦除区域的x应该是等于当前手指的x减去擦除范围的一半,同样,y也是当前手指的y减去高度的一半.
	
	有了擦除区域,要让图片办到擦除的效果,首先要把图片绘制到图片上下文当中, 在图片上下文当中进行擦除.
	之后再生成一张新的图片,把新生成的这一张图片设置为上部的图片.那么就可以通过透明的效果,看到下部的图片了.
	
	第一个参数, 要擦除哪一个上下文
	第二人参数,要擦除的区域.
	CGContextClearRect(ctx, rect);
	
	具体实现代码为:
	
	确定擦除的范围
    CGFloat rectWH = 30;
    获取手指的当前点.curP
    CGPoint curP = [pan locationInView:pan.view];
    CGFloat x = curP.x - rectWH * 0.5;
    CGFloat y = curP.y - rectWH * 0.5;
    CGRect rect = CGRectMake(x, y,rectWH, rectWH);
    
    先把图片绘制到上下文.
    UIGraphicsBeginImageContextWithOptions(self.imageView.bounds.size, NO, 0);
    获取当前的上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    把上面一张图片绘制到上下文.
    [self.imageView.layer renderInContext:ctx];
    再绘上下文当中图片进行擦除.
    CGContextClearRect(ctx, rect);
    生成一张新图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    再把新的图片给重新负值
    self.imageView.image = newImage;
    关闭上下文.
    UIGraphicsEndImageContext();
    
    
04-图片截屏
	
	图片截屏实现思路.
	手指在屏幕上移动的时
	添加一个半透明的UIView,
	然后开启一个上下文把UIView的frame设置成裁剪区域.把图片显示的图片绘制到上下文当中,生成一张新的图片
	再把生成的图片再赋值给原来的UImageView.
	
	具体实现步骤:
	1.给图片添加一个手势,监听手指在图片上的拖动,添加手势时要注意,UIImageView默认是不接事件的.
	  要把它设置成能够接收事件
	2.监听手指的移动.手指移动的时候添加一个UIView，
	  x,y就是起始点,也就是当前手指开始的点.
	  width即是x轴的偏移量,
	  高度即是Y轴的偏移量.
	  UIView的尺寸位置为CGrect(x,y,witdth,height);
	  
	  计算代码为:
	  CGFloat offSetX = curP.x - self.beginP.x;
      CGFloat offsetY = curP.y - self.beginP.y;
      CGRect rect = CGRectMake(self.beginP.x, self.beginP.y, offSetX, offsetY);
      
      UIView之需要添加一次,所以给UIView设置成懒加载的形式,
      保证之有一个.每次移动的时候,只是修改UIView的frame.
      
    3.开启一个图片上下文,图片上下文的大小为原始图片的尺寸大小.使得整个屏幕都能够截屏.
      利用UIBezierPath设置一个矩形的裁剪区域.
      然后把这个路径设置为裁剪区域.
      把路径设为裁剪区域的方法为:
      [path addClip];
      
    4.把图片绘制到图片上下文当中
      由于是一个UIImageView上面的图片,所以也得需要渲染到上下文当中.
      要先获取当前的上下文,
      把UIImageView的layer渲染到当前的上下文当中.
      CGContextRef ctx = UIGraphicsGetCurrentContext();
      [self.imageV.layer renderInContext:ctx];
      
    5.取出新的图片,重新赋值图片.
      UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
      self.imageV.image = newImage;
      
    6.关闭上下文,移除上面半透明的UIView
      UIGraphicsEndImageContext();
      [self.coverView removeFromSuperview];
      
      
05-手势解锁

	分析界面,当手指在上面移动时,当移动到一个按钮范围内当中, 它会把按钮给成为选中的状态.
	并且把第一个选中的按钮当做一个线的起点,当手指移动到某个按钮上时,就会添加一根线到选中的那妞上.
	当手指松开时,所有按钮取消选中.所有的线都清空.
	
	实现思路:
		先判断点前手指在不在当前的按钮上.如果在按钮上,就把当前按钮成为选中状态.
		并且把当前选中的按钮添加到一个数组当中.如果当前按钮已经是选中状态,就不需要再添加到数组中了.
		每次移动时,都让它进行重绘.
		在绘图当中,遍历出所有的选中的按钮,
		判断数组当中的第一个无素,如果是第一个,那么就把它设为路径的起点.其它都在添加一根线到按钮的圆心.
		如果当前点不在按钮上.那么就记录住当前手指所在的点.直接从起点添加一根线到当前手指所在的点.
		
	
	实现步骤:
	1.搭建界面
	    界面是一个九宫格的布局.九宫格实现思路.
		先确定有多少列  cloum = 3;
		计算出每列之间的距离
		计算为: CGFloat margin = (当前View的宽度 - 列数 * 按钮的宽度) / 总列数 + 1
		每一列的X的值与它当前所在的行有关
		当前所在的列为:curColum = i % cloum
		每一行的Y的值与它当前所在的行有关.
		当前所在的行为:curRow = i / cloum
		
		每一个按钮的X值为, margin + 当前所在的列 * (按钮的宽度+ 每个按钮之间的间距)
		每一个按钮的Y值为 当前所在的行 * (按钮的宽度 + 每个按钮之间的距离)
		
		具体代码为:
		总列娄
    	int colum = 3;
    	每个按钮的宽高
    	CGFloat btnWH = 74;
    	每个按钮之间的距离
    	CGFloat margin = (self.bounds.size.width - colum * btnWH) / (colum + 1);
	    for(int i = 0; i < self.subviews.count; i++ ){
			当前所在的列
	        int curColum = i % colum;
	        当前所在的行
	        int curRow = i / colum;
	        CGFloat x = margin + (btnWH + margin) * curColum;
	        CGFloat y = (btnWH + margin) * curRow;
	        取出所有的子控件
	        UIButton *btn = self.subviews[i];
	        btn.frame = CGRectMake(x, y, btnWH, btnWH);
	    }
	    
	 2.监听手指在上面的点击,移动,松开都需要做操作.
	 	
	 	2.1在手指开始点击屏幕时,如果当前手指所在的点在按钮上, 那就让按钮成为选中状态.
			所以要遍历出所有的按钮,判断当前手指所在的点在不在按钮上,
			如何判断当前点在不在按钮上?
			当前方法就是判断一个点在不在某一个区域,如果在的话会返回Yes,不在的话,返回NO.
			CGRectContainsPoint(btn.frame, point)
	 	
			在手指点击屏幕的时候,要做的事分别有
			1.获取当前手指所在的点.
				UITouch *touch = [touches anyObject];
				CGPoint curP =  [touch locationInView:self];
			2.判断当前点在不在按钮上.
				 for (UIButton *btn in self.subviews) {
        			if (CGRectContainsPoint(btn.frame, point)) {
          				  return btn;
        			}
			     }
	   		3.如果当前点在按钮上,并且当前按钮不是选中的状态.
	   		  那么把当前的按钮成为选中状态.
	   		  并且把当前的按钮添加到数组当中.

	   	
	   	2.2 当手指在移动的时也需要判断.
			  判断当前点在按钮上,并且当前按钮不是选中的状态.
	   		  那么把当前的按钮成为选中状态.
	   		  并且把当前的按钮添加到数组当中.
			 在移动的时候做重绘的工作.
			 
	    2.3 当手指离开屏幕时.
	        取出所有的选中按钮,把所有选中按钮取消选中状态.
	        清空选中按钮的数组.
	        绘重绘的工作.
	        
	        
	 3. 在绘图方法当中.
	 	创建路径 
	 	遍历出有的选中按钮.如果是第一个按钮,把第一个按钮的中心点当做是路径的起点.
	 	其它按钮都直接添加一条线,到该按钮的中心.
	 	
	 	遍历完所有的选中按钮后.
	 	最后添加一条线到当前手指所在的点.
	 	
	 	
06-画板
	
	画板界面分析.
	顶部是一个工具栏.有清屏,撤销,橡皮擦,照片功能.最右部是一个保存按钮
	中间部分为画板区域
	最下部拖动滑竿能够改变画笔的粗线.可以选颜色.
	
	1.界面搭建
		最上部为一个ToolBar,往ToolBar拖些item,使用ToolBar的好处.里面按钮的位置不需要我们再去管理.
		给最上部的工具栏做自动布局.离父控件左,上,右都为0,保存工具条的高度不度
		
		拖一个UIView当前下部的View.在下部的View当中拖累三个按钮,设置每一个按钮的背景颜色.
		点击每一按钮时办到设置画笔的颜色.
		其中三个按钮只间的间距始终保存等,每一个按钮的宽度和高度都相等.通过自动布局的方式办到.
		
		先把这个UIView的自动布局设好, 让其左,右,下都是0,高度固定.
		
		自动布局设置为:第一个按钮高度固定,与左,右,下都保存20个间距.
		第二个按钮与第一个按钮,高度,宽度,centerY都相等.与右边有20个间距.
		第三个按钮也是第一个按钮的高度,宽度,centerY都相等.与右边有20个间距,最右边也保存20个间距.
		
		最后是中间的画板区域,画板区域只需要上距离上下左右都为0即可.
		
	2.实现画板功能.
	  
	  当手指移动的时候,在中间的画板区域当中进行绘制.由于每一个路径都有不同的状态.所以我们就不能用一条路径来做.
	  所以要弄一个数组记录住每一条路径.
	  实现画板功能.
	  1.监听手指在屏幕上的状态.在开始点击屏幕的时候,创建一个路径.并把手指当前的点设为路径的起点.
	  	
	    弄一个成员属性记录当前绘制的路径.并把当前的路径添加到路径数组当中.
	    
	  2.当手指在移动的时候,用当前的路径添加一根线到当前手指所在的点.然后进行重绘.
	  3.在绘图方法当中.取出所有的路径.把所有的路径给绘制出来.
	  
	3.设置路径属性.
		提供属性方法.
		
		清屏功能:删除所有路径进行重绘
		
		撤销功能:删除最后一条路径,进行重绘
		
		设置线宽:
				由于每一条线宽度都不样.所以要在开始创建路径的时,就要添加一个成员属性,设置一个默认值.
				在把当前路径添加到路径数组之前,设置好线的宽度.然后重写线宽属性方法.
				下一次再创建路径时,线的宽度就是当前设置的宽度.
		设置线的颜色:
				同样,由于每一条线的颜色也不一样.也需要记录住每一条路径的颜色.
				由于UIBezierPath没有给我们直接提供设置颜色的属性.我们可以自定义一个UIBezierPath.
				创建一个MyBezierPath类,继承UIBezierPath,在该类中添加一个颜色的属性.
				在创建路径的时候,直接使用自己定义的路径.设置路径默认的一个颜色.方法给设置线宽一样.
				在绘图过程中, 取出来的都是MyBezierPath,把MyBezierPath的颜色设置路径的颜色.
				
		橡皮擦功能:橡皮擦功能其实就是把路径的颜色设为白色.
		
		
	4.保存绘制的图片到相册.
		保存相册的思路:就是把绘制的在View上的内容生成一张图片,保存到系统相册当中.
		具体步骤:
		开启一个跟View相同大小的图片上下文.
		把View的layer上面内容渲染到上下文当中.
		生成一张图片,把图片保存到上下文.
		关闭上下文.
		如何把一张图片保存到上下文?
		调用方法:
		参数说明:
		第一个参数:要写入到相册的图片.
		第二个参数:哪个对象坚听写入完成时的状态.
		第三个参数:图片保存完成时调用的方法
		UIImageWriteToSavedPhotosAlbum(newImage,
		 									 self,
		 @selector(image:didFinishSavingWithError: contextInfo:),nil);
		注意:图片保存完成时调用的方法必须得是image:didFinishSavingWithError: contextInfo:
				
		
	 5.选择图片.
	 	点击图片时弹出系统的相册.
	 	如果弹出系统的相册?
	 	使用UIImagePickerController控件器Modal出它来.
	 	UIImagePickerController *pick = [[UIImagePickerController alloc] init];
	 	
	 	设置照片的来源
	  	pick.sourceType =  UIImagePickerControllerSourceTypeSavedPhotosAlbum;
	  	
	  	设置代码,监听选择图片,UIImagePickerController比较特殊,它需要遵守两个协议
	  	<UINavigationControllerDelegate,UIImagePickerControllerDelegate>
	  	pick.delegate = self;
	  	
	  	modal出控件器
	  	[self presentViewController:pick animated:YES completion:nil];
	  	
	  	注意没有实现代码方法时,选择一张照片会自动的dismiss掉相册控制器.但是设置代码后,就得要自己去dismiss了
	  	
	  	
	  	实现代理方法.
	  	选择的照片就在这个方法第二个参数当中, 它是一个字典
	  	-(void)imagePickerController:(nonnull UIImagePickerController *)picker
	  	 didFinishPickingMediaWithInfo:(nonnull NSDictionary<NSString *,id> *)info{
			
			获取当前选中的图片.通过UIImagePickerControllerOriginalImage就能获取.
			UIImage *image = info[UIImagePickerControllerOriginalImage];
		
		}
		
		获取完图片后.图片是能够缩放,平移的,因此获取完图片后,是在画板板View上面添加了一个UIView.
		只有UIView才能做平移,缩放,旋转等操作.
		因此做法为.在图片选择完毕后,添加一个和画板View相同大小的UIView,这个UIView内部有一个UIImageView.
		对这个UIImageView进行一些手势操作.操作完成时.长按图片,把View的内容截屏,生成一张图片.
		把新生成的图片绘制到画板上面.
		
	6.绘制图片.
		在画板View当中提供一个UImage属性,供外界传递.重写属性的set方法,每次传递图片时进行重绘
		画图片也有有序的,所以要把图片也添加到路径数组当中.
		在绘图片过过程当中,如果发现取出来的是一个图片类型.那就直接图片绘制到上下文当中.
		
		具体实现代码为:
		-(void)drawRect:(CGRect)rect{

		    for (DrawPath *path in self.pathArray) {
        
        		if ([path isKindOfClass:[UIImage class]]) {
            
         				UIImage *image = (UIImage *)path;
            			[image drawInRect:rect];

        			}else{
            			[path.lineColor set];
            			[path stroke];
        			}
        
    			}
    		}


		
		
		
		
	
	
	
	        
	    	
	   	
	   		
	   		
	   		
	   		
	   		
			   
			
		
		
	 

		
		
	
	    
	
   
      
	  
	
	
	

	
	
	
	
	

	
	
	
			
	
	
	
	
	
	
	
	
	
	
