//
//  SearchPageController.swift
//  CarRentalApplication
//
//  Created by Ziyadkhan on 10.03.24.
//

import UIKit
import RealmSwift

class SearchPageController: UIViewController {

    var coordinator: MainCoordinator?
    
    lazy var vehicleCollection: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 340, height: 340)
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = .init(top: 0, left: 0, bottom: 0, right: 0)
        
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collection.dataSource = self
        collection.delegate = self
        collection.register(CarListCell.self, forCellWithReuseIdentifier: "\(CarListCell.self)")
        collection.backgroundColor = .menuBG
        
        return collection
    }()
    
    lazy var searchBackogrundView: UIView = {
        return ReusableView.reusableView(color: .white,
                                         borderWidth: 0,
                                         borderColor: UIColor.clear.cgColor,
                                         cornerRadius: 30,
                                         height: 60, width: 340)
    }()
    
    lazy var searchTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Search for a car"
        textField.addTarget(self, action: #selector(searchTextFieldDidChange(_:)), for: .editingChanged)
        
        return textField
    }()
    
    lazy var searchImageView: UIImageView = {
        return ReusableImageView.reusableImage(imageName: "search", contentMode: .scaleAspectFit)
    }()
    
    let helper = RealmFunctions()
    var carItems = [CarModel]()
    let realm = try! Realm()
    var searching = false
    var searchedCar = [CarModel]()
    var categorySelectedIndexPath: IndexPath?
    var originalCarItems = [CarModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        configConstraints()
        fetchItems()
        helper.getFilePath()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.navigationItem.hidesBackButton = true
    }
}


//MARK: Collection Functions
extension SearchPageController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return carItems.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(CarListCell.self)", for: indexPath) as! CarListCell
        cell.filldata(data: carItems[indexPath.item])
        return cell
    }
}



//MARK: Functions
extension SearchPageController {
    
    func configUI() {
        view.addSubview(vehicleCollection)
        view.backgroundColor = .menuBG
        view.addSubview(searchBackogrundView)
        view.addSubview(searchTextField)
        view.addSubview(searchImageView)
    }
    
    func configConstraints() {
        
        searchBackogrundView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(100)
            make.left.right.equalToSuperview().inset(20)
        }
        
        searchImageView.snp.makeConstraints { make in
            make.right.equalTo(searchBackogrundView).inset(8)
            make.centerY.equalTo(searchBackogrundView)
            make.width.height.equalTo(24)
        }
        
        searchTextField.snp.makeConstraints { make in
            make.left.equalTo(searchBackogrundView).inset(8)
            make.center.equalTo(searchBackogrundView)
        }
        
        vehicleCollection.snp.makeConstraints { make in
            make.top.equalTo(searchTextField.snp.bottom).inset(-30)
            make.left.right.bottom.equalToSuperview()
        }
    }
    
    func fetchItems() {
        carItems.removeAll()
        let data = realm.objects(CarModel.self)
        carItems.append(contentsOf: data)
        originalCarItems.append(contentsOf: data)
        vehicleCollection.reloadData()
    }
    
    @objc func searchTextFieldDidChange(_ textField: UITextField) {
        if let searchText = textField.text, !searchText.isEmpty {
            searching = true
            carItems = carItems.filter { car in
                if let model = car.model {
                    return model.lowercased().contains(searchText.lowercased())
                }
                return false
            }
        } else {
            searching = false
            carItems.removeAll()
            carItems = originalCarItems
        }
        vehicleCollection.reloadData()
    }
}


