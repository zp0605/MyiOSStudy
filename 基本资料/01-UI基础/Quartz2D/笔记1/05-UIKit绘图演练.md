
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
