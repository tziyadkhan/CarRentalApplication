//
//  ReusableView.swift
//  BankApp
//
//  Created by Ziyadkhan on 06.03.24.
//

import UIKit
import SnapKit

class ReusableView {
    static func reusableView(color: UIColor,
                      borderWidth: CGFloat,
                      borderColor: CGColor,
                      cornerRadius: CGFloat,
                             height: Int, width: Int) -> UIView {
        
        let view = UIView()
        view.backgroundColor = color
        view.layer.borderWidth = borderWidth
        view.layer.borderColor = borderColor
        view.layer.cornerRadius = cornerRadius
        view.snp.makeConstraints { make in
            make.height.equalTo(height)
            make.width.equalTo(width)
        }
        return view
    }
}

