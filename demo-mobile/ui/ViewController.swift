//
//  ViewController.swift
//  demo-mobile
//
//  Created by k on 30/12/2019.
//  Copyright © 2019 k. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate , UITableViewDataSource{
    @IBOutlet var tblList: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector:#selector(noti_reload_table(notification:)), name:Notification.Name("reload_table"), object: nil)
        if(self.tblList != nil){
            self.tblList.estimatedRowHeight = 100
            self.tblList.rowHeight = UITableView.automaticDimension
            self.tblList.dataSource = self
            self.tblList.delegate = self
            
            KData.shared().load {
                self.tblList.reloadData()
            }
        }
    }
    @objc func noti_reload_table(notification: NSNotification){
        self.tblList.reloadData()
    }
    @IBAction func unwindToMain(_ segue: UIStoryboardSegue) {
        print("cancel")
    }
    @IBAction func save(_ segue: UIStoryboardSegue) {
        print("save")
        self.tblList.setContentOffset(.zero, animated: false)
        NotificationCenter.default.post(name:Notification.Name("add_item"), object: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return User.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:CellPost = tableView.dequeueReusableCell(withIdentifier: "CellPost") as! CellPost
        
        cell.lbl_n?.text = User.posts[indexPath.row].u
        cell.lbl_t?.text = User.posts[indexPath.row].t
        cell.lbl_c?.text = User.posts[indexPath.row].c
        KIM.shared().load(sz_url: User.posts[indexPath.row].a) { image in
            cell.iv_avatar?.image  = image
            cell.iv_avatar.setNeedsLayout()
            cell.setNeedsLayout()
            cell.layoutIfNeeded()
            UIView.performWithoutAnimation {
                tableView.beginUpdates()
                tableView.endUpdates()
            }
        }
        KIM.shared().load(sz_url: User.posts[indexPath.row].i) { image in
            cell.iv_main?.image  = image
            cell.iv_main.setNeedsLayout()
            cell.setNeedsLayout()
            cell.layoutIfNeeded()
            UIView.performWithoutAnimation {
                tableView.beginUpdates()
                tableView.endUpdates()
            }
        }
        return cell
    }
}

