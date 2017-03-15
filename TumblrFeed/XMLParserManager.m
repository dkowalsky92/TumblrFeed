//
//  XMLParserManager.m
//  TumblrFeed
//
//  Created by Dominik Kowalski on 06.03.2017.
//  Copyright © 2017 kowalsky's design. All rights reserved.
//

#import "XMLParserManager.h"

@interface XMLParserManager ()
- (instancetype)init;
@end

@implementation XMLParserManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

+(instancetype)shared {
    static XMLParserManager* _shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shared = [self new];
    });
    return _shared;
}

-(void)setup {
    
}

-(void)setupWithData:(NSData *)data {
    _parser = [[NSXMLParser alloc]initWithData:data];
    _parser.delegate = self;
}


// MARK: - NSXMLParserDelegate stack
-(void)parserDidStartDocument:(NSXMLParser *)parser {
    NSLog(@"did start");
    [self.delegate didStartParsingDocument];
}

-(void)parserDidEndDocument:(NSXMLParser *)parser {
    NSLog(@"did end");
    [self.delegate didEndParsingDocument];
}

-(void)parser:(NSXMLParser *)parser validationErrorOccurred:(NSError *)validationError {
    [self.delegate didFailParsingXMLWithError:validationError];
}

-(void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
    [self.delegate didFailParsingXMLWithError:parseError];
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    NSLog(@"did end element - %@", elementName);
    
    if ([elementName isEqualToString:@"posts"]) {
        [self.delegate didUpdateUser:_currentUser];
        
    } else if ([elementName isEqualToString:@"post"]) {

        if ([_postType  isEqual: @"regular"]) {
            [self.delegate didParseRegularPost:_regularPost];
            _regularPost = nil;
            
        } else if ([_postType  isEqualToString: @"photo"]) {
            [self.delegate didParsePhotoPost:_photoPost];
            _photoPost = nil;
            
        } else if ([_postType  isEqualToString: @"link"]) {
            [self.delegate didParseLinkPost:_linkPost];
            _linkPost = nil;
            
        }
    }
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict {
    NSLog(@"did start element - %@", elementName);
    NSLog(@"attributes - %@", attributeDict);
    
    if ([elementName isEqualToString:@"photo-url"] && !([attributeDict[@"max-width"]  isEqual: @"1280"])) {
        return;
    }
    _currentElement = elementName;
    
    if ([_currentElement isEqualToString:@"tumblelog"]) {
        [self updateUserWithAttributes:attributeDict];
        
    } else if ([_currentElement isEqualToString:@"posts"]) {
        [self updatePostCountWithAttributes:attributeDict];
        
    } else if ([_currentElement isEqualToString:@"post"]) {
        NSString* type = [self checkPostType:attributeDict[@"type"]];
        _postType = type;
        
        Post* post = [self createNewPostWithAttributes:attributeDict];
        
        if ([type isEqualToString:@"regular"]) {
            _regularPost = [[RegularPost alloc] init];
            _regularPost.id = post.id;
            _regularPost.date = post.date;
            _regularPost.tags = post.tags;
            _regularPost.type = post.type;
            
        } else if ([type isEqualToString:@"link"]) {
            _linkPost = [[LinkPost alloc] init];
            _linkPost.id = post.id;
            _linkPost.date = post.date;
            _linkPost.tags = post.tags;
            _linkPost.type = post.type;
            
        } else if ([type isEqualToString:@"photo"]) {
            _photoPost = [[PhotoPost alloc] init];
            _photoPost.id = post.id;
            _photoPost.date = post.date;
            _photoPost.tags = post.tags;
            _photoPost.type = post.type;
            
        }
    } else if ([_currentElement isEqualToString:@"regular-body"]) { // Regular Post
        ;
    } else if ([_currentElement isEqualToString:@"regular-title"]) { // Regular Post
        ;
    } else if ([_currentElement isEqualToString:@"photo-caption"]) { // Photo Post
    
    } else if ([_currentElement isEqualToString:@"photo-url"]) { // Photo Post
        
    } else if ([_currentElement isEqualToString:@"link-text"]) { // Link Post
        
    } else if ([_currentElement isEqualToString:@"link-url"]) { // Link Post
        
    }
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    NSLog(@"found characters - %@", string);
    if ([_currentElement isEqualToString: @"tumblelog"]) {
        [self updateUserNoteWithCharacters:string];
    } else if ([_currentElement isEqualToString:@"tag"]) {
        if ([_postType isEqualToString:@"regular"]) {
            if (_regularPost.tags == nil) {
                _regularPost.tags = @"";
            }
            _regularPost.tags = [_regularPost.tags stringByAppendingString:[NSString stringWithFormat:@"#%@", string]];
            
        } else if ([_postType isEqualToString:@"link"]) {
            if (_linkPost.tags == nil) {
                _linkPost.tags = @"";
            }
            _linkPost.tags = [_linkPost.tags stringByAppendingString:[NSString stringWithFormat:@"#%@", string]];
            
        } else if ([_postType isEqualToString:@"photo"]) {
            if (_photoPost.tags == nil) {
                _photoPost.tags = @"";
            }
            _photoPost.tags = [_photoPost.tags stringByAppendingString:[NSString stringWithFormat:@"#%@", string]];
            
        }
    } else if ([_currentElement isEqualToString: @"regular-body"]) { // Regular Post
        
        _regularPost.regularBody = string;
        
    } else if ([_currentElement isEqualToString:@"regular-title"]) { // Regular Post
        
        _regularPost.regularTitle = string;
        
    } else if ([_currentElement isEqualToString:@"link-text"]) { // Link Post
        
        _linkPost.linkTitle = string;
        
    } else if ([_currentElement isEqualToString:@"link-url"]) { // Link Post
        
        _linkPost.url = string;
        
    } else if ([_currentElement isEqualToString:@"photo-caption"]) { // Photo Post
        
        _photoPost.caption = string;
        
    } else if ([_currentElement isEqualToString:@"photo-url"]) { // Photo Post
        
        _photoPost.link = string;
        
    }
}

-(void)start {
    
}

-(void)updatePostCountWithAttributes:(NSDictionary<NSString*, NSString*>*)attributes {
    if (_currentUser == nil) {
        _currentUser = [[User alloc]init];
    }
    
    _currentUser.posts = attributes[@"total"];
    
    [self.delegate didUpdateUser:_currentUser];
}

-(void)updateUserWithAttributes:(NSDictionary<NSString*, NSString*>*)attributes {
    if (_currentUser == nil) {
        _currentUser = [[User alloc]init];
    }
    
    _currentUser.name = attributes[@"name"];
    _currentUser.title = attributes[@"title"];
    
    [self.delegate didUpdateUser:_currentUser];
}

-(void)updateUserNoteWithCharacters:(NSString*)characters {
    if (_currentUser == nil) {
        _currentUser = [[User alloc]init];
    }
    
    _currentUser.note = characters;
    
    [self.delegate didUpdateUser:_currentUser];
}

-(NSString*)checkPostType:(NSString*)type {
    if ([type isEqualToString:@"photo"]) {
        return @"photo";
    } else if ([type isEqualToString:@"regular"]) {
        return @"regular";
    } else if ([type isEqualToString:@"link"]) {
        return @"link";
    }
    return @"";
}

-(Post*)createNewPostWithAttributes:(NSDictionary<NSString*, NSString*>*)attributes {
    Post* post = [[Post alloc]init];
    
    [post setId:attributes[@"id"]];
    [post setDate:attributes[@"unix-timestamp"]];
    [post setType:attributes[@"type"]];
    
    return post;
}

@end
