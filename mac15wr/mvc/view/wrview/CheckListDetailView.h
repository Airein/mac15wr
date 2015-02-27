//
//  CheckListDetailView.h
//  mac15wr
//
//  Created by zwein on 2/25/15.
//  Copyright (c) 2015 mac15wr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CheckListModel.h"
@interface CheckListDetailView : UIView
{
    //根据model需求 创建所需控件
    UILabel*_label1;
    UILabel*_label2;
    
}

//下边方法可以自己实现 用于计算view高度 或者单元格高度

//+(CGFloat)getHeightByModel:(Model*)model;

@property(nonatomic,strong)CheckListModel *model;

@end
