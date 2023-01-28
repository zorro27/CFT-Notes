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
    var noteArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        tapButton()
        createImage(image: image, view: view).create()
        createTable(table: table, image: image, view: view).create()
        createAddButton(button: button, view: view, table: table).create()
    }
}

extension NotesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noteArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = noteArray[indexPath.row]
        cell.selectionStyle = .default
        return cell
    }
    
    func tapButton() {
        button.addTarget(self, action: #selector(addNote), for: .touchUpInside)
    }
    
    @objc func addNote() {
        noteArray.append("good day")
        table.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = createNoteViewController()
        if let sheet = vc.sheetPresentationController{
            sheet.detents = [.medium()]
            sheet.preferredCornerRadius = 20
        }
        tableView.deselectRow(at: indexPath, animated: true)
        present(vc, animated: true)
    }
}
