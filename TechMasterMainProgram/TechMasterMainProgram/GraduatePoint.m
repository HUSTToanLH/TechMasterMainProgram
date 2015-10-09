//
//  GraduatePoint.m
//  TechMasterMainProgram
//
//  Created by ToanLH on 10/10/15.
//  Copyright © 2015 GiangNX. All rights reserved.
//

#import "GraduatePoint.h"

@interface GraduatePoint ()

@end

@implementation GraduatePoint{
    NSMutableArray *data;
    NSMutableArray *realData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createData];
    [self calculatorPoint];
}


-(void)createData{
    
    NSArray *stringData = @[@20143,	@"PH1120",	@"Vật lý đại cương II",	@3,	@"F",
//                            @20142,	@"IT3670",	@"Lập trình ứng dụng Tizen",	@3,	@"F",
                            @20142,	@"MI4010",	@"Lý thuyết Otomat và ngôn ngữ hình thức", @3,	@"D",
                            @20142,	@"MI5020",	@"An toàn máy tính",	@3,	@"C",
                            @20142,	@"MI5030",	@"Điều khiển tối ưu",	@3,	@"C",
                            @20142,	@"MI5070",	@"Xử lý tín hiệu số và ứng dụng",	@3,	@"C+",
                            @20141,	@"MI3060",	@"Cấu trúc dữ liệu và giải thuật	", @3,	@"C",
                            @20141,	@"MI4140",	@"Cơ sở dữ liệu nâng cao",	@3,	@"D",
                            @20141,	@"MI4150",	@"Lý thuyết nhận dạng",	@3,	@"D",
                            @20141,	@"MI4210",	@"Hệ hỗ trợ quyết định",	@3,	@"B",
                            @20141,	@"MI4362",	@"Tính toán song song",	@3,	@"C",
                            @20141,	@"MI4800",	@"Thực tập kỹ thuật",	@2,	@"A",
                            @20141,	@"MI5040",	@"Các mô hình ngẫu nhiên và ứng dụng",	@3,	@"D+",
                            @20141,	@"MI5050",	@"Đồ án III",	@3,	@"B+",
                            @20132,	@"MI3080",	@"Giải tích phức và ứng dụng",	@3,	@"C+",
                            @20132,	@"MI3310",	@"Kỹ thuật lập trình",	@2,	@"B",
                            @20132,	@"MI3390",	@"Đồ án II",	@3,	@"A",
                            @20132,	@"MI4010",	@"Lý thuyết Otomat và ngôn ngữ hình thức	",@3,	@"F",
                            @20132,	@"MI4030",	@"Mô hình toán kinh tế",	@3,	@"B",
                            @20132,	@"MI4110",	@"Mô phỏng ngẫu nhiên và ứng dụng",	@3,	@"C+",
                            @20132,	@"MI4160",	@"Lập trình tính toán",	@3,	@"D",
                            @20131,	@"MI3380",	@"Đồ án I",	@3,	@"B+",
                            @20131,	@"MI4050",	@"Chuỗi thời gian",	@3,	@"C",
                            @20131,	@"MI4060",	@"Hệ thống và mạng máy tính",       @3,	@"C+",
                            @20131,	@"MI4100",	@"Bảo mật dữ liệu và độ phức tạp thuật toán",	@3,	@"B",
                            @20131,	@"MI4331",	@"Xêmina I (Toán ứng dụng)",	@3,	@"C+",
                            @20131,	@"MI4341",	@"Một số phương pháp toán học trong tài chính",	@3,	@"C+",
                            @20123,	@"PH1120",	@"Vật lý đại cương II",	@3,	@"F",
                            @20122,	@"MI3060",	@"Cấu trúc dữ liệu và giải thuật	",@3,	@"F",
                            @20122,	@"MI3080",	@"Giải tích phức và ứng dụng	", @3,	@"F",
                            @20122,	@"MI3120",	@"Phân tích và thiết kế hệ thống	", @3,	@"A+",
                            @20122,	@"MI3380",	@"Đồ án I",	@3,	@"F",
                            @20122,	@"MI4010",	@"Lý thuyết Otomat và ngôn ngữ hình thức",	@3,	@"F",
                            @20122,	@"MI4160",	@"Lập trình tính toán",	@3,	@"F",
                            @20122,	@"PE2021",	@"Bóng đá II",	@0,	@"B",
                            @20121,	@"MI1110",	@"Giải tích I",	@4,	@"C",
                            @20121,	@"MI1140",	@"Đại số",	@4,	@"C",
                            @20121,	@"MI3050",	@"Các phương pháp tối ưu	",@4,	@"D",
                            @20121,	@"MI3070",	@"Phương trình đạo hàm riêng",	@3,	@"C",
                            @20121,	@"MI3090",	@"Cơ sở dữ liệu",	@3,	@"B",
                            @20121,	@"MI3370",	@"Hệ điều hành", 	@2,	@"C",
                            @20121,	@"MI4090",	@"Lập trình hướng đối tượng",	@3,	@"F",
                            @20113,	@"PH1120",	@"Vật lý đại cương II",	@3,	@"F",
                            @20112,	@"MI3030",	@"Xác suất thống kê",	@4,	@"D",
                            @20112,	@"MI3040",	@"Giải tích số",	 @4,	@"D+",
                            @20112,	@"MI3060",	@"Cấu trúc dữ liệu và giải thuật	",@3,	@"F",
                            @20112,	@"MI3310",	@"Kỹ thuật lập trình",	@2,	@"F",
                            @20112,	@"PE2011",	@"Bóng đá I",	@0,	@"C",
                            @20112,	@"SSH1130",	@"Đường lối CM của ĐCSVN	",@3,	@"C",
                            @20111,	@"IT1110",	@"Tin học đại cương",	@4,	@"C",
                            @20111,	@"MI1150",	@"Đại số đại cương", 	@3,	@"B+",
                            @20111,	@"MI2000",	@"Nhập môn Toán-Tin",	@3,	@"A",
                            @20111,	@"MI2060",	@"Cơ sở giải tích hàm",	@3,	@"C",
                            @20111,	@"MI3010",	@"Toán rời rạc",	@3,	@"A",
                            @20111,	@"MIL1130",	@"QS chung và KCT bắn súng AK",	@0,	@"D",
                            @20111,	@"PE1030",  @"Giáo dục thể chất C",	@0,	@"C",
                            @20111,	@"SSH1050",	@"Tư tưởng HCM", 	@2,	@"C",
                            @20102,	@"EM1010",	@"Quản trị học đại cương	", @2,	@"B",
                            @20102,	@"MI1120",	@"Giải tích II", 	@3,	@"B",
                            @20102,	@"MI1130",	@"Giải tích III",	@3,	@"D",
                            @20102,	@"MIL1110",	@"Đường lối quân sự",	@0,	@"B",
                            @20102,	@"PE1020",	@"Giáo dục thể chất B",	@0,	@"B",
                            @20102,	@"PH1120",	@"Vật lý đại cương II",	@3,	@"F",
                            @20102,	@"SSH1120",	@"Những NLCB của CNML II	", @3,	@"C+",
                            @20101,	@"MI1110",	@"Giải tích I",	@4,	@"D+",
                            @20101,	@"MI1140",	@"Đại số",	@4,	@"D",
                            @20101,	@"MIL1120",	@"Công tác quốc phòng-An ninh",	@0,	@"D",
                            @20101,	@"PE1010",	@"Giáo dục thể chất A",	@0,	@"C",
                            @20101,	@"PH1110",	@"Vật lý đại cương I",	@3,	@"D",
                            @20101,	@"SSH1110",	@"Những NLCB của CNML I",	@2,	@"D"];
    
    data = [[NSMutableArray alloc] initWithCapacity:stringData.count/5];
    for (int i = 0; i < stringData.count/5; i++) {
        NSMutableArray *subject = [[NSMutableArray alloc] initWithArray:@[stringData[i*5],stringData[i*5+1], stringData[i*5+2],stringData[i*5+3],stringData[i*5+4]]];
        [data addObject:subject];
    }
    
    realData = [NSMutableArray new];
    for (int i = 0; i < data.count; i++) {
        NSMutableArray *subject = data[i];
        for (int j = 0; j < data.count; j++) {
            if (j != i) {
                NSMutableArray *compareSubject = data[j];
                if ([subject[1] isEqualToString:compareSubject[1]]) {
                    if (subject[3] >= compareSubject[3]) {
                        [compareSubject replaceObjectAtIndex:3 withObject:@0];
                    }
                    else{
                        [subject replaceObjectAtIndex:3 withObject:@0];
                    }
                }
            }
        }
    }
    
    for (int i = 0; i < data.count; i++) {
        NSMutableArray *subject = data[i];
        if (![[subject objectAtIndex:3] isEqual:@0]) {
            [realData addObject:subject];
        }
    }
}

-(void)calculatorPoint{
    float sumCredit = 0;
    float sumPoint = 0;
    
    for (int i = 0; i < realData.count; i++) {
        NSArray *subject = realData[i];
        sumCredit += (int)subject[3];
        sumPoint += (int)subject[3] * [self numberOfChar:subject[4]];
    }
    
    NSLog(@"CPA: %f", (float)sumPoint/sumCredit);
}

-(float)numberOfChar:(NSString*)charPoint{
    if ([charPoint isEqualToString:@"A+"]) {
        return 4.0;
    }
    else if ([charPoint isEqualToString:@"A"]) {
        return 4.0;
    }
    else if ([charPoint isEqualToString:@"B+"]) {
        return 3.5;
    }
    else if ([charPoint isEqualToString:@"B"]) {
        return 3.0;
    }
    else if ([charPoint isEqualToString:@"C+"]) {
        return 2.5;
    }
    else if ([charPoint isEqualToString:@"C"]) {
        return 2.0;
    }
    else if ([charPoint isEqualToString:@"D+"]) {
        return 1.5;
    }
    else if ([charPoint isEqualToString:@"D"]) {
        return 1.0;
    }
    else if ([charPoint isEqualToString:@"F"]) {
        return 0.0;
    }
    else{
        return 0.0;
    }
}

@end
