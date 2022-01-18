//
//  ViewController.swift
//  UICollectonExample
//
//  Created by max on 14.01.2022.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        // Do any additional setup after loading the view.
    }
    

    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 16
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        //cv.backgroundColor = .systemRed
        
        return collectionView
    }()
    
    func setupViews() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(CellOne.self, forCellWithReuseIdentifier: "albumCellOne")
        collectionView.register(CellTwo.self, forCellWithReuseIdentifier: "albumCellTwo")
        collectionView.register(CellThree.self, forCellWithReuseIdentifier: "albumCellThree")
        
        view.addSubview(collectionView)
        collectionView.edgeTo(view)
     
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 2 {
            return 9
        }
        return 1

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "albumCellOne", for: indexPath) as! CellOne
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "albumCellTwo", for: indexPath) as! CellTwo
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "albumCellThree", for: indexPath) as! CellThree
            return cell
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch indexPath.section {
        case 1:
            return CGSize(width: view.frame.width, height: 160)
        case 2:
            return CGSize(width: view.frame.width, height: 40)
        default:
            return CGSize(width: view.frame.width, height: 300)
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        switch section {
        case 2:
            return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        default:
            return UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        }

    }
}
