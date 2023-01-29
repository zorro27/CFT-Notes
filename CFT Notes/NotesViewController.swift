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
    var a = 0
    
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
        
        if let value = UserDefaults.standard.array(forKey: "notes") as? [String] {
            noteArray = value
        }
    }
}

extension NotesViewController: UITableViewDelegate, UITableViewDataSource, createNoteVCDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noteArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = noteArray[indexPath.row]
        cell.selectionStyle = .default
        return cell
    }
    
    func didEnterText(text: String?, number: Int) {
        if a == 0 {
        noteArray.insert(text!, at: number)
        } else {
        noteArray.insert(text!, at: number)
            noteArray.remove(at: number + 1)
        }
        UserDefaults.standard.set(noteArray, forKey: "notes")
        table.reloadData()
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            noteArray.remove(at: indexPath.row)
            UserDefaults.standard.set(noteArray, forKey: "notes")
            table.reloadData()
        }
    }
    
    func tapButton() {
        a = 0
        button.addTarget(self, action: #selector(addNote), for: .touchUpInside)
    }
    
    @objc func addNote() {
        openVCNote(text: nil, num: nil)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        a = 1
        openVCNote(text: noteArray[indexPath.row], num: indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func openVCNote(text: String?, num: Int?) {
        let vc = createNoteViewController()
        vc.delegate = self
        if let sheet = vc.sheetPresentationController{
            sheet.detents = [.medium()]
            sheet.preferredCornerRadius = 20
            if text == nil {
                vc.textNote = ""
                vc.numberNotes = noteArray.count
            } else {
                vc.textNote = text ?? "Ошибка передачи значения"
                vc.numberNotes = num
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
