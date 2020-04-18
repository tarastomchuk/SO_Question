//
//  LogCollectionViewCell.swift
//  yesy
//
//  Created by Taras Tomchuk on 18.04.2020.
//  Copyright © 2020 com.news.app. All rights reserved.
//

import UIKit

class LogCollectionViewCell: UICollectionViewCell, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var userLogsTableView: UITableView!
    
    var didPressAdd: ((Any) -> Void)?
    var didSelectSymptom: ((Any) -> Void)?
    var logItemsList = [LogSymptom]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
     
        print("Cell loaded")
        
        userLogsTableView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 100, right: 0)
        
        NotificationCenter.default.addObserver(self, selector: #selector(reloadData), name: NSNotification.Name(rawValue: "ReloadLogsData"), object: nil)
        
        userLogsTableView.dataSource = self
        userLogsTableView.delegate = self
        
        userLogsTableView.register(UINib(nibName: "DateHeaderTableViewCell", bundle: nil), forHeaderFooterViewReuseIdentifier: "DateHeaderTableViewCell")
        userLogsTableView.register(UINib(nibName: "SymptomTableViewCell", bundle: nil), forCellReuseIdentifier: "SymptomTableViewCell")
    }
    
    func setupData(logItems: [LogSymptom]) {
        logItemsList = logItems
        
        print("Here", logItemsList.count)
    }
    
    @objc func reloadData() {
        print("Here - 1")
        userLogsTableView.reloadData()
    }
    
    @IBAction func didPressAdd(_ sender: UIButton) {
        self.didPressAdd?(sender)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 35
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return .leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 40
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        
        return logItemsList.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "DateHeaderTableViewCell" ) as! DateHeaderTableViewCell

        return headerView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print("This is here")
        return logItemsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SymptomTableViewCell", for: indexPath as IndexPath)
        guard let symptomCell = cell as? SymptomTableViewCell else { return cell }
        
        print("HHEERRREEE")
        
        return symptomCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.didSelectSymptom?(indexPath.item)
    }
}
