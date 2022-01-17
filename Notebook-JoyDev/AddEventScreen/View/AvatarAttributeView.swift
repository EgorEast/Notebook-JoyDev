//
//  AvatarAttributeView.swift
//  Notebook-JoyDev
//
//  Created by Egor Slobodskoy on 13.01.2022.
//

import UIKit

enum AvatarAttributeConstantss {
    static let height = (170.0 / UIScreen.main.bounds.height) * UIScreen.main.bounds.height
    static var avatarSize: Double = {
        return AvatarAttributeConstantss.height * 0.77
    }()
}

class AvatarAttributeView: UIView {
    
    private let containerView = UIView()
    
    var avatarImageView: UIImageView = {
        let imageView = UIImageView(
            image: UIImage(named: "EmptyAvatar")
        )
        imageView.frame.size = CGSize(
            width: AvatarAttributeConstantss.avatarSize,
            height: AvatarAttributeConstantss.avatarSize
        )
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        imageView.clipsToBounds = true
        return imageView
    }()
    
    var changePhotoButton: UIButton = {
        let button = UIButton()
        button.frame.size.width = 150
        button.frame.size.height = 20
        button.setTitle("Изменить фото", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.layer.borderColor = .none
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        return button
    }()
    
    @objc func buttonClicked() {
        print("Button Clicked")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    func configure(data: ) {
//
//    }
    
    private func setupUI() {
        
        backgroundColor = .clear
        
        self.addSubview(containerView)
        
        containerView.addSubview(avatarImageView)
        containerView.addSubview(changePhotoButton)
        
    }
    
    private func setupLayout() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        changePhotoButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.leftAnchor.constraint(equalTo: containerView.superview?.leftAnchor ?? self.leftAnchor),
            containerView.topAnchor.constraint(equalTo: containerView.superview?.topAnchor ?? self.topAnchor),
            containerView.rightAnchor.constraint(equalTo: containerView.superview?.rightAnchor ?? self.rightAnchor),
            containerView.bottomAnchor.constraint(equalTo: containerView.superview?.bottomAnchor ?? self.bottomAnchor),
            
            
            avatarImageView.topAnchor.constraint(equalTo: containerView.topAnchor),
            avatarImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            avatarImageView.heightAnchor.constraint(equalToConstant: AvatarAttributeConstantss.avatarSize),
            avatarImageView.widthAnchor.constraint(equalToConstant: AvatarAttributeConstantss.avatarSize),
            
            
            changePhotoButton.centerXAnchor.constraint(equalTo: avatarImageView.centerXAnchor),
            changePhotoButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 10),
            changePhotoButton.heightAnchor.constraint(equalToConstant: changePhotoButton.titleLabel?.font.lineHeight ?? 20),
        ])
    }
    
}
