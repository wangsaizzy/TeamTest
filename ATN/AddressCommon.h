//
//  AddressCommon.h
//  ATN
//
//  Created by 王赛 on 16/4/7.
//  Copyright © 2016年 王赛. All rights reserved.
//

#ifndef AddressCommon_h
#define AddressCommon_h

#pragma mark -
#pragma mark - Default And System

#define RGB(r, g, b)    [UIColor colorWithRed:(r)/255.f green:(g)/255.f blue:(b)/255.f alpha:1.f]
#define ALLBLUECOLOR    [UIColor colorWithRed:(0)/255.f green:(171)/255.f blue:(235)/255.f alpha:1.f]
#define ALLBLACKCOLOR    [UIColor colorWithRed:(50)/255.f green:(45)/255.f blue:(45)/255.f alpha:1.f]
#define ALLGRAYCOLOR    [UIColor colorWithRed:(165)/255.f green:(164)/255.f blue:(160)/255.f alpha:1.f]
#define ALLBeiJingCOLOR    [UIColor colorWithRed:(244)/255.f green:(243)/255.f blue:(238)/255.f alpha:1.f]
#define ALLGreenCOLOR    [UIColor colorWithRed:(193)/255.f green:(217)/255.f blue:(105)/255.f alpha:1.f]
#define ALLOrangeCOLOR    [UIColor colorWithRed:(240)/255.f green:(131)/255.f blue:(0)/255.f alpha:1.f]
#define ALLFenSeCOLOR    [UIColor colorWithRed:(215)/255.f green:(0)/255.f blue:(52)/255.f alpha:1.f]
#define ALLLittleYellowCOLOR    [UIColor colorWithRed:(254)/255.f green:(242)/255.f blue:(210)/255.f alpha:1.f]




#define DefaultPageSize         10
#define DefaultPlatform         [NSNumber numberWithInt:1]
#define DefaultSystemVersion    [[UIDevice currentDevice]systemVersion]
#define DeviceHeight            [[UIScreen mainScreen] bounds].size.height
#define DeviceWidth             [[UIScreen mainScreen] bounds].size.width

#define AutoSizeScaleX          [[UIScreen mainScreen] bounds].size.width/320.0
#define AutoSizeScaleY          [[UIScreen mainScreen] bounds].size.height/568.0



#define Key_Division        @"Division"
#define Key_DivisionCode    @"DivisionCode"
#define Key_DivisionName    @"DivisionName"
#define Key_DivisionSub     @"DivisionSub"
#define Key_DivisionVersion @"DivisionVersion"
#define KDistrictSelectNotification     @"KDistrictSelectNotification"

#define KDistrictSelectDistrict         @"KDistrictSelectDistrict"





#define Key_DistrictSelectProvince          @"DistrictSelectProvince"
#define Key_DistrictSelectProvinceCode      @"DistrictSelectProvinceCode"
#define Key_DistrictSelectProvinceSubCode   @"DistrictSelectProvinceSubCode"
#define Key_DistrictSelectProvinceSub       @"DistrictSelectProvinceSub"
#define Key_DistrictSelectCityCode          @"DistrictSelectCityCode"


#define Error_Bad_Net @"您的操作无法完成,请在网络畅通网速良好的环境下重新操作"


#endif /* AddressCommon_h */
