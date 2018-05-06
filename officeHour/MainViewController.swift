//
//  MainViewController.swift
//  officeHour
//
//  Created by aitong yu on 2018/4/25.
//  Copyright © 2018 aitong yu. All rights reserved.
//

import UIKit
import SnapKit

protocol SelectedCourses {
    func didSelectCourse(course: Class)
    func didDeleteCourse(course: Class)
}

class MainViewController: UIViewController, SelectedCourses {
    
    func didSelectCourse(course: Class) {
        self.enrolledClasses.append(course)
    }
    
    func didDeleteCourse(course: Class) {
        var i = -1
        if (enrolledClasses.count != 0) {
            for ind in 0...enrolledClasses.count - 1 {
                if enrolledClasses[ind].classId == course.classId {
                    i = ind
                }
            }
            if i != -1 {
                enrolledClasses.remove(at: i)
            }
        }
    }
    
    var enrolledClasses: [Class] = []
    var searchButton: UIButton!
    var bookMarkedButton: UIButton!
    var stackView: UIStackView!
    var scrollView: UIScrollView!
    var titleView: UIView!
    var titleViewLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "HOME"
        
       
        searchButton = UIButton(type: .system)
        searchButton.titleLabel?.font = UIFont(name: (searchButton.titleLabel?.font.fontName)!, size:35)
        searchButton.setTitleColor(UIColor(red:0.36, green:0.48, blue:0.62, alpha:1.0), for: .normal)
        searchButton.setTitle("Search For Classes", for: .normal)
        searchButton.addTarget(self, action: #selector(searchButtonPressed), for: .touchUpInside)
        
        searchButton.backgroundColor = UIColor(red:0.61, green:0.92, blue:0.73, alpha:1.0)
        
        bookMarkedButton = UIButton(type: .system)
       
        bookMarkedButton.setTitleColor(UIColor(red:0.36, green:0.48, blue:0.62, alpha:1.0), for: .normal)
        bookMarkedButton.setTitle("My Bookmarks", for: .normal)
        bookMarkedButton.addTarget(self, action: #selector(bookMarkedButtonPressed), for: .touchUpInside)
        bookMarkedButton.backgroundColor = UIColor(red:0.92, green:0.89, blue:0.61, alpha:1.0)
        bookMarkedButton.titleLabel?.font = UIFont(name: (bookMarkedButton.titleLabel?.font.fontName)!, size:35)
        
        scrollView = UIScrollView()
        scrollView.alwaysBounceVertical = true
        view.addSubview(scrollView)
        //adding title view
        titleViewLabel = UILabel()
        titleViewLabel.text = "Office Hours"
        titleViewLabel.font = UIFont(name: titleViewLabel.font.fontName, size:45)
        
        titleView = UIView()
        titleView.backgroundColor = .white
        titleView.addSubview(titleViewLabel)
       
        stackView = UIStackView(arrangedSubviews: [searchButton,bookMarkedButton])
        stackView.axis = .vertical

        stackView.distribution = .fillEqually
        stackView.spacing = 0
        view.addSubview(stackView)
//        view.addSubview(searchButton)
//        view.addSubview(bookMarkedButton)
        setUpContraints()
    }
    
    func setUpContraints() {
        scrollView.snp.makeConstraints{make in
            make.edges.equalToSuperview()
        
            
        }
        stackView.snp.makeConstraints{make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview()
            
        }
        titleViewLabel.snp.makeConstraints{make in
            make.size.equalTo(titleViewLabel.intrinsicContentSize)
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(50)
        }
        
//        NSLayoutConstraint.activate([
//            searchButton.leadingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leadingAnchor, constant:64),
//            searchButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
//            ])
//
//        NSLayoutConstraint.activate([
//            bookMarkedButton.trailingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.trailingAnchor, constant:-64),
//            bookMarkedButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
//            ])
    }
    @objc func searchButtonPressed() {
        let search = SearchViewController()
        search.enrolledClassesDelegate = self
        navigationController?.pushViewController(search, animated: true)
    }
    
    @objc func bookMarkedButtonPressed() {
        let bookMark = BookMarkViewController()
        bookMark.enrolledClassesDelegate = self
        bookMark.classList = enrolledClasses
        navigationController?.pushViewController(bookMark, animated: true)
    }
    
    
   
}
