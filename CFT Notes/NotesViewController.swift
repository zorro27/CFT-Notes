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
    let textNote = """
    Почему я хочу пройти стажировку в ЦФТ:
    1. Большая современная компания с крутыми спецами от которых можно перенять опыт;
    2. Опыт работы с финансовым сектором;
    3. Большое комьюнити;
    4. Современный стек.
    """
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        tapButton()
        addNoteArray()
        createImage(image: image, view: view).create()
        createTable(table: table, image: image, view: view).create()
        createAddButton(button: button, view: view, table: table).create()
    }
}

extension NotesViewController: UITableViewDelegate, UITableViewDataSource, createNoteVCDelegate {
    func didEnterText(text: String?) {
        noteArray.append(text!)
        table.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noteArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = noteArray[indexPath.row]
        cell.selectionStyle = .default
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            noteArray.remove(at: indexPath.row)
            table.reloadData()
        }
    }
    
    func tapButton() {
        button.addTarget(self, action: #selector(addNote), for: .touchUpInside)
    }
    
    @objc func addNote() {
        openVCNote(text: nil)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        openVCNote(text: noteArray[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func openVCNote(text: String?) {
        let vc = createNoteViewController()
        vc.delegate = self
        if let sheet = vc.sheetPresentationController{
            sheet.detents = [.medium()]
            sheet.preferredCornerRadius = 20
            if text == nil {
                vc.textNote = ""
            } else {
                vc.textNote = text ?? "Ошибка передачи значения"
            }
            present(vc, animated: true)
        }
    }
        
        func addNoteArray() {
            if noteArray.isEmpty {
                noteArray.append(textNote)
            }
        }
    }
