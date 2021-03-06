//
//  PostMessageViewController.swift
//  FirestoreProduct
//
//  Created by 諸星水晶 on 2020/09/29.
//

import UIKit
import Firebase

class PostMessageViewController: UIViewController {
    
    @IBOutlet var messageTextField: UITextField!
    var message = ""
    var name = ""
    var postTime = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        messageTextField.placeholder = "Content"

        
    }
    
    @IBAction func Post(){
        message = messageTextField.text!
        name = UserDefaults.standard.object(forKey: "loginName") as! String
        
        let date = Date()
        let df = DateFormatter()
        
        df.dateFormat = "yyyy/MM/dd"
        postTime = (df.string(from: date))
        
        let db = Firestore.firestore()
        
        db.collection("users").document().setData([
                "userName": name,
                "message": message,
                "postTime":postTime,
                "lastUpdated": FieldValue.serverTimestamp()
            ]) { error in
            if error != nil {
                    // エラー処理
                    print("エラー")
                    return
                }
                // 成功したときの処理
                self.dismiss(animated: true, completion: nil)
            }
    }
    

    

}
