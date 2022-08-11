//
//  ViewController.swift
//  0803Demo_03
//
//  Created by Huang on 2022/8/3.
//

import UIKit

class ViewController: UIViewController {

    var guessNumber = 0
    var guessCount = 0
    var guessSix = 0
    
    @IBOutlet weak var ansLabel: UILabel!
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var msgLabel: UILabel!
    @IBOutlet weak var guessCountLabel: UILabel!
    @IBOutlet weak var inputMsgLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guessNumber = Int(arc4random_uniform(50))
        ansLabel.text = String(guessNumber)
    }

    @IBAction func guessButton(_ sender: Any) {
        if inputTextField.text == "" {
            inputMsgLabel.text = "不可以空白，請輸入數字"
            return
        }
        inputMsgLabel.text = ""
        guessSix += 1
        
        if guessSix > 6 {
            msgLabel.text = "總共只有 6 次機會"
            return
        }
        if inputTextField.text == ansLabel.text {
            msgLabel.text = "答對了"
            guessCount += 1
            guessCountLabel.text = "總共猜了 \(guessCount) 次"
            return
        }
        if inputTextField.text != ansLabel.text {
            msgLabel.text = "猜錯了...."
            guessCount += 1
            guessCountLabel.text = "總共猜了 \(guessCount) 次"
        }
        
        let inputVule = Int(inputTextField!.text!)

        if inputVule! > 50 {
            inputMsgLabel.text = "您輸入的數字超過50了，請重新輸入！！"
        }
        inputTextField.text = ""
    }
    
    func refresh() {
        viewDidLoad()
        guessNumber = 0
        guessCount = 0
        guessSix = 0
        inputTextField.text = ""
        msgLabel.text = "..."
        guessCountLabel.text = "猜幾次了"
    }
    @IBAction func againButton(_ sender: Any) {
        refresh()
    }
}

