//
//  Page1ViewController.swift
//  DemoNotification
//
//  Created by Chao Shin on 2018/4/22.
//  Copyright © 2018 Chao Shin. All rights reserved.
//

import UIKit
import AVFoundation // 發出聲音需要import

struct NotificationInfo {
    static let message = "message"
}

class Page1ViewController: UIViewController {
    
    @objc func youGotMessage(noti: Notification){ // 收到通知後要執行的動作
        if let userInfo = noti.userInfo, let message = userInfo[NotificationInfo.message] {
            let speakMessage =  AVSpeechUtterance(string: "\(message)")
            speakMessage.voice = AVSpeechSynthesisVoice(language: "zh-TW")
            let synth = AVSpeechSynthesizer()
            synth.speak(speakMessage)
        }
    }
    
    @IBAction func unwindSegueBack(segue: UIStoryboardSegue){
        let speakMessage =  AVSpeechUtterance(string: "利用Unwind Segue回到第一頁，並且不傳送資料")
        speakMessage.voice = AVSpeechSynthesisVoice(language: "zh-TW")
        let synth = AVSpeechSynthesizer()
        synth.speak(speakMessage)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /* // 通知的名稱使用常數較不容易打錯
         NotificationCenter.default.addObserver(self, selector:
         #selector(youGotMessage(noti:)), name: Notification.Name("goBackMessage"), object: nil)
         */
        let notificationName = Notification.Name("goBackMessage")
        NotificationCenter.default.addObserver(self, selector:
            #selector(youGotMessage(noti:)), name: notificationName, object: nil) // 註冊addObserver
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
