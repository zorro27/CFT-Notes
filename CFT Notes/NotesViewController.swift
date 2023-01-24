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


    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        settingImageView()
        settingTableView()
    }
}

extension NotesViewController: UITableViewDelegate, UITableViewDataSource {
    func settingImageView(){
        image.image = UIImage(named: "logo")
        image.contentMode = .scaleAspectFill
        view.addSubview(image)
        image.snp.makeConstraints { make in
            make.right.left.equalToSuperview().inset(30)
            make.top.equalToSuperview().inset(view.frame.height/10)
        }
    }
    
    func settingTableView(){
        view.addSubview(table)
        table.snp.makeConstraints { make in
            make.top.equalTo(image).inset(view.frame.height/10)
            make.right.left.bottom.equalToSuperview().inset(10)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell = UITableViewCell()
          cell.textLabel?.text = "good morning"
          return cell
      }

}
