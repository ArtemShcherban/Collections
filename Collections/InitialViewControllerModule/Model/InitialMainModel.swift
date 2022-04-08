//
//  InitialMainModel.swift
//  Collections
//
//  Created by Artem Shcherban on 07.04.2022.
//

import Foundation

final class InitialMainModel {
    
    private lazy var titles = AppConstants.initialTableViewTitles
    
    func numberOfRows() -> Int {
        return titles.count
    }
    
    func reciveTitle(_ indexPath: IndexPath) -> String {
        titles[indexPath.row]
    }
}
