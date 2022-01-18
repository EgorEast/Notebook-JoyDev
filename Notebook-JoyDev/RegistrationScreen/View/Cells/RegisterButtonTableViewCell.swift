//
//  RegisterButtonTableViewCell.swift
//  Notebook-JoyDev
//
//  Created by Maksom Kolbas on 18.01.2022.
//

import UIKit

class RegisterButtonTableViewCell: UITableViewCell {

    let containerView = UIView()
    
    let button: UIButton = {
        let button = UIButton()
        button.setTitle("Зарегистрироваться", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(clickOnButton), for: .touchUpInside)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
        setupTableView()
    }
    
    @objc private func clickOnButton() {
        print("Register")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        selectionStyle = .none
        backgroundColor = .clear
        
        contentView.addSubview(containerView)
        
        containerView.addSubview(button)
    }
    private func setupTableView() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 40),
            
            button.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            button.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            button.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
}
