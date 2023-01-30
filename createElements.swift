//
//  createElements.swift
//  CFT Notes
//
//  Created by Роман Зобнин on 24.01.2023.
//

import Foundation
import UIKit
import SnapKit

struct createImage {
    let image: UIImageView
    let view: UIView
    func create () {
        image.image = UIImage(named: "logo")
        image.contentMode = .scaleAspectFill
        view.addSubview(image)
        image.snp.makeConstraints { make in
            make.right.left.equalToSuperview().inset(30)
            make.top.equalToSuperview().inset(view.frame.height/10)
        }
    }
}

struct createTable {
    let table: UITableView
    let image: UIImageView
    let view: UIView
    func create() {
        view.addSubview(table)
        table.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(150)
            make.right.left.bottom.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(100)
        }
    }
}

struct createAddButton {
    let button: UIButton
    let view: UIView
    let table: UITableView
    func create() {
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 216/255, green: 35/255, blue: 53/255, alpha: 1)
        button.layer.cornerRadius = 20
        button.setTitle("+", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(20)
            make.left.equalToSuperview().inset(view.frame.height/3)
            make.bottom.equalToSuperview().inset(60)
        }
    }
}

struct createTextView{
    let textView: UITextView
    let view: UIView
    func create () {
        textView.layer.cornerRadius = 20
        textView.font = .systemFont(ofSize: 18)
        view.addSubview(textView)
        textView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(30)
            make.top.equalToSuperview().inset(60)
            make.height.equalTo(220)
        }
    }
}

struct createLabel {
    let label: UILabel
    let view: UIView
    func create () {
        label.text = "Введите текст новой заметки:"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = UIColor(red: 216/255, green: 35/255, blue: 53/255, alpha: 1)
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.left.right.equalToSuperview().inset(20)
        }
    }
}

struct createButton {
    let button: UIButton
    let view: UIView
    let textView: UITextView
    func create() {
        button.setTitle("Сохранить", for: .normal)
        button.backgroundColor = UIColor(red: 216/255, green: 35/255, blue: 53/255, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.bottom.equalTo(textView).inset(-60)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(40)
        }
    }
}
