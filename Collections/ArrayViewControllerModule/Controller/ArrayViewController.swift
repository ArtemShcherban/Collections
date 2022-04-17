//
//  ArrayViewController.swift
//  Collections
//
//  Created by Artem Shcherban on 14.04.2022.
//

import UIKit

final class ArrayViewController: UIViewController {
    private lazy var arrayMainModel = ArrayMainModel()
    
    private lazy var arrayMainView: ArrayMainView? = {
        let view = ArrayMainView()
        view.delegate = self
        return view
    }()
    
    override func loadView() {
        view = arrayMainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arrayMainView?.createMainView()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        createNavigationBar(for: ArrayViewController.self)
    }
    
    private func navigationBarConfigure() {
        title = AppConstants.initialTableViewTitles[0]
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.backgroundColor = ColorsConstants.tabBarColor
        navigationController?.navigationBar.layer.shadowColor = UIColor.black.cgColor
        navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0.0, height: 1)
        navigationController?.navigationBar.layer.shadowRadius = 0
        navigationController?.navigationBar.layer.shadowOpacity = 0.3
    }
}

extension ArrayViewController: ArrayMainViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arrayMainModel.numberOfRow()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ArrayCollectionViewCell.reuseIdentifier,
                                                            for: indexPath) as? ArrayCollectionViewCell
        else { fatalError(ErrorConstants.errorOne.rawValue) }
        
        let celltitle = arrayMainModel.receiveTitle(indexPath)
        cell.configure(title: celltitle)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? ArrayCollectionViewCell
        else { fatalError(ErrorConstants.errorTwo.rawValue + "\(indexPath)") }
        
        cell.startActivityIndicator()
        cell.textLabelUpdate()
        DispatchQueue.global(qos: .default).async {
            self.arrayMainModel.startTask(indexPath)
            self.arrayMainModel.timeСalculation()
            DispatchQueue.main.async {
                cell.stopActivityIndicator()
                cell.textLabelUpdate(self.arrayMainModel.timeInterval)
            }
        }
        print(indexPath.row)
    }
    
    func bigButtonTapped() {
        if arrayMainView?.bigButton.isSelected == false {
            arrayMainView?.bigButton.update()
            arrayMainView?.bigButton.startActivityIndicator()
            DispatchQueue.main.async {
                self.arrayMainModel.createArray()
                self.arrayMainModel.timeСalculation()
                self.arrayMainView?.bigButton.stopActivityIndicator()
                self.arrayMainView?.bigButton.update(self.arrayMainModel.timeInterval)
                self.arrayMainView?.addCollectionView()
            }
        }
    }
}
