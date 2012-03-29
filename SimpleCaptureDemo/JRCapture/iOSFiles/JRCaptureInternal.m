//
//  JRCaptureData.m
//  SimpleCaptureDemo
//
//  Created by Lilli Szafranski on 3/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "JRCaptureInternal.h"

@interface JRCaptureObject (Internal)
//- (NSDictionary *)toUpdateDictionary;
//- (NSDictionary *)toReplaceDictionary;
//- (void)updateFromDictionary:(NSDictionary*)dictionary;
//- (void)replaceFromDictionary:(NSDictionary*)dictionary;
@end

@implementation JRCaptureObject
@synthesize dirtyPropertySet;
@synthesize captureObjectPath;

- (id)init
{
    if ((self = [super init]))
    {
        dirtyPropertySet = [[NSMutableSet alloc] init];
    }
    return self;
}

- (id)copyWithZone:(NSZone*)zone
{
    JRCaptureObject *objectCopy =
                [[JRCaptureObject allocWithZone:zone] init];

    for (NSString *dirtyProperty in [self.dirtyPropertySet allObjects])
        [objectCopy.dirtyPropertySet addObject:dirtyProperty];

    objectCopy.captureObjectPath = self.captureObjectPath;

    return objectCopy;
}

- (void)replaceCaptureObjectDidFailWithResult:(NSString *)result context:(NSObject *)context
{
    NSDictionary    *myContext     = (NSDictionary *)context;
    JRCaptureObject *captureObject = [myContext objectForKey:@"captureObject"];
    NSObject        *callerContext = [myContext objectForKey:@"callerContext"];
    id<JRCaptureObjectDelegate>
                     delegate      = [myContext objectForKey:@"delegate"];

    if ([delegate respondsToSelector:@selector(replaceCaptureObject:didFailWithResult:context:)])
        [delegate replaceCaptureObject:captureObject didFailWithResult:result context:callerContext];
}

- (void)replaceCaptureObjectDidSucceedWithResult:(NSString *)result context:(NSObject *)context
{
    NSDictionary    *myContext     = (NSDictionary *)context;
    JRCaptureObject *captureObject = [myContext objectForKey:@"captureObject"];
    NSObject        *callerContext = [myContext objectForKey:@"callerContext"];
    id<JRCaptureObjectDelegate>
                     delegate      = [myContext objectForKey:@"delegate"];

    NSDictionary *resultDictionary = [result objectFromJSONString];

    if (![((NSString *)[resultDictionary objectForKey:@"stat"]) isEqualToString:@"ok"])
        [self updateCaptureObjectDidFailWithResult:result context:context];

    if (![resultDictionary objectForKey:@"result"])
        [self updateCaptureObjectDidFailWithResult:result context:context];

    [captureObject replaceFromDictionary:[resultDictionary objectForKey:@"result"]];
    [captureObject.dirtyPropertySet removeAllObjects];

    if ([delegate respondsToSelector:@selector(replaceCaptureObject:didSucceedWithResult:context:)])
        [delegate replaceCaptureObject:captureObject didSucceedWithResult:result context:callerContext];
}

- (void)updateCaptureObjectDidFailWithResult:(NSString *)result context:(NSObject *)context
{
    NSDictionary    *myContext     = (NSDictionary *)context;
    JRCaptureObject *captureObject = [myContext objectForKey:@"captureObject"];
    NSObject        *callerContext = [myContext objectForKey:@"callerContext"];
    id<JRCaptureObjectDelegate>
                     delegate      = [myContext objectForKey:@"delegate"];

    if ([delegate respondsToSelector:@selector(updateCaptureObject:didFailWithResult:context:)])
        [delegate updateCaptureObject:captureObject didFailWithResult:result context:callerContext];
}

- (void)updateCaptureObjectDidSucceedWithResult:(NSString *)result context:(NSObject *)context
{
    NSDictionary    *myContext     = (NSDictionary *)context;
    JRCaptureObject *captureObject = [myContext objectForKey:@"captureObject"];
    NSObject        *callerContext = [myContext objectForKey:@"callerContext"];
    id<JRCaptureObjectDelegate>
                     delegate      = [myContext objectForKey:@"delegate"];

    NSDictionary *resultDictionary = [result objectFromJSONString];

    if (![((NSString *)[resultDictionary objectForKey:@"stat"]) isEqualToString:@"ok"])
        [self updateCaptureObjectDidFailWithResult:result context:context];

    if (![resultDictionary objectForKey:@"result"])
        [self updateCaptureObjectDidFailWithResult:result context:context];

    [captureObject updateFromDictionary:[resultDictionary objectForKey:@"result"]];
    [captureObject.dirtyPropertySet removeAllObjects];

    if ([delegate respondsToSelector:@selector(updateCaptureObject:didSucceedWithResult:context:)])
        [delegate updateCaptureObject:captureObject didSucceedWithResult:result context:callerContext];
}

- (NSDictionary *)toDictionary
{
    [NSException raise:NSInternalInconsistencyException
                format:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)];

    return nil; // TODO: What's the better way to raise the exception in a method w a return?
}

- (NSDictionary *)toUpdateDictionary
{
    [NSException raise:NSInternalInconsistencyException
                format:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)];

    return nil; // TODO: What's the better way to raise the exception in a method w a return?
}

- (NSDictionary *)toReplaceDictionary
{
    [NSException raise:NSInternalInconsistencyException
                format:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)];

    return nil; // TODO: What's the better way to raise the exception in a method w a return?
}

- (void)updateFromDictionary:(NSDictionary *)dictionary
{
    [NSException raise:NSInternalInconsistencyException
                format:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)];
}

- (void)replaceFromDictionary:(NSDictionary *)dictionary
{
    [NSException raise:NSInternalInconsistencyException
                format:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)];
}

- (void)updateObjectOnCaptureForDelegate:(id <JRCaptureObjectDelegate>)delegate withContext:(NSObject *)context
{
    [NSException raise:NSInternalInconsistencyException
                format:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)];
}

- (void)replaceObjectOnCaptureForDelegate:(id <JRCaptureObjectDelegate>)delegate withContext:(NSObject *)context
{
    [NSException raise:NSInternalInconsistencyException
                format:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)];
}

- (void)dealloc
{
    [captureObjectPath release];
    [dirtyPropertySet release];

    [super dealloc];
}
@end

@implementation JRStringPluralElement
{
    NSInteger _elementId;
    NSString *_value;
}
@synthesize type = _type;
@dynamic    elementId;
@dynamic    value;

- (NSInteger)elementId
{
    return _elementId;
}

- (void)setElementId:(NSInteger)newElementId
{
    [self.dirtyPropertySet addObject:@"elementId"];

    _elementId = newElementId;
}

- (NSString *)value
{
    return _value;
}

- (void)setValue:(NSString *)newValue
{
    [self.dirtyPropertySet addObject:@"value"];

//    if (!newValue)
//        _value = [NSNull null];
//    else
        _value = [newValue copy];
}

- (id)initWithType:(NSString *)elementType
{
    if ((self = [super init]))
    {
        self.captureObjectPath = @"/";
        _type = elementType;
    }
    return self;
}

+ (id)stringElementWithType:(NSString *)elementType
{
    return [[[JRStringPluralElement alloc] initWithType:elementType] autorelease];
}

- (id)copyWithZone:(NSZone*)zone
{
    JRStringPluralElement *stringElementCopy =
                [[JRStringPluralElement allocWithZone:zone] initWithType:self.type];

    stringElementCopy.elementId = self.elementId;
    stringElementCopy.value     = self.value;

    [stringElementCopy.dirtyPropertySet removeAllObjects];
    [stringElementCopy.dirtyPropertySet setSet:self.dirtyPropertySet];

    return stringElementCopy;
}

+ (id)stringElementFromDictionary:(NSDictionary*)dictionary withType:(NSString *)elementType
{
    JRStringPluralElement *stringElement =
        [JRStringPluralElement stringElementWithType:elementType];

    stringElement.elementId = [(NSNumber*)[dictionary objectForKey:@"id"] intValue];
    stringElement.value = [dictionary objectForKey:elementType];

    [stringElement.dirtyPropertySet removeAllObjects];

    return stringElement;
}

+ (id)stringElementFromString:(NSString*)valueString withType:(NSString *)elementType
{
    JRStringPluralElement *stringElement =
        [JRStringPluralElement stringElementWithType:elementType];

    stringElement.value = valueString;

    [stringElement.dirtyPropertySet removeAllObjects];

    return stringElement;
}

- (NSDictionary*)toDictionary
{
    NSMutableDictionary *dict =
        [NSMutableDictionary dictionaryWithCapacity:10];

    if (self.elementId)
        [dict setObject:[NSNumber numberWithInt:self.elementId] forKey:@"id"];

    if (self.value && self.value != [NSNull null])
        [dict setObject:self.value forKey:self.type];
    else
        [dict setObject:[NSNull null] forKey:self.type];

    return dict;
}

- (void)updateFromDictionary:(NSDictionary*)dictionary
{
    if ([dictionary objectForKey:@"id"])
        _elementId = [(NSNumber*)[dictionary objectForKey:@"id"] intValue];

    if ([dictionary objectForKey:_type])
        _value = [dictionary objectForKey:_type];
}

- (void)replaceFromDictionary:(NSDictionary*)dictionary
{
    _elementId = [(NSNumber*)[dictionary objectForKey:@"id"] intValue];
    _value = [dictionary objectForKey:_type];
}

- (NSDictionary *)toUpdateDictionary
{
    NSMutableDictionary *dict =
         [NSMutableDictionary dictionaryWithCapacity:10];

    if ([self.dirtyPropertySet containsObject:@"elementId"])
        [dict setObject:[NSNumber numberWithInt:self.elementId] forKey:@"id"];

    if ([self.dirtyPropertySet containsObject:@"value"])
        [dict setObject:self.value forKey:self.type];

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

    [dict setObject:[NSNumber numberWithInt:self.elementId] forKey:@"id"];
    [dict setObject:self.value forKey:self.type];

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
    [_value release];
    [_type release];

    [super dealloc];
}
@end

@implementation NSArray (JRStringPluralElement)
- (NSArray*)arrayOfStringPluralDictionariesFromStringPluralElements
{
    NSMutableArray *filteredDictionaryArray = [NSMutableArray arrayWithCapacity:[self count]];
    for (NSObject *object in self)
        if ([object isKindOfClass:[JRStringPluralElement class]])
            [filteredDictionaryArray addObject:[(JRStringPluralElement*)object dictionaryFromStringElement]];

    return filteredDictionaryArray;
}

- (NSArray*)arrayOfStringPluralElementsFromStringPluralDictionariesWithType:(NSString *)elementType
{
    NSMutableArray *filteredPluralArray = [NSMutableArray arrayWithCapacity:[self count]];
    for (NSObject *dictionary in self)
        if ([dictionary isKindOfClass:[NSDictionary class]])
            [filteredPluralArray addObject:[JRStringPluralElement stringElementFromDictionary:(NSDictionary*)dictionary
                                                                                     withType:elementType]];

    return filteredPluralArray;
}

//- (NSArray*)arrayOfStringPluralElementsFromArrayOfStringsWithType:(NSString *)elementType
//{
//    NSMutableArray *filteredDictionaryArray = [NSMutableArray arrayWithCapacity:[self count]];
//    for (NSString *valueString in self)
//        if ([valueString isKindOfClass:[NSString class]])
//            [filteredDictionaryArray addObject:[JRStringPluralElement stringElementFromString:valueString
//                                                                                     withType:elementType]];
//
//    return filteredDictionaryArray;
//}

- (NSArray*)copyArrayOfStringPluralElementsWithType:(NSString *)elementType
{
    NSMutableArray *filteredArrayCopy = [NSMutableArray arrayWithCapacity:[self count]];
    for (NSObject *object in self)
        if ([object isKindOfClass:[NSString class]])
            [filteredArrayCopy addObject:[JRStringPluralElement stringElementFromString:(NSString *)object
                                                                               withType:elementType]];
        else if ([object isKindOfClass:[JRStringPluralElement class]]) // TODO: Copy or not???
            [filteredArrayCopy addObject:[[(JRStringPluralElement *)object copy] autorelease]];

    return [filteredArrayCopy retain];
}
@end

@interface JRCaptureData ()
@property (nonatomic, copy) NSString *captureApidDomain;
@property (nonatomic, copy) NSString *captureUIDomain;
@property (nonatomic, copy) NSString *clientId;
@property (nonatomic, copy) NSString *entityTypeName;
@property (nonatomic, copy) NSString *accessToken;
@property (nonatomic, copy) NSString *creationToken;
@end

@implementation JRCaptureData
static JRCaptureData *singleton = nil;

@synthesize clientId;
@synthesize entityTypeName;
@synthesize captureApidDomain;
@synthesize captureUIDomain;
@synthesize accessToken;
@synthesize creationToken;

- (JRCaptureData *)init
{
    if ((self = [super init])) { }

    return self;
}

+ (id)captureDataInstance
{
    if (singleton == nil) {
        singleton = [((JRCaptureData*)[super allocWithZone:NULL]) init];
    }

    return singleton;
}

+ (id)allocWithZone:(NSZone *)zone
{
    return [[self captureDataInstance] retain];
}

- (id)copyWithZone:(NSZone *)zone
{
    return self;
}

- (id)retain
{
    return self;
}

- (NSUInteger)retainCount
{
    return NSUIntegerMax;
}

- (oneway void)release { }

- (id)autorelease
{
    return self;
}

+ (NSString *)captureMobileEndpointUrl
{
    JRCaptureData *captureDataInstance = [JRCaptureData captureDataInstance];
    return [NSString stringWithFormat:@"%@/oauth/mobile_signin?client_id=%@&redirect_uri=https://example.com",
                     captureDataInstance.captureUIDomain, captureDataInstance.clientId];
}

+ (void)setCaptureApiDomain:(NSString *)newCaptureApidDomain captureUIDomain:(NSString *)newCaptureUIDomain
                   clientId:(NSString *)newClientId andEntityTypeName:(NSString *)newEntityTypeName
{
    JRCaptureData *captureDataInstance    = [JRCaptureData captureDataInstance];
    captureDataInstance.captureApidDomain = newCaptureApidDomain;
    captureDataInstance.captureUIDomain   = newCaptureUIDomain;
    captureDataInstance.clientId          = newClientId;
    captureDataInstance.entityTypeName    = newEntityTypeName;
}

+ (void)setAccessToken:(NSString *)newAccessToken
{
    JRCaptureData *captureDataInstance = [JRCaptureData captureDataInstance];
    captureDataInstance.accessToken    = newAccessToken;
}

+ (void)setCreationToken:(NSString *)newCreationToken
{
    JRCaptureData *captureDataInstance = [JRCaptureData captureDataInstance];
    captureDataInstance.creationToken  = newCreationToken;
}

+ (NSString *)accessToken
{
    return [[JRCaptureData captureDataInstance] accessToken];
}

+ (NSString *)creationToken
{
    return [[JRCaptureData captureDataInstance] creationToken];
}

+ (NSString *)captureApidDomain
{
    return [[JRCaptureData captureDataInstance] captureApidDomain];
}

+ (NSString *)captureUIDomain
{
    return [[JRCaptureData captureDataInstance] captureUIDomain];
}

+ (NSString *)clientId
{
    return [[JRCaptureData captureDataInstance] clientId];
}

+ (NSString *)entityTypeName
{
    return [[JRCaptureData captureDataInstance] entityTypeName];
}

- (void)dealloc
{
    [clientId release];
    [entityTypeName release];
    [captureApidDomain release];
    [captureUIDomain release];
    [accessToken release];
    [creationToken release];
    [super dealloc];
}
@end
