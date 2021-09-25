//
//  PhotosCollectionViewLayout.swift
//  VKAPP
//
//  Created by Konstantin on 21.09.2021.
//

import UIKit
class PhotosCollectionViewLayout: UICollectionViewLayout {
    var cacheAttributes = [IndexPath: UICollectionViewLayoutAttributes] ()
    var columnsCount = 2
    var cellHeight:CGFloat = 500
    
    private var totalCellHeight: CGFloat = 0
    
    override func prepare() {
        self.cacheAttributes = [:]
        
        guard let collectionView = self.collectionView else { return }
        
        let itemsCount = collectionView.numberOfItems(inSection: 0)
        
        guard itemsCount > 0 else { return }
        
        let smallCellWidth = collectionView.frame.width / CGFloat(self.columnsCount)
        
        var lastY: CGFloat = 0
        var lastX: CGFloat = 0
        
        for index in 0..<itemsCount {
            let indexPath = IndexPath(item: index, section: 0)
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
        
    
            attributes.frame = CGRect(x: lastX, y: lastY, width: smallCellWidth, height: self.cellHeight)
            
//            let isLastColumn = (index + 2) % (self.columnsCount + 1) == 0 || index == itemsCount - 1
//            if isLastColumn {
//                lastX = 0
//                lastY += self.cellHeight
//            } else {
//                lastX += smallCellWidth
//            }
            cacheAttributes[indexPath] = attributes
            
        //    self.totalCellHeight = lastY
        
        }
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return cacheAttributes.values.filter { attributes in
            return rect.intersects(attributes.frame)
        }
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cacheAttributes[indexPath]
    }
    override var collectionViewContentSize: CGSize {
        return CGSize(width: self.collectionView?.frame.width ?? 0, height: self.totalCellHeight)
    }
}
