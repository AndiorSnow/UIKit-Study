//
//  UITableView.swift
//  UIKit Study
//
//  Created by LMC60018 on 2024/1/11.
//

import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var dataSource = [[String:String]()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tableView = UITableView(frame: view.bounds, style: .grouped)
        tableView.backgroundColor = UIColor.white;
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        
        dataSource = [
            ["name":"Tom","sex":"Male","icon":"swift","birthday":"2017-10-11", "selectable": "no"],
            ["name":"Eddie","sex":"Male","icon":"swift","birthday":"2011-12-30", "selectable": "no"],
            ["name":"Lucy","sex":"Female","icon":"swift","birthday":"2014-9-10", "selectable": "no"],
            ["name":"Jim","sex":"Male","icon":"swift","birthday":"2008-10-1", "selectable": "no"]]
        tableView.reloadData()
    }
    
//MARK: UITableViewDataSource
    // number of cells
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    // UITableViewCell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "cellId"
        // Table reuse
        var cell: NewTableViewCell? = tableView.dequeueReusableCell(withIdentifier: cellId) as? NewTableViewCell
        if (cell == nil) {
            // Identify reusable cells of the same type and style
            cell = NewTableViewCell(style: .subtitle, reuseIdentifier: cellId)
            // deselect
            cell?.selectionStyle = .none
        }
        let dict: Dictionary = dataSource[indexPath.row]
        cell?.iconImv.image = UIImage(named: dict["icon"]!)
        cell?.userLabel.text = dict["name"]
        cell?.sexLabel.text = dict["sex"]
        cell?.birthdayLabel.text = dict["birthday"]
        if dict["selectable"] == "select" {
            // Selected Style
            cell?.accessoryType = .checkmark
        } else {
            cell?.accessoryType = .none
        }
        return cell!
    }
    
//MARK: UITableViewDelegate
    // Set cell height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 74.0
    }
    // Set the height of the chapter head under a certain index
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    // Execute this method after selecting the cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var i = 0
        for var dict in dataSource {
            
            if i == indexPath.row {
                dict["selectable"]! = "select"
                dataSource[i] = dict
            } else {
                dict["selectable"]! = "no"
                dataSource[i] = dict
            }
            i += 1
        }
        tableView.reloadData()
    }
}
