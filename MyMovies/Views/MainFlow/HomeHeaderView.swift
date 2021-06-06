//
//  HomeHeaderView.swift
//  MyMovies
//
//  Created by Franco Ghiotti on 6/6/21.
//

import UIKit

class HomeHeaderView: BaseView {
    
    lazy var searchTextField = MainTextField(frame: .zero)
    private lazy var searchButton = UIImageView(frame: .zero)

    
    override func addSubviews() {
        addSubview(searchTextField)
        addSubview(searchButton)
    }
    
    override func addConstraints() {
        searchButton.snp.makeConstraints { make in
            make.width.equalTo(19)
            make.trailing.equalTo(searchTextField.snp.trailing).inset(11)
            make.centerY.equalTo(searchTextField)
        }

        searchTextField.snp.makeConstraints { make in
            make.height.equalTo(36)
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
        }
    }
    
    override func addConfigurations() {
        searchTextField.placeholder = "home_filter".localized
    }
    
    override func addStyle() {
        self.backgroundColor = .white
        
        searchButton.image = CommonAssets.search.image.withTintColor(.systemGray)
        searchButton.contentMode = .center

        searchTextField.leftPadding = 5
        searchTextField.layer.cornerRadius = 10
        searchTextField.backgroundColor = .systemGroupedBackground
        searchTextField.layer.borderWidth = 1
        searchTextField.layer.borderColor = UIColor.systemGray.cgColor
        searchTextField.textColor = .gray
        searchTextField.tintColor = .lightGray
    }
}
