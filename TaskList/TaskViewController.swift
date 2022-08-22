//
//  TaskViewController.swift
//  TaskList
//
//  Created by Sergejs Tiselskis on 22/08/2022.
//

import UIKit

class TaskViewController: UIViewController {
//надо подготовить текстовое поле чтобы его было видно
    
private lazy var taskTextField: UITextField = {
       let textField = UITextField()
        //нельзя работать с текстовым поля пока не появился VIEW
        textField.borderStyle = .roundedRect
        textField.placeholder = "New Task"
        return textField
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        //после загрузки View - мы обрашаемся в subview и загружаем такстовое поле
        view.backgroundColor = .white
        setupSubviews(taskTextField)
        setConstraints()
        view.addSubview(taskTextField)
    }
    
    private func setupSubviews(_ subview: UIView...) {
        subview.forEach { subview in
                        view.addSubview(subview)
        }
    }
    
    private func setConstraints() {
        //отключаем кострайнты их сториборда
        taskTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            taskTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            taskTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            taskTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        
        ])
    }
    
}
