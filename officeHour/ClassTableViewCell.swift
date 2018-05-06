//
//  ClassTableViewCell.swift
//  officeHour
//
//  Created by aitong yu on 2018/4/25.
//  Copyright © 2018 aitong yu. All rights reserved.
//

import Foundation
import UIKit

protocol AddOrRemoveDelegate {
    func addPressed(course: Class)
    func removePressed(course: Class)
}

class ClassTableViewCell: UITableViewCell {
    
    var classNameLabel: UILabel!
    var classCodeLabel : UILabel!
    var instructorLabel : UILabel!
    var addOrRemoveButton : UIButton!
    var delegate: AddOrRemoveDelegate?
    var course: Class
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        course = Class(classId: 1, instructor: "", className: "", officeHour: [], classNum: "")
        classNameLabel = UILabel()
        classCodeLabel = UILabel()
        instructorLabel = UILabel()
        
        addOrRemoveButton = UIButton()
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        addOrRemoveButton.setTitleColor(.blue, for: .normal)
        addOrRemoveButton.addTarget(self, action: #selector(addOrRemoveButtonPressed), for: .touchUpInside)

        let marginGuide = contentView.layoutMarginsGuide

        // Configure classNameLabel
        contentView.addSubview(classCodeLabel)
        classCodeLabel.translatesAutoresizingMaskIntoConstraints = false
        classCodeLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
        classCodeLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
        classCodeLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        classCodeLabel.numberOfLines = 0 // make label multi-line
        
        // Configure classCodeLabel
        contentView.addSubview(classNameLabel)
        classNameLabel.translatesAutoresizingMaskIntoConstraints = false
        classNameLabel.topAnchor.constraint(equalTo: classCodeLabel.bottomAnchor).isActive = true
        classNameLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
        
        // Constrain instructorLabel
        contentView.addSubview(instructorLabel)
        instructorLabel.translatesAutoresizingMaskIntoConstraints = false
        instructorLabel.topAnchor.constraint(equalTo: classNameLabel.bottomAnchor).isActive = true
        instructorLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
       
        // configure button
        contentView.addSubview(addOrRemoveButton)
        addOrRemoveButton.translatesAutoresizingMaskIntoConstraints = false
        addOrRemoveButton.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor)
        addOrRemoveButton.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func addOrRemoveButtonPressed(){
        if addOrRemoveButton.currentTitle == "Add" {
            delegate?.addPressed(course: course)
        } else {
            delegate?.removePressed(course: course)
        }
    }
    
}


