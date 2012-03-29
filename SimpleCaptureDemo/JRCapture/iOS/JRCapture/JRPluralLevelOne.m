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


#import "JRPluralLevelOne.h"

@interface NSArray (PluralLevelTwoToFromDictionary)
- (NSArray*)arrayOfPluralLevelTwoObjectsFromPluralLevelTwoDictionaries;
- (NSArray*)arrayOfPluralLevelTwoDictionariesFromPluralLevelTwoObjects;
- (NSArray*)arrayOfPluralLevelTwoUpdateDictionariesFromPluralLevelTwoObjects;
- (NSArray*)arrayOfPluralLevelTwoReplaceDictionariesFromPluralLevelTwoObjects;
@end

@implementation NSArray (PluralLevelTwoToFromDictionary)
- (NSArray*)arrayOfPluralLevelTwoObjectsFromPluralLevelTwoDictionaries
{
    NSMutableArray *filteredPluralLevelTwoArray = [NSMutableArray arrayWithCapacity:[self count]];
    for (NSObject *dictionary in self)
        if ([dictionary isKindOfClass:[NSDictionary class]])
            [filteredPluralLevelTwoArray addObject:[JRPluralLevelTwo pluralLevelTwoObjectFromDictionary:(NSDictionary*)dictionary]];

    return filteredPluralLevelTwoArray;
}

- (NSArray*)arrayOfPluralLevelTwoDictionariesFromPluralLevelTwoObjects
{
    NSMutableArray *filteredDictionaryArray = [NSMutableArray arrayWithCapacity:[self count]];
    for (NSObject *object in self)
        if ([object isKindOfClass:[JRPluralLevelTwo class]])
            [filteredDictionaryArray addObject:[(JRPluralLevelTwo*)object toDictionary]];

    return filteredDictionaryArray;
}

- (NSArray*)arrayOfPluralLevelTwoUpdateDictionariesFromPluralLevelTwoObjects
{
    NSMutableArray *filteredDictionaryArray = [NSMutableArray arrayWithCapacity:[self count]];
    for (NSObject *object in self)
        if ([object isKindOfClass:[JRPluralLevelTwo class]])
            [filteredDictionaryArray addObject:[(JRPluralLevelTwo*)object toUpdateDictionary]];

    return filteredDictionaryArray;
}

- (NSArray*)arrayOfPluralLevelTwoReplaceDictionariesFromPluralLevelTwoObjects
{
    NSMutableArray *filteredDictionaryArray = [NSMutableArray arrayWithCapacity:[self count]];
    for (NSObject *object in self)
        if ([object isKindOfClass:[JRPluralLevelTwo class]])
            [filteredDictionaryArray addObject:[(JRPluralLevelTwo*)object toReplaceDictionary]];

    return filteredDictionaryArray;
}
@end

@implementation JRPluralLevelOne
{
    NSInteger _pluralLevelOneId;
    NSString *_level;
    NSString *_name;
    NSArray *_pluralLevelTwo;
}
@dynamic pluralLevelOneId;
@dynamic level;
@dynamic name;
@dynamic pluralLevelTwo;

- (NSInteger)pluralLevelOneId
{
    return _pluralLevelOneId;
}

- (void)setPluralLevelOneId:(NSInteger)newPluralLevelOneId
{
    [self.dirtyPropertySet addObject:@"pluralLevelOneId"];
    _pluralLevelOneId = newPluralLevelOneId;
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

- (NSArray *)pluralLevelTwo
{
    return _pluralLevelTwo;
}

- (void)setPluralLevelTwo:(NSArray *)newPluralLevelTwo
{
    [self.dirtyPropertySet addObject:@"pluralLevelTwo"];
    _pluralLevelTwo = [newPluralLevelTwo copy];
}

- (id)init
{
    if ((self = [super init]))
    {
        self.captureObjectPath = @"/pluralLevelOne";
    }
    return self;
}

+ (id)pluralLevelOne
{
    return [[[JRPluralLevelOne alloc] init] autorelease];
}

- (id)copyWithZone:(NSZone*)zone
{ // TODO: SHOULD PROBABLY NOT REQUIRE REQUIRED FIELDS
    JRPluralLevelOne *pluralLevelOneCopy =
                [[JRPluralLevelOne allocWithZone:zone] init];

    pluralLevelOneCopy.pluralLevelOneId = self.pluralLevelOneId;
    pluralLevelOneCopy.level = self.level;
    pluralLevelOneCopy.name = self.name;
    pluralLevelOneCopy.pluralLevelTwo = self.pluralLevelTwo;

    [pluralLevelOneCopy.dirtyPropertySet removeAllObjects];
    [pluralLevelOneCopy.dirtyPropertySet setSet:self.dirtyPropertySet];

    return pluralLevelOneCopy;
}

- (NSDictionary*)toDictionary
{
    NSMutableDictionary *dict = 
        [NSMutableDictionary dictionaryWithCapacity:10];

    [dict setObject:[NSNumber numberWithInt:self.pluralLevelOneId]
             forKey:@"id"];
    [dict setObject:(self.level ? self.level : [NSNull null])
             forKey:@"level"];
    [dict setObject:(self.name ? self.name : [NSNull null])
             forKey:@"name"];
    [dict setObject:(self.pluralLevelTwo ? [self.pluralLevelTwo arrayOfPluralLevelTwoDictionariesFromPluralLevelTwoObjects] : [NSNull null])
             forKey:@"pluralLevelTwo"];

    return dict;
}

+ (id)pluralLevelOneObjectFromDictionary:(NSDictionary*)dictionary
{
    JRPluralLevelOne *pluralLevelOne = [JRPluralLevelOne pluralLevelOne];

    pluralLevelOne.pluralLevelOneId =
        [dictionary objectForKey:@"id"] != [NSNull null] ? 
        [(NSNumber*)[dictionary objectForKey:@"id"] intValue] : 0;

    pluralLevelOne.level =
        [dictionary objectForKey:@"level"] != [NSNull null] ? 
        [dictionary objectForKey:@"level"] : nil;

    pluralLevelOne.name =
        [dictionary objectForKey:@"name"] != [NSNull null] ? 
        [dictionary objectForKey:@"name"] : nil;

    pluralLevelOne.pluralLevelTwo =
        [dictionary objectForKey:@"pluralLevelTwo"] != [NSNull null] ? 
        [(NSArray*)[dictionary objectForKey:@"pluralLevelTwo"] arrayOfPluralLevelTwoObjectsFromPluralLevelTwoDictionaries] : nil;

    [pluralLevelOne.dirtyPropertySet removeAllObjects];
    
    return pluralLevelOne;
}

- (void)updateFromDictionary:(NSDictionary*)dictionary
{
    if ([dictionary objectForKey:@"id"])
        _pluralLevelOneId = [dictionary objectForKey:@"id"] != [NSNull null] ? 
            [(NSNumber*)[dictionary objectForKey:@"id"] intValue] : 0;

    if ([dictionary objectForKey:@"level"])
        _level = [dictionary objectForKey:@"level"] != [NSNull null] ? 
            [dictionary objectForKey:@"level"] : nil;

    if ([dictionary objectForKey:@"name"])
        _name = [dictionary objectForKey:@"name"] != [NSNull null] ? 
            [dictionary objectForKey:@"name"] : nil;

    if ([dictionary objectForKey:@"pluralLevelTwo"])
        _pluralLevelTwo = [dictionary objectForKey:@"pluralLevelTwo"] != [NSNull null] ? 
            [(NSArray*)[dictionary objectForKey:@"pluralLevelTwo"] arrayOfPluralLevelTwoObjectsFromPluralLevelTwoDictionaries] : nil;
}

- (void)replaceFromDictionary:(NSDictionary*)dictionary
{
    _pluralLevelOneId =
        [dictionary objectForKey:@"id"] != [NSNull null] ? 
        [(NSNumber*)[dictionary objectForKey:@"id"] intValue] : 0;

    _level =
        [dictionary objectForKey:@"level"] != [NSNull null] ? 
        [dictionary objectForKey:@"level"] : nil;

    _name =
        [dictionary objectForKey:@"name"] != [NSNull null] ? 
        [dictionary objectForKey:@"name"] : nil;

    _pluralLevelTwo =
        [dictionary objectForKey:@"pluralLevelTwo"] != [NSNull null] ? 
        [(NSArray*)[dictionary objectForKey:@"pluralLevelTwo"] arrayOfPluralLevelTwoObjectsFromPluralLevelTwoDictionaries] : nil;
}

- (NSDictionary *)toUpdateDictionary
{
    NSMutableDictionary *dict =
         [NSMutableDictionary dictionaryWithCapacity:10];

    if ([self.dirtyPropertySet containsObject:@"level"])
        [dict setObject:(self.level ? self.level : [NSNull null]) forKey:@"level"];

    if ([self.dirtyPropertySet containsObject:@"name"])
        [dict setObject:(self.name ? self.name : [NSNull null]) forKey:@"name"];

    if ([self.dirtyPropertySet containsObject:@"pluralLevelTwo"])
        [dict setObject:(self.pluralLevelTwo ? [self.pluralLevelTwo arrayOfPluralLevelTwoUpdateDictionariesFromPluralLevelTwoObjects] : [NSNull null]) forKey:@"pluralLevelTwo"];

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
    [dict setObject:(self.pluralLevelTwo ? [self.pluralLevelTwo arrayOfPluralLevelTwoReplaceDictionariesFromPluralLevelTwoObjects] : [NSNull null]) forKey:@"pluralLevelTwo"];

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
    [_pluralLevelTwo release];

    [super dealloc];
}
@end
