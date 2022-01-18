//
//  CellTwo.swift
//  UICollectonExample
//
//  Created by max on 14.01.2022.
//

import UIKit

class CellThree: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()

        return tableView
    }()
    
    let dataArray = [Info(image: "video", title: "Videos"),
                     Info(image: "person", title: "Selfies"),
                     Info(image: "circle.dotted", title: "Live Photos"),
                     Info(image: "cube", title: "Portrait"),
                     Info(image: "circle.fill", title: "Long Exposure"),
                     Info(image: "circle.circle", title: "Panaramas")
                     
    ]
    
    func setup() {
        
        contentView.addSubview(tableView)
        tableView.edgeTo(contentView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(TableCell.self, forCellReuseIdentifier: "tableCell")
    }
    
    private class TableCell: UITableViewCell {
        
        let cellView: UIView = {
            let view = UIView()
            return view
        }()
        
        let iconView: UIImageView = {
            let icon = UIImageView()
            icon.contentMode = .center
            icon.layer.cornerRadius = 5
            icon.tintColor = .systemGray

            return icon
        }()
        
        let chevronView: UIImageView = {
            let image = UIImage(systemName: "chevron.right")
            let icon = UIImageView(image: image)
            icon.contentMode = .center
            icon.tintColor = .systemGray

            return icon
        }()
        
        
        let titleLabel: UILabel = {
            let label = UILabel()
            label.text = "text"
            label.textColor = .darkGray
            label.font = UIFont.boldSystemFont(ofSize: 16)
            return label
            
        }()

        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            cellSetup()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func cellSetup() {
            
            contentView.addSubview(cellView)
            cellView.edgeTo(contentView)
            
            cellView.addSubview(iconView)
            iconView.translatesAutoresizingMaskIntoConstraints = false
            
            iconView.widthAnchor.constraint(equalToConstant: 30).isActive = true
            iconView.heightAnchor.constraint(equalToConstant: 30).isActive = true
            
            iconView.centerYAnchor.constraint(equalTo: cellView.centerYAnchor).isActive = true
            iconView.leftAnchor.constraint(equalTo:  cellView.leftAnchor, constant: 20).isActive = true
            
            
            cellView.addSubview(titleLabel)
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            titleLabel.centerYAnchor.constraint(equalTo: iconView.centerYAnchor).isActive = true
            titleLabel.leftAnchor.constraint(equalTo:  iconView.leftAnchor, constant: 50).isActive = true
            
            cellView.addSubview(chevronView)
            chevronView.translatesAutoresizingMaskIntoConstraints = false
            chevronView.centerYAnchor.constraint(equalTo: cellView.centerYAnchor).isActive = true
            chevronView.leftAnchor.constraint(equalTo:  cellView.rightAnchor, constant: -30).isActive = true
        }
        
    }

}

extension CellThree: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! TableCell

        cell.titleLabel.text = dataArray[indexPath.row].title
        cell.iconView.image = UIImage(systemName: dataArray[indexPath.row].image)
        
        return cell
    }
    
}
