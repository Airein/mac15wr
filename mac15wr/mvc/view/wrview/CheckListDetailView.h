//
//  CheckListDetailView.h
//  mac15wr
//
//  Created by zwein on 2/25/15.
//  Copyright (c) 2015 mac15wr. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CheckListDetailView : UIView
{
    
    
}



@property(nonatomic,strong) UILabel *sectionIdLabel;
@property(nonatomic,strong) UILabel *sectionSeatsLabel;
@property(nonatomic,strong) UILabel *sectionProfessorLabel;


@property(nonatomic,strong) UIButton *deleteBtn;
@property(nonatomic,strong) UIButton *addToWLBtn;
@property(assign,nonatomic) BOOL isExpand;

@property(assign,nonatomic) WRRealmCheckList *realmChecklist;

@end
