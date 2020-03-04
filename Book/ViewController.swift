//
//  ViewController.swift
//  movie
//
//  Created by bug on 2020/03/03.
//  Copyright © 2020 jiwan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{
    
    
    @IBOutlet weak var titleTextField: UITextField! {
        didSet {
           titleTextField.delegate = self
        }
    }
    @IBOutlet var nextButton: UIButton!
    @IBAction func tapView(_ sender: UITapGestureRecognizer) { //화면 터치시 키보드 내려가기
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {//키보드에서 done 버튼 누를시 키보드 내려가기
        titleTextField.resignFirstResponder()
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        nextButton.layer.cornerRadius = 10
        nextButton.layer.shadowColor = UIColor.black.cgColor
        nextButton.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        titleTextField.layer.cornerRadius = 10
    }    
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        guard let nextViewController: SecondViewController = segue.destination as? SecondViewController else {
            return
        }
        if self.titleTextField.text != nil {
            nextViewController.bookName = self.titleTextField.text
        }
    }
    
    
}
