//
//  GZWaterfallFlowLayout.m
//  GZWaterFallDemo
//
//  Created by 孙国志 on 15/5/22.
//  Copyright (c) 2015年 孙国志. All rights reserved.
//

#import "GZWaterfallFlowLayout.h"

#define SIZE 100
#define COL 3

@implementation GZWaterfallFlowLayout

#pragma mark - UICollectionViewLayout


-(NSArray*)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray* attributes = [NSMutableArray array];
    UICollectionViewLayoutAttributes *currentLayoutAttributes = nil;
    UICollectionViewLayoutAttributes *preLayoutAttributes = nil;
    for (NSInteger i=0 ; i < [self.collectionView numberOfItemsInSection:0]; i++) {
        //这里利用了-layoutAttributesForItemAtIndexPath:来获取attributes
        NSIndexPath* indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        if (i > 2)
        {
            preLayoutAttributes = attributes[i - 3];
        }
        currentLayoutAttributes = [self layoutAttributesForItemAtIndexPath:indexPath];
        currentLayoutAttributes.frame = CGRectMake(CGRectGetWidth(self.collectionView.frame) / 3 * (currentLayoutAttributes.indexPath.item % 3),CGRectGetMaxY(preLayoutAttributes.frame), currentLayoutAttributes.size.width, currentLayoutAttributes.size.height);
        [attributes addObject:currentLayoutAttributes];
    }
    _maxHeight = currentLayoutAttributes.frame.size.height + currentLayoutAttributes.frame.origin.y;
    return attributes;
}

- (CGSize)collectionViewContentSize
{
    return CGSizeMake(CGRectGetWidth(self.collectionView.frame), _maxHeight);
}

@end
