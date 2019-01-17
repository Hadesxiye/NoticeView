//
//  XWC_WhzView.m
//  Winterfell
//
//  Created by 王浩祯 on 2019/1/16.
//

#import "NoticeView.h"

@implementation NoticeView
{
    UIView* super_view;
}
#define SuperWidth self.bounds.size.width
#define SuperHeight self.bounds.size.height
#define colorRGB(r, g, b)             [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:1.0]
+(instancetype)noticeViewInitTo:(UIView *)view{
    
    NoticeView* whz = [[self alloc]initWithView:view];

    return whz;
}

-(id)initWithView:(UIView *)view{
    NSAssert(view, @"whzView :View must not be nil!");
    super_view = view;
    return [self initWithFrame:super_view.bounds];
}
-(instancetype)initWithFrame:(CGRect)frame{
    if ((self = [super initWithFrame:frame])) {
        [self whzViewInit];
    }
    return self;
}
-(void)whzViewInit{
    UIView* backgroundView = [UIView new];
    backgroundView.frame = self.frame;
    backgroundView.backgroundColor = [UIColor clearColor];
    [self addSubview:backgroundView];
    
    UIView* showView = [UIView new];
    showView.frame = CGRectMake(SuperWidth/2 - 150, SuperHeight/2, 300, 0);
    showView.layer.cornerRadius = 5;
    showView.layer.masksToBounds = YES;
    showView.backgroundColor = colorRGB(99, 110, 114);
    showView.frame = CGRectMake(SuperWidth/2 - 150, SuperHeight/2 , 300, 0);
    _whzView = showView;
    [self addSubview:_whzView];
    
    UILabel* titleLab = [UILabel new];
    titleLab.frame = CGRectMake(20, _whzView.bounds.size.height/2, _whzView.bounds.size.width - 40, 0);
    titleLab.textAlignment = NSTextAlignmentCenter;
    titleLab.textColor = colorRGB(45, 52, 54);
    _titleLab = titleLab;
    [_whzView addSubview:_titleLab];
    
    UITextView* textView = [UITextView new];
    textView.editable = YES;
    textView.delegate = self;
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 6;
    NSDictionary *attributes = @{
                                 NSFontAttributeName:[UIFont systemFontOfSize:15],
                                 NSParagraphStyleAttributeName:paragraphStyle
                                 };
    textView.attributedText = [[NSAttributedString alloc] initWithString:textView.text attributes:attributes];
    textView.frame = CGRectMake(20, _whzView.bounds.size.height/2, _whzView.bounds.size.width - 40, 0);
    textView.backgroundColor = colorRGB(178, 190, 195);
    textView.textColor = colorRGB(45, 52, 54);
    textView.layer.cornerRadius = 2;
    textView.layer.masksToBounds = YES;
    _contextView = textView;
    [_whzView addSubview:_contextView];
    self->_whzView.alpha = 0.3;
    
    [self setModeUI];
    
}
-(void)setModeUI{
    
    if (_mode == noticeViewMode_OneButton) {
        UIButton* btn_one = [UIButton new];
        btn_one.frame = CGRectMake(20, _whzView.bounds.size.height/2, _whzView.bounds.size.width - 40, 0);
        btn_one.layer.cornerRadius = 4;
        btn_one.layer.masksToBounds = YES;
        btn_one.backgroundColor = colorRGB(45, 52, 54);
        [btn_one setTitleColor:colorRGB(178, 190, 195) forState:UIControlStateNormal];
        _button_one = btn_one;
        
        [_whzView addSubview:_button_one];
    }
    else if (_mode == noticeViewMode_TwoButton){
        UIButton* btn_one = [UIButton new];
        btn_one.frame = CGRectMake(20, _whzView.bounds.size.height/2, _whzView.bounds.size.width - 40, 0);
        btn_one.layer.cornerRadius = 4;
        btn_one.backgroundColor = colorRGB(45, 52, 54);
        [btn_one setTitleColor:colorRGB(178, 190, 195) forState:UIControlStateNormal];
        btn_one.layer.masksToBounds = YES;
        _button_one = btn_one;
        
        UIButton* btn_two = [UIButton new];
        btn_two.frame = CGRectMake(20, _whzView.bounds.size.height/2, _whzView.bounds.size.width - 40, 0);
        btn_two.layer.cornerRadius = 4;
        btn_two.layer.masksToBounds = YES;
        btn_two.backgroundColor = colorRGB(45, 52, 54);
        [btn_two setTitleColor:colorRGB(178, 190, 195) forState:UIControlStateNormal];
        _button_two = btn_two;
        
        [_whzView addSubview:_button_one];
        [_whzView addSubview:_button_two];
    }
    else{

    }
}
-(void)show{
    if (self) {
        [super_view addSubview:self];
        [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:0.6 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            if (self->_contextView_height == 0) {
                 self->_contextView_height = 100.0;
            }

            self->_titleLab.frame = CGRectMake(20, 20, self->_whzView.bounds.size.width - 40, 50);
            NSLog(@"%f",self->_contextView_height);
            self->_contextView.frame = CGRectMake(20, 80 , self->_whzView.bounds.size.width - 40, self->_contextView_height);
            
            self->_whzView.alpha = 1;
            
            if (self->_mode == noticeViewMode_NoneButton) {
                if (self->_whzView_width == 0) {
                    self->_whzView.frame = CGRectMake(SuperWidth/2 - 150, SuperHeight/2 - 50 - self->_contextView_height/2, 300, 110 + self->_contextView_height);
                }
                else{
                    self->_whzView.frame = CGRectMake(SuperWidth/2 - self->_whzView_width/2, SuperHeight/2 - 50 - self->_contextView_height/2, self->_whzView_width, 110 + self->_contextView_height);
                }
               
            }
            else if (self->_mode == noticeViewMode_OneButton){
                if (self->_whzView_width == 0) {
                    self->_whzView.frame = CGRectMake(SuperWidth/2 - 150, SuperHeight/2 - 65 - self->_contextView_height/2, 300, 140 + self->_contextView_height);
                }
                else{
                    self->_whzView.frame = CGRectMake(SuperWidth/2 - self->_whzView_width/2, SuperHeight/2 - 65 - self->_contextView_height/2, self->_whzView_width, 140 + self->_contextView_height);
                }
                self->_button_one.frame = CGRectMake(20, 90 + self->_contextView_height, self->_whzView.bounds.size.width - 40, 30);
                
                
            }
            else{
                if (self->_whzView_width == 0) {
                    self->_whzView.frame = CGRectMake(SuperWidth/2 - 150, SuperHeight/2 - 85 - self->_contextView_height/2, 300, 180 + self->_contextView_height);
                }
                else{
                    self->_whzView.frame = CGRectMake(SuperWidth/2 - self->_whzView_width/2, SuperHeight/2 - 85 - self->_contextView_height/2, self->_whzView_width, 180 + self->_contextView_height);
                }
                self->_button_one.frame = CGRectMake(20, 90 + self->_contextView_height, self->_whzView.bounds.size.width - 40, 30);
                self->_button_two.frame = CGRectMake(20, 130 + self->_contextView_height, self->_whzView.bounds.size.width - 40, 30);
            }
            
        } completion:nil];
    }
    else{
        NSLog(@"whzView: need be init!");
    }
}
-(void)hide{
    if (self) {
        [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:0.6 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            
            self->_titleLab.frame = CGRectMake(20, self->_whzView.bounds.size.height/2, self->_whzView.bounds.size.width - 40, 0);
            self->_contextView.frame = CGRectMake(20, self->_whzView.bounds.size.height/2, self->_whzView.bounds.size.width - 40, 0);
            self->_whzView.alpha = 0.3;
            if (self->_mode == noticeViewMode_NoneButton) {
                if (self->_whzView_width == 0) {
                    self->_whzView.frame = CGRectMake(SuperWidth/2 - 150, SuperHeight/2, 300, 0);
                }
                else{
                    self->_whzView.frame = CGRectMake(SuperWidth/2 - self->_whzView_width/2, SuperHeight/2, self->_whzView_width, 0);
                }
                
                
            }
            else if (self->_mode == noticeViewMode_OneButton){
                if (self->_whzView_width == 0) {
                    self->_whzView.frame = CGRectMake(SuperWidth/2 - 150, SuperHeight/2, 300, 0);
                }
                else{
                    self->_whzView.frame = CGRectMake(SuperWidth/2 - self->_whzView_width/2, SuperHeight/2, self->_whzView_width, 0);
                }
                self->_button_one.frame = CGRectMake(20, SuperHeight/2, self->_whzView.bounds.size.width - 40, 0);
                
            }
            else{
                if (self->_whzView_width == 0) {
                    self->_whzView.frame = CGRectMake(SuperWidth/2 - 150, SuperHeight/2, 300, 0);
                }
                else{
                    self->_whzView.frame = CGRectMake(SuperWidth/2 - self->_whzView_width/2, SuperHeight/2, self->_whzView_width, 0);
                }
                self->_button_one.frame = CGRectMake(20, SuperHeight/2, self->_whzView.bounds.size.width - 40, 0);
                self->_button_two.frame = CGRectMake(20, SuperHeight/2, self->_whzView.bounds.size.width - 40, 0);
            }
   
        } completion:^(BOOL finished) {
            if (finished) {
                [self removeFromSuperview];
            }
        }];
    }
    else{
        NSLog(@"whzView: need be init!");
    }
    
}
-(BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    return NO;
}
-(void)setWhzView_width:(double)whzView_width{
    if (whzView_width != _whzView_width) {
        _whzView.frame = CGRectMake(SuperWidth/2 - whzView_width/2, SuperHeight/2, whzView_width, 0);
        _whzView_width = whzView_width;
    }
}
-(void)setMode:(noticeViewMode)mode{
    if (mode != _mode) {
        _mode = mode;
        [self setModeUI];
    }
}
-(void)setButton_one:(UIButton *)button_one{
    if (button_one != _button_one) {
        if (_mode == noticeViewMode_NoneButton) {
            NSLog(@"whzView : mode = whzViewMode_NoneButton! can't set button");
            return;
        }
        _button_one = button_one;
    }
}
-(void)setButton_two:(UIButton *)button_two{
    if (button_two != _button_two) {
        if (_mode == noticeViewMode_TwoButton) {
            NSLog(@"whzView : mode = whzViewMode_NoneButton! can't set button_two");
            return;
        }
        if (_mode == noticeViewMode_OneButton) {
            NSLog(@"whzView : mode = whzViewMode_OneButton! can't set button_two");
            return;
        }
        _button_two = button_two;
    }
}
-(void)setContextView_height:(double)contextView_height{
    if (contextView_height != _contextView_height) {
        _contextView_height = contextView_height;
    }
}
@end
