//
//  ObserverType.swift
//  RxSwift
//
//  Created by Krunoslav Zaher on 2/8/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

/// Supports push-style iteration over an observable sequence.
public protocol ObserverType {
    /// The type of elements in sequence that observer can observe.
    associatedtype Element
    
    /// Type of sequence state machine completion.
    associatedtype Completed
    
    /// Type of sequence state machine error.
    associatedtype Error

    /// Notify observer about sequence event.
    ///
    /// - parameter event: Event that occurred.
    func on(_ event: Event<Element, Completed, Error>)
}

/// Convenience API extensions to provide alternate next, error, completed events
extension ObserverType {
    /// Convenience method equivalent to `on(.next(element: E))`
    ///
    /// - parameter element: Next element to send to observer(s)
    public func onNext(_ element: Element) {
        self.on(.next(element))
    }
    
    /// Convenience method equivalent to `on(.completed)`
    public func onCompleted(_ completed: Completed) {
        self.on(.completed(completed))
    }
    
    /// Convenience method equivalent to `on(.error(Swift.Error))`
    /// - parameter error: Swift.Error to send to observer(s)
    public func onError(_ error: Error) {
        self.on(.error(error))
    }
}
