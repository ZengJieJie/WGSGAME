//
//  JDTextField.h
//  Audio
//
//  Created by meiqijiacheng on 2019/10/23.
//  Copyright © 2019 chongling.liu. All rights reserved.
//  为了解决输入框和leftView靠太近的问题

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^ChangeTextField)(UITextField *textField);

@interface SLTextField : UITextField<UITextFieldDelegate>

/**
 *  文字最大个数
 */
@property (nonatomic,assign) int max_char;
/**
 *  输入信息回调
 */
@property (nonatomic,copy) ChangeTextField didChangeTextField;
/**
 *  点击搜索或者点击完成
 */
@property (nonatomic,copy) ChangeTextField didActionDone;

/**
 *  开始编辑
 */
@property (nonatomic,copy) void(^textFieldDidBeginEditingBlock)(void);
/**
 *  结束编辑
 */
@property (nonatomic,copy) void(^textFieldDidEndEditingBlock)(void);

/**
 *  是否弹出键盘时全选文字
 */
@property (nonatomic,assign) BOOL is_select_all;
/**
 *  最多小数点位数
 */
@property (nonatomic,assign) int max_numberPoint;
/**
 *  最大数量
 */
@property (nonatomic,assign) double max_number;
/**
 *  最小数量
 */
@property (nonatomic,copy) NSNumber *min_number;
/**
 *  必须只能输入数字
 */
@property (nonatomic,assign) BOOL mustNumber;
/**
 *  必须只能输入整数
 */
@property (nonatomic,assign) BOOL mustInteger;
/**
 *  每次输入的字符
 */
@property (nonatomic,copy) NSString *str_newText;
/**
 *  左右间距, 默认是16
 */
@property (nonatomic,assign) CGFloat letRightSpacing;


@end

NS_ASSUME_NONNULL_END
