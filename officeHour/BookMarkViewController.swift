//
//  BookMarkViewController.swift
//  officeHour
//
//  Created by aitong yu on 2018/4/25.
//  Copyright © 2018 aitong yu. All rights reserved.
//

import UIKit

class BookMarkViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddOrRemoveDelegate {
    
    var tableView: UITableView!
    var classList: [Class] = []
    let cellReuseIdentifier = "classCell"
    var enrolledClassesDelegate: SelectedCourses?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "My Bookmarks"
        
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ClassTableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        

//        let class1OH = [OfficeHour(time: "1:00pm-2:00pm", location: "Gates G13"), OfficeHour(time: "2-3", location: "Olin")]
//        let class2OH = [OfficeHour(time: "1:30pm-2:00pm", location: "Gates G23"), OfficeHour(time: "2-3", location: "Alin")]
//        let class3OH = [OfficeHour(time: "1:05pm-2:00pm", location: "Gates G43"), OfficeHour(time: "2-3", location: "Elin")]
//        let class1 = Class(classId: 1910, instructor: "Carl Poitras", className: "Calculus for Engineers", officeHour: class1OH)
//        //let class2 = Class(classCode: "MATH 1920", instructor: "Kelly Delp", className: "Multivariable Calculus for Engineers", officeHour: class2OH)
//        //let class3 = Class(classCode: "CS 1110", instructor: "Walker White", className: "Intro to python", officeHour: class3OH)
//        classList.append(class1)
//        //classList.append(class2)
//        //classList.append(class3)
//
        
        view.addSubview(tableView)
        setUpConstraints()
        
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return classList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as! ClassTableViewCell
        cell.delegate = self
        cell.course = classList[indexPath.row]
        cell.classCodeLabel.text = classList[indexPath.row].classNum
        cell.classNameLabel.text = classList[indexPath.row].className
        cell.instructorLabel.text = classList[indexPath.row].instructor
        cell.addOrRemoveButton.setTitle("Remove", for: .normal)
        cell.setNeedsUpdateConstraints()
        return cell
    }
    
    func addPressed(course: Class) {
        enrolledClassesDelegate?.didSelectCourse(course: course)
    }
    
    func removePressed(course: Class) {
        enrolledClassesDelegate?.didDeleteCourse(course: course)
        var i = -1
        for ind in 0...classList.count - 1 {
            if classList[ind].classId == course.classId {
                i = ind
            }
        }
        if i != -1 {
            classList.remove(at: i)
        }
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let ohVC = OfficeHourViewController()
        ohVC.title = classList[indexPath.row].className
        ohVC.ohList = classList[indexPath.row].officeHour
        ohVC.classId = classList[indexPath.row].classId
        navigationController?.pushViewController(ohVC, animated: true)
    }

}
