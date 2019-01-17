//
//  XWC_WhzView.h
//  Winterfell
//
//  Created by 王浩祯 on 2019/1/16.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NoticeView : UIView<UITextViewDelegate>
typedef NS_ENUM(NSInteger,noticeViewMode){
    noticeViewMode_OneButton,
    noticeViewMode_TwoButton,
    noticeViewMode_NoneButton,
};
@property(strong,nonatomic)UIView* whzView;
@property(assign,nonatomic)noticeViewMode mode;
@property(strong,nonatomic)UILabel* titleLab;
@property(strong,nonatomic)UITextView* contextView;
@property(strong,nonatomic)UIButton* button_one;
@property(strong,nonatomic)UIButton* button_two;
@property(assign,nonatomic)double whzView_width;
@property(assign,nonatomic)double contextView_height;
+(instancetype)noticeViewInitTo:(UIView *)view;
-(void)show;
-(void)hide;

@end

NS_ASSUME_NONNULL_END
