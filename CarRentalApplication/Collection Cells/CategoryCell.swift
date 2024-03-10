//
//  CategoryCell.swift
//  CarRentalApplication
//
//  Created by Ziyadkhan on 10.03.24.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    lazy var background: UIView = {
        return ReusableView.reusableView(color: .white,
                                         borderWidth: 0,
                                         borderColor: UIColor.clear.cgColor,
                                         cornerRadius: 20,
                                         height: 150,
                                         width: 110)
    }()
    
    lazy var carCategoryImage: UIImageView = {
        return ReusableImageView.reusableImage(imageName: "emptyCar", contentMode: .scaleAspectFit)
    }()
    
    lazy var carCategoryName: UILabel = {
        return ReusableLabel.reusableLabel(fontName: "Helvetica Neue", fontSize: 17, numOfLines: 0)
    }()
    
    lazy var carCategoryCount: UILabel = {
        let label =  ReusableLabel.reusableLabel(fontName: "Helvetica Neue Bold", fontSize: 17, numOfLines: 0)
        label.textColor = .brandGray
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configCellElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configCellElements() {
        addSubview(background)
        addSubview(carCategoryName)
        addSubview(carCategoryImage)
        addSubview(carCategoryCount)
    }
    
    func configConstraints() {
        background.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        carCategoryImage.snp.makeConstraints { make in
            make.center.equalTo(background)
        }
        
        carCategoryName.snp.makeConstraints { make in
            make.top.equalTo(carCategoryImage.snp.bottom).inset(-12)
            make.centerX.equalTo(carCategoryImage)
        }
        
        carCategoryCount.snp.makeConstraints { make in
            make.top.equalTo(carCategoryName.snp.bottom).inset(-8)
            make.centerX.equalTo(carCategoryName)
        }
    }
    
    func selectItem() {
        background.backgroundColor = .mainBG
        carCategoryName.textColor = .white
        carCategoryCount.textColor = .white
    }
    
    func deSelectItem() {
        background.backgroundColor = .white
        carCategoryName.textColor = .black
        carCategoryCount.textColor = .lightGray
    }
}
