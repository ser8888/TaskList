//
//  TaskListViewController.swift
//  TaskList
//
//  Created by Sergejs Tiselskis on 21/08/2022.
//

import UIKit

class TaskListViewController: UITableViewController {
    
    private let cellId = "task"     //ячейка
                    //создаем массив чтобы его отобразить в таблице
    private var taskList: [Task] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        //регистрируем ячейку таблицы
        //UItableView.self - это означает тип данных для ячейки
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
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

extension TaskListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        taskList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        let task = taskList[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = task.title
        cell.contentConfiguration = content
        return cell
    }
    
}
