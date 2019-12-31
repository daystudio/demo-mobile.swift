//
//  VCForm.swift
//  demo-mobile
//
//  Created by k on 31/12/2019.
//  Copyright © 2019 k. All rights reserved.
//

import UIKit

class VCForm: UITableViewController {
    @IBOutlet var tv_u: UITextField!
    @IBOutlet var tv_a: UITextField!
    @IBOutlet var tv_t: UITextField!
    @IBOutlet var tv_c: UITextView!
    @IBOutlet var tv_i: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector:#selector(noti_add_item(notification:)), name:Notification.Name("add_item"), object: nil)
    }
    
    @objc func noti_add_item(notification: NSNotification){
        print("perform save")
        let sz_u = tv_u.text ?? ""
        let sz_i = tv_i.text ?? ""
        let sz_t = tv_t.text ?? ""
        let sz_c = tv_c.text ?? ""
        let sz_a = tv_a.text ?? ""
        
        KData.shared().save(u:sz_u, a:sz_a, t:sz_t, c:sz_c, i:sz_i){
            NotificationCenter.default.post(name:Notification.Name("reload_table"), object: nil)
        }
    }
}
