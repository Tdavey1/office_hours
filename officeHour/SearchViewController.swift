//
//  SearchViewController.swift
//  officeHour
//
//  Created by aitong yu on 2018/4/25.
//  Copyright © 2018 aitong yu. All rights reserved.
//

import UIKit

class SearchViewController: UITableViewController, UISearchBarDelegate, AddOrRemoveDelegate {
    
    func addPressed(course: Class) {
        enrolledClassesDelegate?.didSelectCourse(course: course)
    }
    
    func removePressed(course: Class) {
        enrolledClassesDelegate?.didDeleteCourse(course: course)
    }
    

    var searchController: UISearchController!
    var classList : [Class] = []
    let classCellIdentifier = "classCell"
    var enrolledClassesDelegate: SelectedCourses?
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Search Classes"
        //creates the search bar
        searchController = UISearchController(searchResultsController: nil)
        //searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search by class code (lower case)"
        searchController.searchBar.sizeToFit()
        tableView.tableHeaderView = searchController.searchBar
        tableView.register(ClassTableViewCell.self, forCellReuseIdentifier: classCellIdentifier)
        definesPresentationContext = true
        
//        Network.getCourses { classList in
//            self.classList = classList
//            self.tableView.reloadData()
//        }
        
        
//        let class1OH = [OfficeHour(time: "1:00pm-2:00pm", location: "Gates G13"), OfficeHour(time: "2-3", location: "Olin")]
//        let class2OH = [OfficeHour(time: "1:30pm-2:00pm", location: "Gates G23"), OfficeHour(time: "2-3", location: "Alin")]
//        let class3OH = [OfficeHour(time: "1:05pm-2:00pm", location: "Gates G43"), OfficeHour(time: "2-3", location: "Elin")]
//        let class1 = Class(classCode: "MATH 1910", instructor: "Carl Poitras", className: "Calculus for Engineers", officeHour: class1OH)
//        let class2 = Class(classCode: "MATH 1920", instructor: "Kelly Delp", className: "Multivariable Calculus for Engineers", officeHour: class2OH)
//        let class3 = Class(classCode: "CS 1110", instructor: "Walker White", className: "Intro to python", officeHour: class3OH)
//        classList.append(class1)
//        classList.append(class2)
//        classList.append(class3)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return classList.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88.0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: classCellIdentifier) as! ClassTableViewCell
        
        cell.course.classId = classList[indexPath.row].classId

        cell.course = classList[indexPath.row]
        cell.delegate = self
        
        let code = classList[indexPath.row].classNum
        cell.classCodeLabel.text = code
        
        let name = classList[indexPath.row].className
        cell.classNameLabel.text = name
        cell.course.className = name
        
        let inst = classList[indexPath.row].instructor
        cell.instructorLabel.text = inst
        cell.course.instructor = inst
    
        cell.addOrRemoveButton.setTitle("Add", for: .normal)

        cell.setNeedsUpdateConstraints()
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let ohVC = OfficeHourViewController()
        ohVC.title = classList[indexPath.row].className
        ohVC.ohList = classList[indexPath.row].officeHour
        ohVC.classId = classList[indexPath.row].classId
        navigationController?.pushViewController(ohVC, animated: true)
        
    }
    
    @objc func getClass(_ timer: Timer) {
        guard let userInfo = timer.userInfo as? [String : String],
        let searchText = userInfo["searchText"]
            else {return}
        
        Network.getCourses(withQuery: searchText) {(classList) in
            self.classList = classList
            self.tableView.reloadData()
        }
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text {
            if !searchText.isEmpty {
            }
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 0.25, target: self, selector: #selector(getClass(_:)), userInfo: ["searchText": searchText], repeats: false)
        if searchText.isEmpty{
            self.classList = [Class]()
            tableView.reloadData()
        }
    }
    


}

