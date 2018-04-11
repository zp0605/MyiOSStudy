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
