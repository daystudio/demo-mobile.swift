//
//  KData.swift
//  demo-mobile
//
//  Created by k on 30/12/2019.
//  Copyright © 2019 k. All rights reserved.
//

import Foundation

class KData: NSObject {
    private static var sharedKData: KData = {
        return KData()
    }()
    class func shared() -> KData {
        return sharedKData
    }
    override private init() {
    }
    
    func load(completion: @escaping()->()) {
        guard let url = URL(string: User.SZ_URL) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                guard let data = data else { return }
                let ps = try JSONDecoder().decode([P].self, from: data)
                DispatchQueue.main.async {
                    User.posts = ps
                    completion()
                    print("posts=", ps)
                }
            } catch {
                print("Error decoding JSON: ", error)
            }
        }.resume()
    }
    
    func save(u:String, a:String, t:String, c:String, i:String, completion: @escaping()->()) {
        guard let url = URL(string: User.SZ_URL) else { return }
        var request = URLRequest(url:url)
        request.httpMethod = "POST"
        
        let json = [
            "u":u,
            "a":a,
            "t":t,
            "c":c,
            "i":i,
        ]
        if let jsonData = try? JSONSerialization.data(withJSONObject:json, options: []){
            URLSession.shared.uploadTask(with: request, from: jsonData) { (data, response, error) in
                do {
                    guard let data = data else { return }
                    let ps = try JSONDecoder().decode([P].self, from: data)
                    DispatchQueue.main.async {
                        User.posts = ps
                        completion()
                        print("posts=", ps)
                    }
                } catch {
                    print("Error decoding JSON: ", error)
                }
            }.resume()
        }
    }
}
