//
//  CellOne.swift
//  UICollectonExample
//
//  Created by max on 14.01.2022.
//

import UIKit

class CellHeader: UICollectionViewCell {
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "text"
        label.textColor = .darkGray
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
        
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("")
    }
    
    func setup() {
        
        contentView.addSubview(collectionView)
        collectionView.edgeTo(contentView)
        collectionView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        leadingAnchor.constraint(equalTo: collectionView.leadingAnchor, constant: -20).isActive = true
    }

}


