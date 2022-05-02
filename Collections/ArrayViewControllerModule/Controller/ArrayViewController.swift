//
//  ArrayViewController.swift
//  Collections
//
//  Created by Artem Shcherban on 14.04.2022.
//

import UIKit

final class ArrayViewController: UIViewController {
    static let reuseIdentifier = String(describing: ArrayViewController.self)
    
    private(set) lazy var arrayMainModel = ArrayMainModel()
    
    private(set) lazy var arrayMainView: ArrayMainView? = {
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
}

extension ArrayViewController: ArrayMainViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arrayMainModel.numberOfRow()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.reuseIdentifier,
                                                            for: indexPath) as? CollectionViewCell
        else { fatalError(ErrorConstants.errorOne.rawValue) }
        
        let celltitle = arrayMainModel.receiveTitle(indexPath)
        cell.configure(celltitle)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? CollectionViewCell
        else { fatalError(ErrorConstants.errorTwo.rawValue + "\(indexPath)") }

        cell.activityIndicator.startAnimating()
        cell.titleUpdate()
        DispatchQueue.global(qos: .default).async {
            self.arrayMainModel.startTask(indexPath)
            DispatchQueue.main.async {
                cell.activityIndicator.stopAnimating()
                cell.updateAppearance()
                cell.titleUpdate(self.arrayMainModel.timeInterval)
            }
        }
    }
    
//    func bigButtonTapped1() {
//        if arrayMainView?.bigButton.isSelected == false {
//            arrayMainView?.bigButton.update()
//            arrayMainView?.bigButton.startActivityIndicator()
//            DispatchQueue.main.async {
//                self.arrayMainModel.createArray(with: AppConstants.maximumElements)
//                self.arrayMainView?.bigButton.stopActivityIndicator()
//                self.arrayMainView?.bigButton.update(self.arrayMainModel.timeInterval)
//                self.arrayMainView?.addCollectionView()
//            }
//        }
//    }
    
    func bigButtonTapped() {
        if arrayMainView?.bigButton.isSelected == false {
            arrayMainView?.bigButton.update()
            arrayMainView?.bigButton.startActivityIndicator()
            DispatchQueue.global(qos: .default).async {
                self.arrayMainModel.createArray(with: AppConstants.maximumElements)
                DispatchQueue.main.async {
                    self.arrayMainView?.bigButton.stopActivityIndicator()
                    self.arrayMainView?.bigButton.update(self.arrayMainModel.timeInterval)
                    self.arrayMainView?.addCollectionView()
                }
            }
        }
    }
}
