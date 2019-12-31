//
//  KIM.swift
//  demo-mobile
//
//  Created by k on 30/12/2019.
//  Copyright © 2019 k. All rights reserved.
//

import Foundation
import UIKit

class KIM: NSObject {
    private static var sharedKIM: KIM = {
        return KIM()
    }()
    class func shared() -> KIM {
        return sharedKIM
    }
    override private init() {
    }
    
    var images:Dictionary = [String: UIImage]()
    
    func load(sz_url:String, completion: @escaping(UIImage)->()) {
        if(self.images[sz_url] != nil){
            completion(self.images[sz_url]!)
        }else{
            guard let url = URL(string: sz_url) else { return }
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard let data = data, error == nil else { return }
                print("Download Finished[", data.count, "]:", sz_url)
                self.images[sz_url] = UIImage(data: data)
                DispatchQueue.main.async() {
                    completion(self.images[sz_url]!)
                }
            }.resume()
        }
    }
}
