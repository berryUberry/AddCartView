//
//  AddCartView.m
//  AddCartViewDemo
//
//  Created by 王凯 on 2017/1/12.
//  Copyright © 2017年 berryberry. All rights reserved.
//

#import "AddCartView.h"

@implementation AddCartView

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

-(UIView *)chooseView{
    if(!_chooseView){
        _chooseView = [UIView new];
        _chooseView.backgroundColor = [UIColor blueColor];
    }
    return _chooseView;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self setupViews];
    }
    return self;
}
-(void)setupViews{
    self.backgroundColor = [UIColor whiteColor];
}

-(void)play{
    
    self.chooseView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height*2/3);
    [UIView animateWithDuration:0.3 animations:^{
        self.layer.transform = [self firstAction];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3 animations:^{
            self.layer.transform = [self secondAction];
            self.chooseView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height/3, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height*2/3);
            [[UIApplication sharedApplication].windows[0] addSubview:self.chooseView];
        }];
    }];
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [UIView animateWithDuration:0.3 animations:^{
        self.layer.transform = [self firstAction];
        self.chooseView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height*2/3);
    } completion:^(BOOL finished) {
        [self.chooseView removeFromSuperview];
        [UIView animateWithDuration:0.3 animations:^{
            self.layer.transform = CATransform3DIdentity;
        }];
        
    }];
    
}

-(CATransform3D)firstAction{
    CATransform3D transform = CATransform3DIdentity;
    transform.m24 = -0.0005;
    transform = CATransform3DScale(transform, 0.9, 0.9, 1);
    return transform;
}

-(CATransform3D)secondAction{
    CATransform3D transform = CATransform3DIdentity;
    transform = CATransform3DTranslate(transform, 0, self.frame.size.height * (-0.08), 0);
    transform = CATransform3DScale(transform, 0.8, 0.8, 1);
    return transform;
}

@end

