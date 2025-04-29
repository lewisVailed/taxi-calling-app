//
//  ChatController.swift
//  taxi-calling-app
//
//  Created by Ayberk Bilgiç on 22.01.2025.
//

import UIKit
import SnapKit


class ChatController: UIViewController {
    
    let names: [String] = ["Lewin", "Richard", "George", "Morrison", "Saul"]
    let taxiNumber: [String] = ["TX101","TX121","TX181","TX191","TX151"]
    
    let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.backgroundColor = Colors.background
        table.allowsSelection = true
        
        
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    private func setupUI() {
        self.makeOpaqueNavBar()
        self.navigationItem.title = "Chat"
        view.backgroundColor = Colors.background
    
        
        self.view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.trailing.equalTo(self.view.snp.trailing)
            make.leading.equalTo(self.view.snp.leading)
            make.top.equalTo(self.view.snp.top)
            make.bottom.equalTo(self.view.snp.bottom)
        }
    }

}

extension ChatController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = names[indexPath.row] + " " + taxiNumber[indexPath.row]
        cell.backgroundColor = Colors.softB
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let navigation = MessageController()
        let selectedName = names[indexPath.row] + " " + taxiNumber[indexPath.row]
        navigation.chatTitle = selectedName
        navigationController?.pushViewController(navigation, animated: true)
        
    }
    
}
