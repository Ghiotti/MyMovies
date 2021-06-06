//
//  BaseTableViewCell.swift
//  MyMovies
//
//  Created by Franco Ghiotti on 6/6/21.
//

import UIKit
import ReactiveKit

class BaseTableViewCell: UITableViewCell {

    lazy var disposeBag = DisposeBag()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        addSubviews()
        addConstraints()
        addStyle()
        addConfigurations()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    open func addSubviews() {

    }

    open func addConstraints() {

    }

    open func addStyle() {

    }

    open func addConfigurations() {

    }
}
