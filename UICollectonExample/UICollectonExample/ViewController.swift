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
        
        return collectionView
    }()
    
    func setupViews() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(CellOne.self, forCellWithReuseIdentifier: "albumCellOne")
        collectionView.register(CellTwo.self, forCellWithReuseIdentifier: "albumCellTwo")
        collectionView.register(CellThree.self, forCellWithReuseIdentifier: "tableCell")
        collectionView.register(CellHeader.self, forCellWithReuseIdentifier: "cellHeader")
        
        view.addSubview(collectionView)
        collectionView.edgeTo(view)
     
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.section {
        case 0,2,4:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellHeader", for: indexPath) as! CellHeader
            switch indexPath.section {
            case 0:
                cell.titleLabel.text = "My Albums"
            case 2:
                cell.titleLabel.text = "Shared Albums"
            default:
                cell.titleLabel.text = "Media Types"
            }
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "albumCellOne", for: indexPath) as! CellOne
            return cell
        case 3:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "albumCellTwo", for: indexPath) as! CellTwo
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tableCell", for: indexPath) as! CellThree
            return cell
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch indexPath.section {
        case 0,2,4:
            return CGSize(width: view.frame.width, height: 20)
        case 3:
            return CGSize(width: view.frame.width, height: 160)
        case 5:
            return CGSize(width: view.frame.width, height: 400)
        default:
            return CGSize(width: view.frame.width, height: 300)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        switch section {
        case 1:
            return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        default:
            return UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        }

    }
}
