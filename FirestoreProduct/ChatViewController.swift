//
//  ChatViewController.swift
//  FirestoreProduct
//
//  Created by 諸星水晶 on 2020/09/29.
//

import UIKit
import Firebase

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var listTableView: UITableView!
    var postArray = [Any]()
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        listTableView.delegate = self
        listTableView.dataSource = self
        
        let xib = UINib(nibName: "ChatTableViewCell", bundle: nil)
        listTableView.register(xib, forCellReuseIdentifier: "Cell")
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        super.viewWillAppear(animated)
        db.collection("users").getDocuments { (snapshot, error) in
            if error == nil, let snapshot = snapshot {
                self.postArray = []
                for document in snapshot.documents {
                    let data = document.data()
                    let post = Post(data: data)
                    self.postArray.append(post)
                }
                print(self.postArray)
            }
        }
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 66
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ChatTableViewCell
        cell.textLabel?.text = "テスト"
        
        return cell
    }
    
    @IBAction func logout(){
        UserDefaults.standard.removeObject(forKey: "loginName")
        self.dismiss(animated: true, completion: nil)
    }
    
    
    

}
