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
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "albumCellOne", for: indexPath) as! CellOne
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "albumCellTwo", for: indexPath) as! CellTwo
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 2 {
            return CGSize(width: view.frame.width, height: 40)
        }
        return CGSize(width: view.frame.width, height: 300)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 2 {
            return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        }
        return UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
    }
}
