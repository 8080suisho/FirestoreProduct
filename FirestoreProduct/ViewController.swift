//
//  ViewController.swift
//  FirestoreProduct
//
//  Created by 諸星水晶 on 2020/09/29.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    @IBOutlet var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.placeholder = "Name"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        nameTextField.text = ""
    }
    
    override func viewDidAppear(_ animated: Bool) {
         super.viewDidAppear(animated)
            
         //もしユーザー名が保存されてるなら
         if let _ = UserDefaults.standard.object(forKey: "loginName") {
              performSegue(withIdentifier: "toChat", sender: nil)
         }
            
    }
    
    
    
    
    @IBAction func login() {

        //もしtextFieldに文字が入力されてるなら
          if nameTextField.text != "" {
                
              let ud = UserDefaults.standard
                
              //ユーザー名をUDに保存
              ud.set(nameTextField.text, forKey: "loginName")
                
              //次の画面に遷移するなど
              performSegue(withIdentifier: "toChat", sender: nil)
                
          //もしtextFieldに何も入力されてなければ
          } else {
            print("名前を入力してください")


          }

    }

}

