//
//  createNoteViewController.swift
//  CFT Notes
//
//  Created by Роман Зобнин on 25.01.2023.
//

import UIKit

protocol СreateNoteVCDelegate: AnyObject {
    func didEnterText(text: String?, number: Int)
}

class СreateNoteViewController: UIViewController{
    let textView = UITextView()
    let image = UIImageView()
    let label = UILabel()
    let button = UIButton(type: .system)
    var textNote = ""
    var numberNotes: Int? = nil
    weak var delegate: СreateNoteVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 216/255, green: 216/255, blue: 216/255, alpha: 1)
        createTextView(textView: textView, view: view).create()
        createLabel(label: label, view: view).create()
        createButton(button: button, view: view, textView: textView).create()
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        textView.text = textNote
    }
    
    @objc func didTapButton() {
        if textView.text.isEmpty {
            dismiss(animated: true)
        } else {
            delegate?.didEnterText(text: textView.text, number: numberNotes!)
            dismiss(animated: true)
        }
    }
}

