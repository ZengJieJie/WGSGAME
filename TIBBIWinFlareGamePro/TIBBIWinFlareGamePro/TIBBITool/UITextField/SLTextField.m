//
//  JDTextField.m
//  Audio
//
//  Created by meiqijiacheng on 2019/10/23.
//  Copyright © 2019 chongling.liu. All rights reserved.
//

#import "SLTextField.h"

@implementation SLTextField

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self initializer];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self initializer];
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
}
/**
 *  初始化
 */
- (void)initializer
{
    self.delegate = self;
    //注册输入通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textfieldDidChange:) name:UITextFieldTextDidChangeNotification object:nil];
    self.letRightSpacing = 16.0;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
//    NSLog(@"-----开始编辑----");
//    
//    __weak typeof(self) weakSelf = self;
//    if (self.is_select_all && textField.text.length > 0){
//        //OC延时执行
//        dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2/*延迟执行时间*/ * NSEC_PER_SEC));
//        dispatch_after(delayTime, dispatch_get_main_queue(), ^{
//            [textField selectAll:weakSelf];
//        });
//    }
    if (_textFieldDidBeginEditingBlock){
        _textFieldDidBeginEditingBlock();
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    NSLog(@"结束编辑");
    if (_textFieldDidEndEditingBlock){
        _textFieldDidEndEditingBlock();
    }
}
/**
 *  text发生改变
 */
//- (void)textfieldDidChange:(NSNotification *)noti
//{
//    SLTextField *mo_textField = noti.object;
//        if (mo_textField == self) {
//            if (mo_textField != nil) {
//                if (self.max_number > 0) {
//                    double number = [mo_textField.text doubleValue];
//                    if (self.max_number < number) {
//                        NSRange range = {0,self.text.length-1};
//                        self.text = [mo_textField.text substringWithRange:range];
//                        return ;
//                    }
//                }
//                if (self.min_number != nil) {
//                    double number = [mo_textField.text doubleValue];
//                    if ([self.min_number doubleValue] > number) {
//                        NSRange range = {0,self.text.length-1};
//                        self.text = [mo_textField.text substringWithRange:range];
//                        return ;
//                    }
//                }
//        /**
//         *  禁止输入内容超出最大限制
//         */
//        if(self.max_char > 0 && mo_textField.text.length > self.max_char) {
//            NSRange range = {0,self.max_char}; //  从哪个位置开始截取，截取多长
//            mo_textField.text = [mo_textField.text substringWithRange:range];
//        }
//        /**
//         *  禁止超出X位数点
//         *///字条串是否包含有某字符串
//        if (!([mo_textField.text rangeOfString:@"."].location == NSNotFound) && self.max_numberPoint > 0 && self.max_numberPoint) {//包含某个字符
//            NSRange range = [mo_textField.text rangeOfString:@"."]; //  从哪个位置开始截取，截取多长
//            
//            if (mo_textField.text.length - range.location > self.max_numberPoint) {//超出小数点2位
//                mo_textField.text = [mo_textField.text substringWithRange:NSMakeRange(0, range.length + range.location+self.max_numberPoint)];//要裁剪
//            }
//            if(self.text.length - 1 - range.location){//小数点后面输入的内容
//                if([[self.text substringFromIndex:self.text.length-1] isEqualToString:@"."]){//裁剪小数点后面的小数点
//                   mo_textField.text  = [mo_textField.text substringToIndex:mo_textField.text.length - 1];
//                }
//            }
//        }
//             
//        /**
//         *  block返回输入内容
//         */
//        if (self.didChangeTextField) {
//            self.didChangeTextField(mo_textField);
//        }
//    }
//        }
//}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    self.str_newText = string;
    
    if ([string isEqualToString:@"\n"]){ //判断输入的字是否是回车，即按下return
        if (self.didActionDone){
            self.didActionDone(textField);
        }
        //在这里做你响应return键的代码
        return NO; //这里返回NO，就代表return键值失效，即页面上按下return，不会出现换行，如果为yes，则输入页面会换行
    }
    
    if (textField == self) {
        //这里的if时候为了获取删除操作,如果没有次if会造成当达到字数限制后删除键也不能使用的后果.
//        if ((range.length == 1 && string.length == 0) || [textField selectedRange].length == string.length) {
//            return YES;
//        }
        //so easy
//        else if (self.max_char > 0 && self.text.length >= self.max_char) {
//            self.text = [textField.text substringToIndex:self.max_char];
//            return NO;
//        }
        
    }
    if (self.mustInteger){
        return [self validateInteger:string];
    }
    if (self.mustNumber){
        return [self validateNumber:string];
    }
    
    
    return YES;

}
- (void)setMustNumber:(BOOL)mustNumber
{
    _mustNumber = mustNumber;
    
    self.keyboardType = UIKeyboardTypeDecimalPad;
}
- (void)setMustInteger:(BOOL)mustInteger
{
    _mustInteger = mustInteger;
    
    self.keyboardType = UIKeyboardTypeASCIICapableNumberPad;
}

- (BOOL)validateInteger:(NSString*)number {
    BOOL res = YES;
    NSCharacterSet* tmpSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    int i = 0;
    while (i < number.length) {
        NSString * string = [number substringWithRange:NSMakeRange(i, 1)];
        NSRange range = [string rangeOfCharacterFromSet:tmpSet];
        if (range.length == 0) {
            res = NO;
            break;
        }
        i++;
    }
    return res;
}
- (BOOL)validateNumber:(NSString*)number {
    BOOL res = YES;
    NSCharacterSet* tmpSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789."];
    int i = 0;
    while (i < number.length) {
        NSString * string = [number substringWithRange:NSMakeRange(i, 1)];
        NSRange range = [string rangeOfCharacterFromSet:tmpSet];
        if (range.length == 0) {
            res = NO;
            break;
        }
        i++;
    }
    return res;
}
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UITextFieldTextDidChangeNotification object:nil];
}

- (CGRect)leftViewRectForBounds:(CGRect)bounds {
    CGRect iconRect = [super leftViewRectForBounds:bounds];
    iconRect.origin.x += 8;

    return iconRect;
}

//UITextField 文字与输入框的距离
- (CGRect)textRectForBounds:(CGRect)bounds {
    return CGRectInset(bounds, self.leftView.bounds.size.width + self.letRightSpacing, 0);
}

//控制文本的位置
- (CGRect)editingRectForBounds:(CGRect)bounds {
    return CGRectInset(bounds, self.leftView.bounds.size.width + self.letRightSpacing, 0);
}


@end
