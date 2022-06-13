//
//  ViewController.swift
//  tableViewPrac
//
//  Created by 이예은 on 2022/06/13.
//

import UIKit

class TableViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
//    var delegate = Delegate()
    var dataSource = DataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = dataSource
    }
}

extension TableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        tableView.sectionHeaderHeight = 10
        tableView.backgroundColor = .systemGray
        return "  "
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alertController = UIAlertController(title: "어머나", message: "날 만졌어 \n Section \(indexPath.section) , Row \(indexPath.row)", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "그랬구나", style: .default, handler: nil)
        alertController.addAction(confirmAction)
        
        self.present(alertController, animated: false)
    }
}

class DataSource: NSObject, UITableViewDataSource {
    // 섹션의 개수를 묻는 메서드
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    
    // 섹션에 표시할 행의 개수를 묻는 메서드
    func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int = 1) -> Int {
        print(section)
        return 1
    }
    
    // 특정 위치에 표시할 셀을 요청하는 메서드
    func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "basicStyleCell", for: indexPath)
        tableView.rowHeight = 100
        cell.textLabel!.text = "\(indexPath.section) , \(indexPath.row)"
        return cell
    }
}

