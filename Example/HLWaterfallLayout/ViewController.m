//
//  ViewController.m
//  HLWaterfallLayout
//
//  Created by henvy on 14/12/2016.
//  Copyright © 2016 henvy. All rights reserved.
//

#import "ViewController.h"
#import "HLWaterfallLayout.h"
#import "HLImages.h"
#import "HLAnimation.h"
#import "HLCollectionViewCell.h"

@interface ViewController ()<UICollectionViewDataSource, HLWaterfallLayoutDelegate,HLCollectionViewCellDelegate,UICollectionViewDelegate>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray<HLImages *> *images;
@property (nonatomic, assign) BOOL deleteBtnFlag;
@property (nonatomic, assign) BOOL vibrateAniFlag;
@property (nonatomic, assign) BOOL cellDeleteBtnFlag;
@end

@implementation ViewController

- (NSMutableArray *)images {
    //从plist文件中取出字典数组，并封装成对象模型，存入模型数组中
    if (!_images) {
        _images = [NSMutableArray array];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"1.plist" ofType:nil];
        NSArray *imageDics = [NSArray arrayWithContentsOfFile:path];
        for (NSDictionary *imageDic in imageDics) {
            HLImages *image = [HLImages imageWithImageDic:imageDic];
            [_images addObject:image];
        }
    }
    return _images;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建瀑布流布局
    HLWaterfallLayout *waterfall = [HLWaterfallLayout waterFallLayoutWithColumnCount:3];
    
    //设置各属性的值
    //    waterfall.rowSpacing = 10;
    //    waterfall.columnSpacing = 10;
    //    waterfall.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    
    //或者一次性设置
    [waterfall setColumnSpacing:10 rowSpacing:10 sectionInset:UIEdgeInsetsMake(10, 10, 10, 10)];
    
    
    //设置代理，实现代理方法
    waterfall.delegate = self;
    /*
     //或者设置block
     [waterfall setItemHeightBlock:^CGFloat(CGFloat itemWidth, NSIndexPath *indexPath) {
     //根据图片的原始尺寸，及显示宽度，等比例缩放来计算显示高度
     XRImage *image = self.images[indexPath.item];
     return image.imageH / image.imageW * itemWidth;
     }];
     */
    //创建collectionView
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:waterfall];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerNib:[UINib nibWithNibName:@"HLCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
//    [self.collectionView registerClass:[HLCell class] forCellWithReuseIdentifier:@"cell"];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    [self.view addSubview:self.collectionView];
    
    _deleteBtnFlag = NO;
    _vibrateAniFlag = NO;
}

- (void)click {
    [self.images removeAllObjects];
    [self.collectionView reloadData];
}


//根据item的宽度与indexPath计算每一个item的高度
- (CGFloat)waterfallLayout:(HLWaterfallLayout *)waterfallLayout itemHeightForWidth:(CGFloat)itemWidth atIndexPath:(NSIndexPath *)indexPath {
    //根据图片的原始尺寸，及显示宽度，等比例缩放来计算显示高度
    HLImages *image = self.images[indexPath.item];
    return image.imageH / image.imageW * itemWidth;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.images.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HLCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.imageURL = self.images[indexPath.item].imageURL;
    
    [self setCellVibrate:cell IndexPath:indexPath];

    return cell;
}
- (void)setCellVibrate:(HLCollectionViewCell *)cell IndexPath:(NSIndexPath *)indexPath{
    if (_deleteBtnFlag) {
        _cellDeleteBtnFlag = YES;
    }
    cell.indexPath = indexPath;
    cell.deleteBtn.hidden = _cellDeleteBtnFlag ? NO : YES;
    if (_vibrateAniFlag) {
        [HLAnimation vibrateAnimation:cell];
    }else{
        [cell.layer removeAnimationForKey:@"shake"];
    }
    cell.delegate = self;
}
-(void)deleteCellAtIndexpath:(NSIndexPath *)indexPath cellView:(HLCollectionViewCell *)cell
{
    [self.collectionView performBatchUpdates:^{
        //delete the cell you selected
        [self.collectionView deleteItemsAtIndexPaths:@[indexPath]];
        [_images removeObjectAtIndex:indexPath.row];
        
    } completion:^(BOOL finished) {
        [self.collectionView reloadData];
    }];
}

- (void)showAllDeleteBtn{
    _deleteBtnFlag = YES;
    _vibrateAniFlag = YES;
    [self.collectionView reloadData];
    
}
- (void)hideAllDeleteBtn{
    _deleteBtnFlag = NO;
    _vibrateAniFlag = NO;
    _cellDeleteBtnFlag = NO;
    [self.collectionView reloadData];
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (_vibrateAniFlag) {
        [self hideAllDeleteBtn];
        return;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
