/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 Copyright (c) 2012, Janrain, Inc.

 All rights reserved.

 Redistribution and use in source and binary forms, with or without modification,
 are permitted provided that the following conditions are met:

 * Redistributions of source code must retain the above copyright notice, this
   list of conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation and/or
   other materials provided with the distribution.
 * Neither the name of the Janrain, Inc. nor the names of its
   contributors may be used to endorse or promote products derived from this
   software without specific prior written permission.


 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR
 ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
 ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */


#import "JROnipLevelOne.h"

@implementation JROnipLevelOne
{
    NSInteger _onipLevelOneId;
    NSString *_level;
    NSString *_name;
    JROnipLevelTwo *_onipLevelTwo;
}
@dynamic onipLevelOneId;
@dynamic level;
@dynamic name;
@dynamic onipLevelTwo;

- (NSInteger)onipLevelOneId
{
    return _onipLevelOneId;
}

- (void)setOnipLevelOneId:(NSInteger)newOnipLevelOneId
{
    [self.dirtyPropertySet addObject:@"onipLevelOneId"];
    _onipLevelOneId = newOnipLevelOneId;
}

- (NSString *)level
{
    return _level;
}

- (void)setLevel:(NSString *)newLevel
{
    [self.dirtyPropertySet addObject:@"level"];
    _level = [newLevel copy];
}

- (NSString *)name
{
    return _name;
}

- (void)setName:(NSString *)newName
{
    [self.dirtyPropertySet addObject:@"name"];
    _name = [newName copy];
}

- (JROnipLevelTwo *)onipLevelTwo
{
    return _onipLevelTwo;
}

- (void)setOnipLevelTwo:(JROnipLevelTwo *)newOnipLevelTwo
{
    [self.dirtyPropertySet addObject:@"onipLevelTwo"];
    _onipLevelTwo = [newOnipLevelTwo copy];
}

- (id)init
{
    if ((self = [super init]))
    {
        self.captureObjectPath = @"/onipLevelOne";
    }
    return self;
}

+ (id)onipLevelOne
{
    return [[[JROnipLevelOne alloc] init] autorelease];
}

- (id)copyWithZone:(NSZone*)zone
{ // TODO: SHOULD PROBABLY NOT REQUIRE REQUIRED FIELDS
    JROnipLevelOne *onipLevelOneCopy =
                [[JROnipLevelOne allocWithZone:zone] init];

    onipLevelOneCopy.onipLevelOneId = self.onipLevelOneId;
    onipLevelOneCopy.level = self.level;
    onipLevelOneCopy.name = self.name;
    onipLevelOneCopy.onipLevelTwo = self.onipLevelTwo;

    [onipLevelOneCopy.dirtyPropertySet removeAllObjects];
    [onipLevelOneCopy.dirtyPropertySet setSet:self.dirtyPropertySet];

    return onipLevelOneCopy;
}

- (NSDictionary*)toDictionary
{
    NSMutableDictionary *dict = 
        [NSMutableDictionary dictionaryWithCapacity:10];

    [dict setObject:[NSNumber numberWithInt:self.onipLevelOneId]
             forKey:@"id"];
    [dict setObject:(self.level ? self.level : [NSNull null])
             forKey:@"level"];
    [dict setObject:(self.name ? self.name : [NSNull null])
             forKey:@"name"];
    [dict setObject:(self.onipLevelTwo ? [self.onipLevelTwo toDictionary] : [NSNull null])
             forKey:@"onipLevelTwo"];

    return dict;
}

+ (id)onipLevelOneObjectFromDictionary:(NSDictionary*)dictionary
{
    JROnipLevelOne *onipLevelOne = [JROnipLevelOne onipLevelOne];

    onipLevelOne.onipLevelOneId =
        [dictionary objectForKey:@"id"] != [NSNull null] ? 
        [(NSNumber*)[dictionary objectForKey:@"id"] intValue] : 0;

    onipLevelOne.level =
        [dictionary objectForKey:@"level"] != [NSNull null] ? 
        [dictionary objectForKey:@"level"] : nil;

    onipLevelOne.name =
        [dictionary objectForKey:@"name"] != [NSNull null] ? 
        [dictionary objectForKey:@"name"] : nil;

    onipLevelOne.onipLevelTwo =
        [dictionary objectForKey:@"onipLevelTwo"] != [NSNull null] ? 
        [JROnipLevelTwo onipLevelTwoObjectFromDictionary:(NSDictionary*)[dictionary objectForKey:@"onipLevelTwo"]] : nil;

    [onipLevelOne.dirtyPropertySet removeAllObjects];
    
    return onipLevelOne;
}

- (void)updateFromDictionary:(NSDictionary*)dictionary
{
    if ([dictionary objectForKey:@"id"])
        _onipLevelOneId = [dictionary objectForKey:@"id"] != [NSNull null] ? 
            [(NSNumber*)[dictionary objectForKey:@"id"] intValue] : 0;

    if ([dictionary objectForKey:@"level"])
        _level = [dictionary objectForKey:@"level"] != [NSNull null] ? 
            [dictionary objectForKey:@"level"] : nil;

    if ([dictionary objectForKey:@"name"])
        _name = [dictionary objectForKey:@"name"] != [NSNull null] ? 
            [dictionary objectForKey:@"name"] : nil;

    if ([dictionary objectForKey:@"onipLevelTwo"])
        _onipLevelTwo = [dictionary objectForKey:@"onipLevelTwo"] != [NSNull null] ? 
            [JROnipLevelTwo onipLevelTwoObjectFromDictionary:(NSDictionary*)[dictionary objectForKey:@"onipLevelTwo"]] : nil;
}

- (void)replaceFromDictionary:(NSDictionary*)dictionary
{
    _onipLevelOneId =
        [dictionary objectForKey:@"id"] != [NSNull null] ? 
        [(NSNumber*)[dictionary objectForKey:@"id"] intValue] : 0;

    _level =
        [dictionary objectForKey:@"level"] != [NSNull null] ? 
        [dictionary objectForKey:@"level"] : nil;

    _name =
        [dictionary objectForKey:@"name"] != [NSNull null] ? 
        [dictionary objectForKey:@"name"] : nil;

    _onipLevelTwo =
        [dictionary objectForKey:@"onipLevelTwo"] != [NSNull null] ? 
        [JROnipLevelTwo onipLevelTwoObjectFromDictionary:(NSDictionary*)[dictionary objectForKey:@"onipLevelTwo"]] : nil;
}

- (NSDictionary *)toUpdateDictionary
{
    NSMutableDictionary *dict =
         [NSMutableDictionary dictionaryWithCapacity:10];

    if ([self.dirtyPropertySet containsObject:@"level"])
        [dict setObject:(self.level ? self.level : [NSNull null]) forKey:@"level"];

    if ([self.dirtyPropertySet containsObject:@"name"])
        [dict setObject:(self.name ? self.name : [NSNull null]) forKey:@"name"];

    if ([self.dirtyPropertySet containsObject:@"onipLevelTwo"])
        [dict setObject:(self.onipLevelTwo ? [self.onipLevelTwo toUpdateDictionary] : [NSNull null]) forKey:@"onipLevelTwo"];

    return dict;
}

- (void)updateObjectOnCaptureForDelegate:(id<JRCaptureObjectDelegate>)delegate withContext:(NSObject *)context
{
    NSDictionary *newContext = [NSDictionary dictionaryWithObjectsAndKeys:
                                                     self, @"captureObject",
                                                     delegate, @"delegate",
                                                     context, @"callerContext", nil];

    [JRCaptureInterface updateCaptureObject:[self toUpdateDictionary]
                                     withId:0
                                     atPath:self.captureObjectPath
                                  withToken:[JRCaptureData accessToken]
                                forDelegate:self
                                withContext:newContext];
}

- (NSDictionary *)toReplaceDictionary
{
    NSMutableDictionary *dict =
         [NSMutableDictionary dictionaryWithCapacity:10];

    [dict setObject:(self.level ? self.level : [NSNull null]) forKey:@"level"];
    [dict setObject:(self.name ? self.name : [NSNull null]) forKey:@"name"];
    [dict setObject:(self.onipLevelTwo ? [self.onipLevelTwo toReplaceDictionary] : [NSNull null]) forKey:@"onipLevelTwo"];

    return dict;
}

- (void)replaceObjectOnCaptureForDelegate:(id<JRCaptureObjectDelegate>)delegate withContext:(NSObject *)context
{
    NSDictionary *newContext = [NSDictionary dictionaryWithObjectsAndKeys:
                                                     self, @"captureObject",
                                                     delegate, @"delegate",
                                                     context, @"callerContext", nil];

    [JRCaptureInterface replaceCaptureObject:[self toReplaceDictionary]
                                      withId:0
                                      atPath:self.captureObjectPath
                                   withToken:[JRCaptureData accessToken]
                                 forDelegate:self
                                 withContext:newContext];
}

- (void)dealloc
{
    [_level release];
    [_name release];
    [_onipLevelTwo release];

    [super dealloc];
}
@end
