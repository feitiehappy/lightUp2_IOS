//
//  LUHttpTool.h
//  LightUp_2
//
//  Created by 伍锦文 on 16/5/17.
//  Copyright © 2016年 伍锦文. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <AFNetworking/AFNetworking.h>


/* 当request成功后的 responseBlock */
typedef void (^responseBlock)(id responseObj);
/* 请求失败的时候 */
typedef void (^requestFailureBlock)(NSError *error);
/* 请求成功 经过处理的有效block (子类写网络请求的时候用这个block) */
typedef void (^responseHandler)(id dataObj, NSError *error);



@interface LUHttpTool : NSObject

/**
 *  发送一个get请求
 *
 *  @param url            请求路径
 *  @param params         请求参数
 *  @param successHandler 请求成功后的回调
 *  @param failureHandler 请求失败后的回调
 */
+ (void)get:(NSString *)url params:(NSDictionary *)params success:(responseBlock)successHandler failure:(requestFailureBlock)failureHandler;

+ (void)post:(NSString *)url params:(NSDictionary *)params success:(responseBlock)successHandler failure:(requestFailureBlock)failureHandler;

//  post上传图片
+(void)uploadAvatarImgWithUrl:(NSString *)url WithImg:(UIImage *)avatarImg fileName:(NSString *)fileName success:(responseBlock)successHandler failure:(requestFailureBlock)failureHandler;

@end
