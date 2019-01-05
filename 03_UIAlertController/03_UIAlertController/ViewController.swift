//
//  ViewController.swift
//  03_UIAlertController
//
//  Created by admin on 05/07/2018.
//  Copyright © 2018 Maksim Nosov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel01: UILabel!
    @IBOutlet weak var questionLabel02: UILabel!
    @IBOutlet weak var questionLabel03: UILabel!
    @IBOutlet weak var questionLabel04: UILabel!
    
    @IBOutlet weak var answerLabel01: UILabel!
    @IBOutlet weak var answerLabel02: UILabel!
    @IBOutlet weak var answerLabel03: UILabel!
    @IBOutlet weak var answerLabel04: UILabel!
    
    @IBOutlet weak var goodLabel: UILabel!
    @IBOutlet weak var okLabel: UILabel!
    
    let arrayOfQuestions = ["Как вас зовут",
                            "Какая ваша фамилия",
                            "Сколько вам лет",
                            "Есть ли у вас домашнее животное"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let arrayOfQuestionLabel = [questionLabel01, questionLabel02, questionLabel03, questionLabel04]
        
        for i in 0..<arrayOfQuestionLabel.count {
            setQuestions(array: arrayOfQuestionLabel as! [UILabel]) { (arrayOfQuestionLabel) in
                arrayOfQuestionLabel[i].text = self.arrayOfQuestions[i]
            }
        }
    }
    
    @IBAction func pressClosureButton(_ sender: UIButton) {
        putValueToLabel(text: "Good") { (value) in
            self.goodLabel.text = value
        }
        
        putValueToLabel(text: "Ok") { (value) in
            self.okLabel.text = value
        }
    }
    
    @IBAction func showQuestion(_ sender: UIButton){
        
        let number = Int(arc4random_uniform(UInt32(arrayOfQuestions.count)))
        let question = "Вопрос \(number+1)"
        
        switch number {
        case 0: showQuestionToUser(title: question, message: arrayOfQuestions[number]) { (answer) in
            self.answerLabel01.text = answer
            }
        case 1: showQuestionToUser(title: question, message: arrayOfQuestions[number]) { (answer) in
            self.answerLabel02.text = answer
            }
        case 2: showQuestionToUser(title: question, message: arrayOfQuestions[number]) { (answer) in
            self.answerLabel03.text = answer
            }
        case 3: showQuestionToUser(title: question, message: arrayOfQuestions[number]) { (answer) in
            self.answerLabel04.text = answer
            }
        default: break
        }
        
    }
    
}

extension UIViewController {
    
    // Установка значений всех Label в вопросами
    func setQuestions(array: [UILabel]!, completion: @escaping ([UILabel]) -> ()) { completion(array) }
    
    // Установить значение Good и Ok при нажатии кнопки Closure
    func putValueToLabel(text: String, completion: @escaping (String) -> ()) { completion(text) }
    
    // Установить label с ответом из UIAlert
    func showQuestionToUser(title: String, message: String, completion: @escaping (String) -> ()) {
        
        // Создаем Alert с заголовком и сообщением
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        // Добавить TextField в UIAlert
        alert.addTextField { (textField) in
            textField.placeholder = "Введите ваш ответ..."
        }
        
        // Назначаем action с кнопкой и в нем вызываем closure completion для передачи ответа в label
        alert.addAction(UIAlertAction(title: "Готово", style: .default, handler: { action in
            if let answer = alert.textFields?.first?.text {
                completion(answer)
            }
        }))
        // отображение настроенного и созданного Alert
        self.present(alert, animated: true, completion: nil)
    }
}
























//    func setupQuestionLabels(labelsArray: [UILabel]) {
//        for i in 0..<labelsArray.count {
//            self.putValueToLabel(text: labelsArray[i].text ?? "",
//                                 label: labelsArray[i],
//                                 completion: { (text, label) -> () in return })
//        }
//    }

//    func putValueToLabel(text: String,
//                         label: UILabel,
//                         completion: (String, UILabel) -> ())
//    {
//        label.text = text
//    }




//    func showQuestionToUser(question: String, numberOfQuestion: Int, label: UILabel) {
//
//        let alert = UIAlertController(title: "Вопрос №\(numberOfQuestion + 1)", message: "\(question)?", preferredStyle: .alert)
//
//        alert.addTextField { (textField) in
//            textField.placeholder = "Введите ваш ответ..."
//        }
//
//        alert.addAction(UIAlertAction(title: "Готово", style: .default, handler: { action in
//            if let answer = alert.textFields?.first?.text {
//                self.putValueToLabel(text: answer, label: label, completion: { (text, label) -> () in return })
//            }
//        }))
//        self.present(alert, animated: true, completion: nil)
//    }
//



