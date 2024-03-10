//
//  CarListCell.swift
//  CarRentalApplication
//
//  Created by Ziyadkhan on 10.03.24.
//

import UIKit
import SnapKit

class CarListCell: UICollectionViewCell {
    
    lazy var background: UIView = {
        return ReusableView.reusableView(color: .white,
                                         borderWidth: 0,
                                         borderColor: UIColor.clear.cgColor,
                                         cornerRadius: 20,
                                         height: 340, width: 340)
    }()
    
    lazy var carImageView: UIImageView = {
        return ReusableImageView.reusableImage(imageName: "emptyCar", contentMode: .scaleAspectFit)
    }()
    
    lazy var carBrandLabel: UILabel = {
        return ReusableLabel.reusableLabel(fontName: "Helvetica Neue Bold", fontSize: 30, numOfLines: 0)
    }()
    
    lazy var carPriceLabel: UILabel = {
        let label = ReusableLabel.reusableLabel(fontName: "Helvetica Neue Light", fontSize: 30, numOfLines: 0)
        label.textColor = .mainBG
        return label
    }()
    
    lazy var carModelLabel: UILabel = {
        let label = ReusableLabel.reusableLabel(fontName: "Helvetica Neue", fontSize: 15, numOfLines: 0)
        label.textColor = .brandGray
        return label
    }()
    
    lazy var carEngineLabel: UILabel = {
        let label = ReusableLabel.reusableLabel(fontName: "Helvetica Neue Light", fontSize: 15, numOfLines: 0)
        return label
    }()
    
    lazy var dummyMonthLabel: UILabel = {
        let label = ReusableLabel.reusableLabel(fontName: "Helvetica Neue", fontSize: 15, numOfLines: 0)
        label.textColor = .brandGray
        label.text = "/ month"
        return label
    }()
    
    lazy var dummyEngineLabel: UILabel = {
        let label = ReusableLabel.reusableLabel(fontName: "Helvetica Neue Light", fontSize: 15, numOfLines: 0)
        label.text = "Engine"
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
        addSubview(carBrandLabel)
        addSubview(carImageView)
        addSubview(carModelLabel)
        addSubview(carPriceLabel)
        addSubview(carEngineLabel)
        addSubview(dummyMonthLabel)
        addSubview(dummyEngineLabel)
    }
    
    func configConstraints() {
        carBrandLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(32)
            make.left.equalToSuperview().inset(24)
        }
        
        carPriceLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(32)
            make.right.equalToSuperview().inset(24)
        }
        
        carModelLabel.snp.makeConstraints { make in
            make.top.equalTo(carBrandLabel.snp.bottom).inset(-16)
            make.left.equalToSuperview().inset(24)
        }
        
        dummyMonthLabel.snp.makeConstraints { make in
            make.top.equalTo(carPriceLabel.snp.bottom).inset(-16)
            make.right.equalToSuperview().inset(24)
        }
        
        dummyEngineLabel.snp.makeConstraints { make in
            make.top.equalTo(carModelLabel.snp.bottom).inset(-16)
            make.left.equalToSuperview().inset(24)
        }
        
        carEngineLabel.snp.makeConstraints { make in
            make.top.equalTo(dummyMonthLabel.snp.bottom).inset(-16)
            make.right.equalToSuperview().inset(24)
        }
        
        carImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(120)
            make.centerX.equalToSuperview()
            make.height.equalTo(200)
            make.width.equalTo(344)
        }
    }
    
    func filldata(data: CarModel){
        carImageView.image = UIImage(named: data.model ?? "emptyCar")
        carBrandLabel.text = data.name
        carModelLabel.text = data.model
        carPriceLabel.text = data.price
        carEngineLabel.text = data.engine
    }
}
