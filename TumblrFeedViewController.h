//
//  TumblrFeedViewController.h
//  TumblrFeed
//
//  Created by Dominik Kowalski on 04/03/2017.
//  Copyright © 2017 kowalsky's design. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "UIViewController+Utility.h"
#import "UIView+Colors.h"
#import "DataManager.h"
#import "DownloadManager.h"
#import "XMLParserManager.h"
#import "FeedTableViewCell.h"
#import "RegularFeedTableViewCell.h"
#import "LinkFeedTableViewCell.h"
#import "PhotoFeedTableViewCell.h"

@interface TumblrFeedViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, DataManagerDelegate>

@property (nonatomic) UITableView* _Nonnull tableView;
@property (nonatomic) UIRefreshControl* _Nonnull refreshControl;
@property (nonatomic) NSFetchedResultsController* _Nonnull fetchedResultsController;
@property (nonatomic) DataManager* _Nullable dataManager;
@property (nonatomic) LoginManager* _Nonnull loginManager;
@property (nonatomic) DownloadManager* _Nonnull downloadManager;
@property (nonatomic) BOOL isFetching;

-(void)configureTableView;
-(void)fetchData;
-(void)setup;
-(void)refresh;

@end
