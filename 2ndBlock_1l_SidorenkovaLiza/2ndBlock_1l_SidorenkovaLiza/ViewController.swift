//
//  ViewController.swift
//  1l_SL
//
//  Created by Elizaveta Sidorenkova on 08.09.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var loginTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    let dict = ["admin" : "123456", "guest" : "654321", "lisa" : "300360"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.addObservers()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.removeObservers()
    }
    
    private func addGesture() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(handleGesture))
        self.scrollView.addGestureRecognizer(gesture)
    }
    
    @objc private func handleGesture() {
        self.scrollView.endEditing(true)
    }
    
    
    private func addObservers() {
        NotificationCenter.default
            .addObserver(
                self,
                selector: #selector(handleKeyboardWillShow),
                name: UIResponder.keyboardWillShowNotification,
                object: nil)
        
        NotificationCenter.default
            .addObserver(
                self,
                selector: #selector(handleKeyboardWillHide),
                name: UIResponder.keyboardWillHideNotification,
                object: nil)
    }
    
    private func removeObservers() {
        NotificationCenter.default
            .removeObserver(
                self,
                name: UIResponder.keyboardWillShowNotification,
                object: nil)
        
        NotificationCenter.default
            .removeObserver(
                self,
                name: UIResponder.keyboardWillHideNotification,
                object: nil)
    }
    
    @objc func handleKeyboardWillShow(){
        self.scrollView.contentInset.bottom += 220
    }
    
    @objc func handleKeyboardWillHide(){
        self.scrollView.contentInset.bottom = 0
        
    }
    
    @IBAction func onButtonPressed(_ sender: Any) {
        let login = loginTextField.text!
        let password = passwordTextField.text!
        
        if dict[login] != nil {
            if password == dict[login] {
                print("Успешная авторизация")
            } else {
                print("Неуспешная авторизация")
            }
        } else {
            print("Неуспешная авторизация")
        }
        
    }
    
}
