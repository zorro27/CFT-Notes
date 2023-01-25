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
            make.top.equalTo(image).inset(view.frame.height/10)
            make.right.left.bottom.equalToSuperview().inset(10)
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
