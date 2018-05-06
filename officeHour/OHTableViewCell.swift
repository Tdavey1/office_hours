//
//  OHTableViewCell.swift
//  officeHour
//
//  Created by Claire on 4/26/18.
//  Copyright © 2018 aitong yu. All rights reserved.
//

import UIKit

class OHTableViewCell: UITableViewCell {
    
    var timeLabel: UILabel!
    var locLabel: UILabel!
    var taLabel: UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        timeLabel = UILabel()
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        locLabel = UILabel()
        locLabel.translatesAutoresizingMaskIntoConstraints = false
        
        taLabel = UILabel()
        taLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(timeLabel)
        contentView.addSubview(locLabel)
        contentView.addSubview(taLabel)
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        NSLayoutConstraint.activate([
            taLabel.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            taLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor)
            ])
        
        NSLayoutConstraint.activate([
            timeLabel.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            timeLabel.topAnchor.constraint(equalTo: taLabel.bottomAnchor)
            ])
        
        NSLayoutConstraint.activate([
            locLabel.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            locLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor)
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
