//
//  RegistrationScreenViewController.swift
//  Notebook-JoyDev
//
//  Created by Egor Slobodskoy on 17.01.2022.
//

import UIKit

class RegistrationScreenViewController: UIViewController {
    
    private let tableView = UITableView(frame: .zero, style: .plain)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateLayout(with: self.view.frame.size)
        setupUI()
        setupTableView()

    }
    
    private func setupUI() {
        view.addSubview(tableView)
    }
    
    private func setupTableView() {
        tableView.register(EntryOptionTableViewCell.self, forCellReuseIdentifier: "EntryOptionTableViewCell")
//        tableView.register(FormsTableViewCell.self, forCellReuseIdentifier: "FormsTableViewCell")
        tableView.register(TextFieldsTableViewCell.self, forCellReuseIdentifier: "TextFieldsTableViewCell")
        tableView.register(AgreementTableViewCell.self, forCellReuseIdentifier: "AgreementTableViewCell")
        tableView.register(RegisterButtonTableViewCell.self, forCellReuseIdentifier: "RegisterButtonTableViewCell")
        tableView.separatorStyle = .none
        tableView.clipsToBounds = false
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func updateLayout(with size: CGSize) {
        self.tableView.frame = CGRect(origin: .zero, size: size)
    }

}

extension RegistrationScreenViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if tableView == self.tableView {
            let entryOptionCell = self.tableView.dequeueReusableCell(withIdentifier: "EntryOptionTableViewCell", for: indexPath) as! EntryOptionTableViewCell
//            let formsTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "FormsTableViewCell", for: indexPath) as! FormsTableViewCell
            let textFieldCell = self.tableView.dequeueReusableCell(withIdentifier: "TextFieldsTableViewCell", for: indexPath) as! TextFieldsTableViewCell
            let agreementTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "AgreementTableViewCell", for: indexPath) as! AgreementTableViewCell
            let registerButtonTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "RegisterButtonTableViewCell", for: indexPath) as! RegisterButtonTableViewCell
            
            
            let row = indexPath.row
            
            let placeholders = ["Логин", "E-mail", "Пароль", "Повторить пароль"]
            
            switch row {
                case 0:
                    return entryOptionCell
//                case 1:
//                    return formsTableViewCell
                case 1...4:
                    textFieldCell.setPlaceholderTextField(text: placeholders[row - 1])
                    return textFieldCell
                case 5:
                    return agreementTableViewCell
                case 6:
                    return registerButtonTableViewCell
                default:
                    return UITableViewCell()
            }
        }
        
        return UITableViewCell()
    }
    
    
}

extension RegistrationScreenViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension

    }
}

