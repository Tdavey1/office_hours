//
//  OfficeHourViewController.swift
//  officeHour
//
//  Created by aitong yu on 2018/4/26.
//  Copyright © 2018 aitong yu. All rights reserved.
//

import UIKit

class OfficeHourViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView: UITableView!
    var upcomingLabel: UILabel!
    var ohList: [OfficeHour] = []
    var cellReuseIdentifier: String = "ohIdentifier"
    var classId: Int!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(OHTableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        upcomingLabel = UILabel()
        upcomingLabel.textColor = .black
        upcomingLabel.text = "Upcoming Office Hours"
        upcomingLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        Network.getOHs(id: classId) { officehrs in
            self.ohList = officehrs
            print(self.ohList)
            self.tableView.reloadData()
        }
        
//        Network.getOHs(id: classId) { officeHours in
//            self.ohList = officeHours
//            print("here")
//            print(self.ohList.count)
//        }
        
        view.addSubview(upcomingLabel)
        view.addSubview(tableView)
        setUpConstraints()
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            upcomingLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            upcomingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: upcomingLabel.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
            ])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as!
        OHTableViewCell
        cell.taLabel.text = ohList[indexPath.row].ta
        cell.locLabel.text = ohList[indexPath.row].location
        cell.timeLabel.text = ohList[indexPath.row].time
        cell.setNeedsUpdateConstraints()
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ohList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 66.0
    }
}
