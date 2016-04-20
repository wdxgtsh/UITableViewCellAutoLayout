//
//  MDPSubscribeModel.h
//  MDPSubscribeCell
//
//  Created by wdxgtsh on 16/4/20.
//  Copyright © 2016年 wdxgtsh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MDPSubscribeModel : NSObject


@property(nonatomic, assign) BOOL hasTag;

@property(nonatomic, assign) BOOL hasData;

@property(nonatomic, copy) NSString * title;

@property(nonatomic, copy) NSString * content;

@property(nonatomic, assign) BOOL hasPic;

@property(nonatomic, assign) NSInteger type;

@end
