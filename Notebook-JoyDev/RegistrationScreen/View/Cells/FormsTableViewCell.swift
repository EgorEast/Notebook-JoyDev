//
//  FormsTableViewCell.swift
//  Notebook-JoyDev
//
//  Created by Egor Slobodskoy on 18.01.2022.
//

import UIKit

class FormsTableViewCell: UITableViewCell {
    private let containerView = UIView()
    
    private let tableView = UITableView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
//        selectionStyle = .none
        backgroundColor = .clear
        
        contentView.addSubview(containerView)
        containerView.addSubview(tableView)
    }
    
    private func setupTableView() {
        tableView.register(EntryOptionTableViewCell.self, forCellReuseIdentifier: "EntryOptionTableViewCell")
        tableView.register(TextFieldsTableViewCell.self, forCellReuseIdentifier: "TextFieldsTableViewCell")
        tableView.register(AgreementTableViewCell.self, forCellReuseIdentifier: "AgreementTableViewCell")
        tableView.register(RegisterButtonTableViewCell.self, forCellReuseIdentifier: "RegisterButtonTableViewCell")
//        tableView.separatorStyle = .none
        tableView.clipsToBounds = false
        tableView.dataSource = self
        tableView.delegate = self

        tableView.isScrollEnabled = false
    }

    
    private func setupLayout() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            containerView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 500),
            
            tableView.leftAnchor.constraint(equalTo: containerView.leftAnchor),
            tableView.topAnchor.constraint(equalTo: containerView.topAnchor),
            tableView.rightAnchor.constraint(equalTo: containerView.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            
        ])
    }
    
}

extension FormsTableViewCell: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if tableView == self.tableView {
            let textFieldCell = self.tableView.dequeueReusableCell(withIdentifier: "TextFieldsTableViewCell", for: indexPath) as! TextFieldsTableViewCell
            let agreementTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "AgreementTableViewCell", for: indexPath) as! AgreementTableViewCell
            let registerButtonTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "RegisterButtonTableViewCell", for: indexPath) as! RegisterButtonTableViewCell
            
            
            let row = indexPath.row
            
            let placeholders = ["Логин", "E-mail", "Пароль", "Повторить пароль"]
            
            switch row {
                case 0...3:
                    textFieldCell.setPlaceholderTextField(text: placeholders[row])
                    return textFieldCell
                case 4:
                    return agreementTableViewCell
                case 5:
                    return registerButtonTableViewCell
                default:
                    return UITableViewCell()
            }
        }
        
        return UITableViewCell()
    }
    
    
}

extension FormsTableViewCell: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension

    }
}
