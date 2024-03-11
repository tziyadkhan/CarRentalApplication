//
//  CarCategoryHeader.swift
//  CarRentalApplication
//
//  Created by Ziyadkhan on 10.03.24.
//

import UIKit
import RealmSwift

class CarCategoryHeader: UICollectionReusableView {
    
    lazy var carCategoryCollection: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 110, height: 150)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 25
        layout.minimumInteritemSpacing = 25
        layout.sectionInset = .init(top: 0, left: 20, bottom: 0, right: 20)
    
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.dataSource = self
        collection.delegate = self
        collection.register(CategoryCell.self, forCellWithReuseIdentifier: "\(CategoryCell.self)")
        collection.backgroundColor = .menuBG
        
        return collection
    }()
    var carItems = [CarModel]()

    let helper = RealmFunctions()
    let realm = try! Realm()
    var categoryCounts = [String: Int]()
    var categorySelectedIndexPath: IndexPath?
    var didSelectCategoryCallback: ((String) -> Void)?
    
    
    func configure() {
        addSubview(carCategoryCollection)
//        carCategoryCollection.reloadData()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        carCategoryCollection.frame = bounds
    }
}

extension CarCategoryHeader: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        for category in CarCategory.allCases {
            let categoryCars = realm.objects(CarModel.self).filter("category = %@", category.rawValue)
            categoryCounts[category.rawValue] = categoryCars.count
        }
        return categoryCounts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
        let category = CarCategory.allCases[indexPath.item]
        cell.carCategoryName.text = category.rawValue
        cell.carCategoryImage.image = UIImage(named: category.rawValue)
        
        if indexPath == categorySelectedIndexPath {
            // Apply selected appearance
            cell.selectItem()
        } else {
            // Apply default appearance
            cell.deSelectItem()
        }
        
        if let count = categoryCounts[category.rawValue] {
            cell.carCategoryCount.text = "\(count)"
        } else {
            cell.carCategoryCount.text = "0"
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let category = CarCategory.allCases[indexPath.item]
//        let filteredCars = carItems.filter{ $0.category == category.rawValue }
        
        if let previousIndexPath = categorySelectedIndexPath {         // Deselect the previously selected cell and reset its background color
            collectionView.deselectItem(at: previousIndexPath, animated: true)
            if let previousCell = collectionView.cellForItem(at: previousIndexPath) as? CategoryCell {
                previousCell.background.backgroundColor = .white // Change to the default background color
                previousCell.carCategoryName.textColor = .black
                previousCell.carCategoryCount.textColor = .lightGray
            }
        }
        categorySelectedIndexPath = indexPath // Update the selected index path
        
        if let selectedCell = collectionView.cellForItem(at: indexPath) as? CategoryCell {
            // Change the elements' colors of the newly selected cell
            selectedCell.background.backgroundColor = .mainBG
            selectedCell.carCategoryName.textColor = .white
            selectedCell.carCategoryCount.textColor = .white
        }
        didSelectCategoryCallback?(category.rawValue)
        carCategoryCollection.reloadData()
//        print("Selected category: \(category)")
//        print("Filtered Cars: \(filteredCars)")
//        print("Normal List: \(carItems)")
    
    }
}
