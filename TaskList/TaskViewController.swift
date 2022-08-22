//
//  TaskViewController.swift
//  TaskList
//
//  Created by Sergejs Tiselskis on 22/08/2022.
//

import UIKit
import CoreData

class TaskViewController: UIViewController {

    var delegate: TaskViewControllerDelegate!

    //создаем свойство AppDelegate, создаем Managed Object Context, там создаем модели данных и записываем на диск
    private let viewContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    //надо подготовить текстовое поле чтобы его было видно
private lazy var taskTextField: UITextField = {
       let textField = UITextField()
        //нельзя работать с текстовым поля пока не появился VIEW
        textField.borderStyle = .roundedRect
        textField.placeholder = "New Task"
        return textField
    }()
    
    private lazy var saveButton: UIButton = {
        createButton(
            withTitle: "Save Task",
            andColor: UIColor(
                red: 21/255,
                green: 101/255,
                blue: 192/255,
                alpha: 194/255
            ), action: UIAction { [unowned self] _ in
                save()
            }
        )
    } ()
    
    private lazy var cancellButton: UIButton = {
        createButton(
            withTitle: "Cancel",
            andColor: .systemRed,
            action: UIAction { [ unowned self] _ in
            dismiss(animated: true)
                }
            )
        
    } ()

    override func viewDidLoad() {
        super.viewDidLoad()
        //после загрузки View - мы обрашаемся в subview и загружаем такстовое поле
        view.backgroundColor = .white
        setupSubviews(taskTextField, saveButton, cancellButton)
        setConstraints()
 //       view.addSubview(taskTextField)
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
        
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: taskTextField.bottomAnchor, constant: 20),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
        
        cancellButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cancellButton.topAnchor.constraint(equalTo: saveButton.bottomAnchor, constant: 20),
            cancellButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            cancellButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
        
    }
    // вспомогательный метод который создает кнопки action - действие при нажатии на кнопку
    private func createButton(withTitle title: String, andColor color: UIColor, action: UIAction) -> UIButton {
        var attributes = AttributeContainer()
        attributes.font = UIFont.boldSystemFont(ofSize: 18)
        //сначала надо настроить конфигурацию кнопки и потом ее инициализировать
        var buttonCongiration = UIButton.Configuration.filled()
        buttonCongiration.attributedTitle = AttributedString(title, attributes: attributes)
        buttonCongiration.baseBackgroundColor = color
        buttonCongiration.buttonSize = .medium  // medium по умолчанию
 //       buttonCongiration.title = "Save Task"  - не нужно если менем цвет и шрифт
        return UIButton(configuration: buttonCongiration, primaryAction: action)
        }
        
//    private func save() {
//        //сначала создаем экзмеляр модели а потом записываем на диск.
//        // мы создали экземпляр модели Task
//        let task = Task(context: viewContext)
//        //изменили его и надо его теперь сохранить
//        task.title = taskTextField.text
//        if viewContext.hasChanges{
//            do {
//                try viewContext.save()
//            } catch let error {
//                print(error)
//            }
//        }
//        delegate.reloadData()
//        dismiss(animated: true)
//    }
//
//
//    }
//
//
    private func save() {
        let task = Task(context: viewContext)
        task.title = taskTextField.text
        
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            } catch let error {
                print(error)
            }
        }
        
        delegate.reloadData()
        dismiss(animated: true)
    }
}
