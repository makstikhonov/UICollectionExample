//
//  CellOne.swift
//  UICollectonExample
//
//  Created by max on 14.01.2022.
//

import UIKit

class CellOne: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        return collectionView
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        backgroundColor = .systemMint
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        contentView.addSubview(collectionView)
        collectionView.edgeTo(contentView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(IconCell.self, forCellWithReuseIdentifier: "cellInAlbumOne")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellInAlbumOne", for: indexPath) as! IconCell
        cell.imageView.image = UIImage(named: "\(indexPath.row)")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: (frame.height / 2) - 10, height: (frame.height / 2) - 10)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    
    private class IconCell: UICollectionViewCell {
        
        let imageView: UIImageView = {
            let imageView = UIImageView()
            imageView.contentMode = .center
            imageView.clipsToBounds = true
            imageView.layer.cornerRadius = 15
            return imageView
        }()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            setup()

        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func setup() {
            addSubview(imageView)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.widthAnchor.constraint(equalToConstant: 140).isActive = true
            imageView.heightAnchor.constraint(equalToConstant: 140).isActive = true
            
        }
    }
}


