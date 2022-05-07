//
//  TestHelpers.swift
//  InitialModuleTests
//
//  Created by Artem Shcherban on 26.04.2022.
//

import UIKit

func executeRunLoop() {
    RunLoop.current.run(until: Date())
}

func numberOfRows(in tableView: UITableView, section: Int = 0) -> Int? {
    tableView.dataSource?.tableView(tableView, numberOfRowsInSection: section)
}

func didSelectRow(in tableView: UITableView, row: Int, section: Int = 0) {
    tableView.delegate?.tableView?(tableView, didSelectRowAt: IndexPath(row: row, section: section))
}

func cellForItem(in collectionView: CollectionView, item: Int, section: Int = 0) -> CollectionViewCell? {
    let cell = collectionView.dataSource?.collectionView(collectionView, cellForItemAt: IndexPath(item: item, section: section))
    return cell as? CollectionViewCell
}

func numberOfItems(in collectionView: CollectionView, section: Int = 0) -> Int? {
    collectionView.dataSource?.collectionView(collectionView, numberOfItemsInSection: section)
}

func didSelectItem(in collectionView: CollectionView, item: Int, section: Int = 0) {
    collectionView.delegate?.collectionView?(collectionView, didSelectItemAt: IndexPath(item: item, section: section))
}
