//
//  UICollectionView+Ext.swift
//  TacoPOP
//
//  Created by Jack Davis on 7/25/16.
//  Copyright © 2016 Devslopes. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    func register<T: UICollectionViewCell where T: ReusableView, T: NibLoadableView>(_: T.Type) {
        
        let nib = UINib(nibName: T.nibName, bundle: nil)
        register(nib, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell where T: ReusableView>(forIndexPath indexPath: NSIndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath as IndexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        
        return cell
    }
}

extension UICollectionViewCell: ReusableView {}
