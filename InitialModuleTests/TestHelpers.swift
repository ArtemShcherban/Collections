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

func didSelectRow(in tableView: UITableView, row: Int, section: Int = 0) {
    tableView.delegate?.tableView?(tableView, didSelectRowAt: IndexPath(row: row, section: section))
}

func numberOfRows(in tableView: UITableView, section: Int = 0) -> Int? {
    tableView.dataSource?.tableView(tableView, numberOfRowsInSection: section)
}
