//
//  NotesViewController.swift
//  
//
//  Created by Роман Зобнин on 23.01.2023.
//

import UIKit
import SnapKit

class NotesViewController: UIViewController {
    let image = UIImageView()
    let table = UITableView()
    let button = UIButton(type: .system)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        createImage(image: image, view: view).create()
        createTable(table: table, image: image, view: view).create()
        createAddButton(button: button, view: view, table: table).create()
    }
}

extension NotesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "good morning"
        return cell
    }
}
