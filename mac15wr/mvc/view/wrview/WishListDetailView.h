//
//  WishListDetailView.h
//  mac15wr
//
//  Created by zwein on 2/24/15.
//  Copyright (c) 2015 mac15wr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WishListModel.h"
@interface WishListDetailView : UIView
{
}


@property(nonatomic,strong) UILabel *sectionIdLabel;
@property(nonatomic,strong) UILabel *sectionSeatsLabel;
@property(nonatomic,strong) UILabel *sectionProfessorLabel;


@property(nonatomic,strong) UIButton *deleteBtn;
@property(nonatomic,strong) UIButton *addToWLBtn;
@property(assign,nonatomic) BOOL isExpand;
@property(assign,nonatomic) WRRealmWishList *realmWishlist;
@end
