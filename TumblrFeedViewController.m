//
//  TumblrFeedViewController.m
//  TumblrFeed
//
//  Created by Dominik Kowalski on 04/03/2017.
//  Copyright © 2017 kowalsky's design. All rights reserved.
//

#import "TumblrFeedViewController.h"

@interface TumblrFeedViewController ()

@end

@implementation TumblrFeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setup];
    [self configureTableView];
}

-(void)loadView {
    UIView *view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [view setBackgroundColor: [UIView black]];
    self.view = view;
}

-(void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:false animated:true];
    _dataManager.delegate = self;
}

-(void)viewWillDisappear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:true animated:true];
    _dataManager.delegate = nil;
}

-(void)setup {
    _dataManager = [DataManager shared];
    _loginManager = [LoginManager shared];
    _downloadManager = [DownloadManager shared];
    
    _dataManager.delegate = self;
    
    self.title = _dataManager.currentUser.name;
}

-(void)configureTableView {
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIView gray];
    _tableView.backgroundView.backgroundColor = [UIView gray];
    [_tableView registerClass:[RegularFeedTableViewCell class] forCellReuseIdentifier:@REGULAR_FEED_CELL_IDENTIFIER];
    [_tableView registerClass:[LinkFeedTableViewCell class] forCellReuseIdentifier:@LINK_FEED_CELL_IDENTIFIER];
    [_tableView registerClass:[PhotoFeedTableViewCell class] forCellReuseIdentifier:@PHOTO_FEED_CELL_IDENTIFIER];
    [self.view addSubview:_tableView];
    
    _refreshControl = [UIRefreshControl new];
    _refreshControl.tintColor = [UIColor colorWithRed:166.0/255.0 green:177.0/255.0 blue:225.0/255.0 alpha:255.0/255.0];
    [_refreshControl addTarget:self action:@selector(refresh) forControlEvents:UIControlEventValueChanged];
    
    _tableView.refreshControl = _refreshControl;
    
    _isFetching = false;

    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"ManagedPost"];
    NSSortDescriptor *idSort = [NSSortDescriptor sortDescriptorWithKey:@"date" ascending:false];
    
    [request setSortDescriptors:@[idSort]];
    
    NSManagedObjectContext *moc = _dataManager.context;
    
    _fetchedResultsController = [[NSFetchedResultsController alloc]initWithFetchRequest:request managedObjectContext:moc sectionNameKeyPath:nil cacheName:nil];
    
    NSError *error;
    if (![[self fetchedResultsController] performFetch:&error]) {
        [self presentAlertViewControllerWithTitle:@"Error" message:error.localizedDescription andButton:@"OK" withAction:nil];
    }
    
}

-(void)refresh {
    if (!_isFetching) {
        _isFetching = true;
        dispatch_async(dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0), ^{
            [_dataManager.context performBlockAndWait:^{
                NSError* error;
                [_dataManager deleteObjectsForEntity:@"ManagedPost" error:&error];
                
                if (error) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [_refreshControl endRefreshing];
                        
                        [self presentAlertViewControllerWithTitle:@"" message:error.localizedDescription andButton:@"OK" withAction:nil];
                    });
                    
                    return;
                } else {
                    [self fetchData];
                }
            }];
        });
    }
}

-(void)fetchData {
    _isFetching = true;
    [_downloadManager fetchDataForUser:_dataManager.currentUser];
}

// MARK: - UITableView stack
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _fetchedResultsController.fetchedObjects.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ManagedPost* post = [_fetchedResultsController objectAtIndexPath:indexPath];
    NSDateFormatter* formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"dd' 'MMMM', 'yyyy";
    if ([post.type isEqualToString:@"regular"]) {
        ManagedRegularPost* regularPost = [_fetchedResultsController objectAtIndexPath:indexPath];
        RegularFeedTableViewCell* regularCell = [_tableView dequeueReusableCellWithIdentifier:@REGULAR_FEED_CELL_IDENTIFIER];
        
        regularCell.nicknameLabel.text = [formatter stringFromDate:regularPost.date];
        regularCell.titleLabel.text = regularPost.regularText;
        regularCell.bodyLabel.text = regularPost.regularBody;
        regularCell.noteLabel.text = regularPost.tags;
        
        return regularCell;
    } else if ([post.type isEqualToString:@"link"]) {
        ManagedLinkPost* linkPost = [_fetchedResultsController objectAtIndexPath:indexPath];
        LinkFeedTableViewCell* linkCell = [_tableView dequeueReusableCellWithIdentifier:@LINK_FEED_CELL_IDENTIFIER];
        
        linkCell.nicknameLabel.text = [formatter stringFromDate:linkPost.date];
        linkCell.linkUrl = [NSURL URLWithString:linkPost.url];
        [linkCell.linkButton setTitle:linkPost.linkTitle forState:UIControlStateNormal];
        
        return linkCell;
    } else if ([post.type isEqualToString:@"photo"]) {
        ManagedPhotoPost* photoPost = [_fetchedResultsController objectAtIndexPath:indexPath];
        PhotoFeedTableViewCell* photoCell = [_tableView dequeueReusableCellWithIdentifier:@PHOTO_FEED_CELL_IDENTIFIER];
        
        photoCell.nicknameLabel.text = [formatter stringFromDate:photoPost.date];
        photoCell.photoTitle.text = photoPost.caption;
        NSLog(@"tags = %@", photoPost.tags);
        [[_downloadManager.session dataTaskWithURL:[NSURL URLWithString:photoPost.link] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            if (error != nil) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                });
            } else {
                
                UIImage* image = [UIImage imageWithData:data];
                dispatch_async(dispatch_get_main_queue(), ^{
                    [photoCell.photoImage setImage:image];
                    //[photoCell.photoImage sizeToFit];
                });
                
            }
        }] resume];

        return photoCell;
    }
    
    return [UITableViewCell new];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    ManagedPost* post = [_fetchedResultsController objectAtIndexPath:indexPath];
    
    if ([post.type isEqualToString:@"regular"]) {
        return 300;
    } else if ([post.type isEqualToString:@"link"]) {
        return 180;
    } else if ([post.type isEqualToString:@"photo"]) {
        return 500;
    }
    
    
    return 200;
}

// MARK: - DataManager implementation
-(void)didStoreUser:(ManagedUser *)user inContext:(NSManagedObjectContext *)context {
    
}

-(void)didStorePhotoPost:(PhotoPost *)photoPost inContext:(NSManagedObjectContext *)context {
    
}

-(void)didStoreRegularPost:(RegularPost *)regularPost inContext:(NSManagedObjectContext *)context {
    
}

-(void)didStoreLinkPost:(LinkPost *)linkPost inContext:(NSManagedObjectContext *)context {
    
}

-(void)didEndXMLDocument {
    [_refreshControl endRefreshing];
    _isFetching = false;
    NSError* error;
    [_fetchedResultsController performFetch:&error];
    if (error != nil) {
        NSLog(@"error wooops");
    }
    NSLog(@"%lu", _fetchedResultsController.fetchedObjects.count);
    [_tableView reloadData];
}

-(void)didFailSavingContext:(NSManagedObjectContext *)context withError:(NSError *)error {
    [_refreshControl endRefreshing];
    _isFetching = false;
    
    [self presentAlertViewControllerWithTitle:@"Error" message:error.localizedDescription andButton:@"OK" withAction:nil];
}

-(void)didFailStoringPostsInContext:(NSManagedObjectContext *)context withError:(NSError *)error {
    [_refreshControl endRefreshing];
    _isFetching = false;
    
    [self presentAlertViewControllerWithTitle:@"Error" message:error.localizedDescription andButton:@"OK" withAction:nil];
}

@end
