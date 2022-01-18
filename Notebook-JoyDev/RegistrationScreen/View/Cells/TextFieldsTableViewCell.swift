//
//  TextFieldsTableViewCell.swift
//  Notebook-JoyDev
//
//  Created by Egor Slobodskoy on 18.01.2022.
//

import UIKit

class TextFieldsTableViewCell: UITableViewCell {

    private let containerView = UIView()
    
    private let textField: UITextField = {
        let textField = UITextField()
        textField.addTarget(self, action: #selector(textFieldHandler), for: .editingChanged)
        
        return textField
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
        setupLayout()
    }
    
    @objc private func textFieldHandler(sender: UITextField) {
        print(sender.text ?? "")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setPlaceholderTextField(text: String) {
        textField.placeholder = text
    }
    
    private func setupUI() {
        selectionStyle = .none
        backgroundColor = .clear
        
        contentView.addSubview(containerView)
        
        containerView.addSubview(textField)
        
        textField.borderStyle = .roundedRect
        
    }
    
    private func setupLayout() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        

        NSLayoutConstraint.activate([
            containerView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            textField.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 5),
            textField.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -5),
            textField.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 20),
            textField.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -30),
            
        ])
    }
    
}
