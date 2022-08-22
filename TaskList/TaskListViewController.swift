//
//  TaskListViewController.swift
//  TaskList
//
//  Created by Sergejs Tiselskis on 21/08/2022.
//

import UIKit

class TaskListViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavigationBar()
        
    }

    
    private func setupNavigationBar() {
        title = "Task List"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        //чтобы поработать на внешнем видом NavBar надо инициализировать экземпляр класса UINavigationBarAppearance
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.backgroundColor = UIColor(
            red: 21/255,
            green: 101/255,
            blue: 192/255,
            alpha: 194/255
        )
    //цвет текста .white доступен только для UIColor
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    // чтобы изменился цвет на экране
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
    // добавляем кнопку добавить(+)
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addNewTask)
        )
        // tintcolor определяет цвет всех элементов находящихся внутри NavigationBar
        navigationController?.navigationBar.tintColor = .white
        
        
    }
    
    @objc private func addNewTask() {
        let TaskVC = TaskViewController()  // создали экземпляр класса для перехода на другой VC
        present(TaskVC, animated: true)  //делаем модальный переход по умолчанию
        
        
    }
    
    
    

}

