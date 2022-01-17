//
//  AddEventViewController.swift
//  Notebook-JoyDev
//
//  Created by Egor Slobodskoy on 13.01.2022.
//

import UIKit
// на протокол UIGestureRecognizerDelegate подписан из-за использования строчки ниже, применения которой не знаю
final class AddEventViewController: UIViewController, UIGestureRecognizerDelegate {
    
    let tableView = UITableView(frame: .zero, style: .plain)
    
    let avatarAttributeView = AvatarAttributeView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateLayout(with: self.view.frame.size)
        setupUI()
        setupTableView()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(alongsideTransition: { (contex) in
            self.updateLayout(with: size)
        }, completion: nil)
    }
    
    private func setupUI() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Добавить",
            image: .none,
            primaryAction: .init(
                handler: { _ in self.addButtonClick()}
            ),
            menu: nil
        )
//        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Добавить", style: .done, target: nil, action: #selector(addButtonClick))


        let backBTN = UIBarButtonItem(
            image: nil,
            style: .done,
            target: navigationController,
            action: #selector(UINavigationController.popViewController(animated:))
        )
        backBTN.title = "Отмена"
        navigationItem.leftBarButtonItem = backBTN
        
        // Не знаю для чего используется, но в ответе на вопрос изменения кнопки назад нужно было вставить
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        
        self.view.addSubview(self.tableView)
    }
    
    private func addButtonClick() {
        print("Add Event")
    }
    
    
    private func setupTableView() {
        self.tableView.register(TextAttributeTableViewCell.self, forCellReuseIdentifier: "TextAttributeTableViewCell")
        tableView.separatorStyle = .none
        tableView.clipsToBounds = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = TextAttributeConstants.cellHeight
        tableView.isScrollEnabled = false
    }
    

    private func updateLayout(with size: CGSize) {
        self.tableView.frame = CGRect(origin: .zero, size: size)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return avatarAttributeView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return AvatarAttributeConstantss.height
    }
    
}

extension AddEventViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
            case self.tableView:
                return 5
            default:
                return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let texts: [(title: String, placeholder: String)] = [
            (title: "Имя", placeholder: "Введите имя"),
            (title: "Дата", placeholder: "Введите дату"),
            (title: "Возраст", placeholder: "Добавить"),
            (title: "Пол", placeholder: "Добавить"),
            (title: "Instagram", placeholder: "Добавить")
        ]
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "TextAttributeTableViewCell", for: indexPath) as! TextAttributeTableViewCell

        cell.setTitleLabel(string: texts[indexPath.row].title)
        cell.setPlaceholder(string: texts[indexPath.row].placeholder)
        if indexPath.row == 0 {
            cell.setDisablingTextField(bool: false)
        } else {
            cell.setDisablingTextField(bool: true)
        }

        return cell
        
    }
    
}

extension AddEventViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            return
        }

        let alert = UIAlertController(title: "Yay!", message: "You selected row number \(indexPath.row)", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
}
