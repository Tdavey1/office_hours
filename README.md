# Office Hour Checker

## Tagline

Search for the classes, bookmark them and check their office hour

## Links

Backend: https://github.com/Tdavey1/oh_checker

## Screen shots

the google calendar api is used to get the information for classes after a specific time to the end of the day

## Description

Functionality: 

1. Search classes in the search view and click result to see the OH's, or click 'add' to add the course to the bookmarks view; 
2. In the bookmarks view, click cell to see the OH's, or click 'remove' to remove from the bookmark page

Limitations:

1. only a few courses in the db because entering course information was done manually
2. not every class uses google calendar to list office hours
2. did not implement the functionality to get the user's current time and use that time to display office hours only after that time, even though the backend provided this functionality

## Requirement fulfillment

Requirements:

iOS:

1. Autolayout: every view is using Autolayout, namely NSLayoutConstraints
2. Use TableView: in the search page and the bookmarks page, uses tableView
3. Navigation: the MainViewController uses Navigation controller to display the SearchViewController and the BookMarkViewController
4. Integrate API: in class Networks, uses URL to get data

Backend: 

1. use PostreSql for db with a courses table
2. use get method to get courses from the db
