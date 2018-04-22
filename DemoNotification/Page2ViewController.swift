//
//  Page2ViewController.swift
//  DemoNotification
//
//  Created by Chao Shin on 2018/4/22.
//  Copyright © 2018 Chao Shin. All rights reserved.
//

import UIKit

extension Notification.Name {
    static let goBackMessage = Notification.Name("goBackMessage")
}

class Page2ViewController: UIViewController {
    
    @IBOutlet weak var goBackPag1Button: UIButton!
    var isButton:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goBackToPage1Press(_ sender: Any) { //利用Unwind segue 回到Page1
        let notificationName = Notification.Name("goBackMessage")
        NotificationCenter.default.post(name: notificationName, object: nil)
        isButton = true
        
    }
    
    override func viewWillDisappear(_ animated: Bool) { // 按下Back回到上一頁時發出通知
        super.viewWillDisappear(animated)
    
        if isButton == false {
        // 使用常數或是利用 extension Notification.Name都可以避免打錯字，extension還有的好處就是容易閱讀
        NotificationCenter.default.post(name: .goBackMessage, object: nil, userInfo: [NotificationInfo.message: "使用Navigation Controller回到第一頁，並且傳送資料"])
        }else{
            isButton = false
        }
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
