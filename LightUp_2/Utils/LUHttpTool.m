//
//  LUHttpTool.m
//  LightUp_2
//
//  Created by 伍锦文 on 16/5/17.
//  Copyright © 2016年 伍锦文. All rights reserved.
//

#import "LUHttpTool.h"

@implementation LUHttpTool

#pragma mark - get -
+ (void)get:(NSString *)url params:(NSDictionary *)params success:(responseBlock)successHandler failure:(requestFailureBlock)failureHandler {
    AFHTTPRequestOperationManager *mgr = [self getRequstManager];
    [mgr GET:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObj) {
        !successHandler?:successHandler(responseObj);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {!failureHandler?:failureHandler(error);}];
}

#pragma mark - post -
+ (void)post:(NSString *)url params:(NSDictionary *)params success:(responseBlock)successHandler failure:(requestFailureBlock)failureHandler {
    AFHTTPRequestOperationManager *mgr = [self getRequstManager];
    [mgr POST:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObj) {
        !successHandler?:successHandler(responseObj);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) { !failureHandler?:failureHandler(error);}];
}

#pragma mark - post 上传图片-
+(void)uploadAvatarImgWithUrl:(NSString *)url WithImg:(UIImage *)avatarImg fileName:(NSString *)fileName success:(responseBlock)successHandler failure:(requestFailureBlock)failureHandler {
    AFHTTPRequestOperationManager *mgr = [self getRequstManager];
    NSData *imgData = UIImageJPEGRepresentation(avatarImg, 0.5);
    
    [mgr POST:url parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        [formData appendPartWithFileData:imgData name:@"file" fileName:fileName mimeType:@"image/jpeg"];
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        !successHandler?:successHandler(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {!failureHandler?:failureHandler(error);}];
}

#pragma mark- AFHTTPRequestOperationManager初始化 网络超时设置 请求头
+(AFHTTPRequestOperationManager *)getRequstManager {
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    
    // 设置token
    // [mgr.requestSerializer setValue:@"" forHTTPHeaderField:@"access_token"];
    
    // 请求超时设定
    // mgr.requestSerializer.timeoutInterval = 20;
    return mgr;
}

@end
