//
//  Dispatcher.swift
//  Collections
//
//  Created by Artem Shcherban on 04.05.2022.
//

import Foundation

class Dispatcher {
    var queue: DispatchQueue
    
    init(queue: DispatchQueue) {
        self.queue = queue
    }
}

protocol Dispatching {
    func dispatch(_ work: @escaping () -> Void)
}

class AsyncQueue: Dispatcher { }

class SyncQueue: Dispatcher { }

extension AsyncQueue: Dispatching {
    static let main: AsyncQueue = AsyncQueue(queue: .main)
    static let global: AsyncQueue = AsyncQueue(queue: .global())
    static let background: AsyncQueue = AsyncQueue(queue: .global(qos: .background))
    
    func dispatch(_ work: @escaping () -> Void) {
        queue.async(execute: work)
    }
}

extension SyncQueue: Dispatching {
    static let main: SyncQueue = SyncQueue(queue: .main)
    static let global: SyncQueue = SyncQueue(queue: .global())
    static let background: SyncQueue = SyncQueue(queue: .global(qos: .background))
    
    func dispatch(_ work: @escaping () -> Void) {
        queue.sync(execute: work)
    }
}
