//
//  DictionaryViewController.swift
//  Collections
//
//  Created by Artem Shcherban on 08.04.2022.
//

import UIKit

final class DictionaryViewController: UIViewController {
    
    private lazy var dictionaryWorkingModel = DictionaryWorkingModel()
    
    private lazy var dictionaryMainView: DictionaryMainView? = {
        let view = DictionaryMainView()
        view.delegate = self
        return view
    }()
    
    override func loadView() {
        view = dictionaryMainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dictionaryMainView?.createMainView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "Dictionary"
                navigationController?.navigationBar.prefersLargeTitles = false
                navigationController?.navigationBar.backgroundColor = ColorsConstants.mainColor
                navigationController?.navigationBar.layer.shadowColor = UIColor.red.cgColor
                navigationController?.navigationBar.layer.shadowRadius = 0
                navigationController?.navigationBar.layer.shadowOpacity = 0.3
                navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 1)
    }
}

extension DictionaryViewController: DictionaryMainViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dictionaryWorkingModel.numberOfRows()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.reuseIdentifier,
                                                            for: indexPath) as? CollectionViewCell else { fatalError(ErrorConstants.errorOne.rawValue)}
        
        let cellTitle = dictionaryWorkingModel.receiveTitleFoCell(indexPath)
        cell.cellConfigure(cellTitle)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? CollectionViewCell else { fatalError(ErrorConstants.errorTwo.rawValue + "\(indexPath)") }
        
        cell.titleUpdate()
        cell.activityIndicator.startAnimating()
        DispatchQueue.global(qos: .default).async {
            self.dictionaryWorkingModel.startTaskAt(indexPath)
            DispatchQueue.main.async {
                cell.activityIndicator.stopAnimating()
                cell.updateBackgroundColor()
                cell.titleUpdate(self.dictionaryWorkingModel.createNewTitle())
            }
        }
    }
    
    func arrayButtonPressed() {
        dictionaryMainView?.arrayButton.update()
        dictionaryMainView?.arrayButton.startActivityIndicator()
        DispatchQueue.main.async {
            self.dictionaryWorkingModel.createContactsArray()
            self.dictionaryMainView?.arrayButton.stopActivityIndicator()
            self.dictionaryMainView?.arrayButton.update(self.dictionaryWorkingModel.timeInterval)
        }
    }
    
    func dictionaryButtonPressed() {
        dictionaryMainView?.dictionaryButton.update()
        dictionaryMainView?.dictionaryButton.startActivityIndicator()
        DispatchQueue.main.async {
            self.dictionaryWorkingModel.createContactsDictionary()
            self.dictionaryMainView?.dictionaryButton.stopActivityIndicator()
            self.dictionaryMainView?.dictionaryButton.update(self.dictionaryWorkingModel.timeInterval)
        }
    }
}
