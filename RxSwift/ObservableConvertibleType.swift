//
//  ObservableConvertibleType.swift
//  RxSwift
//
//  Created by Krunoslav Zaher on 9/17/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

/// Type that can be converted to observable sequence (`Observable<E>`).
public protocol ObservableConvertibleType {
    /// Type of elements in a sequence.
    associatedtype Element
    
    /// Type of sequence state machine completion.
    associatedtype Completed
    
    /// Type of sequence state machine error.
    associatedtype Error

    /// Converts `self` to `Observable` sequence.
    ///
    /// - returns: Observable sequence that represents `self`.
    var source: ObservableSource<Element, Completed, Error> { get }
}

extension ObservableConvertibleType where Completed == (), Error == Swift.Error {
    /// Converts `self` to `Observable` sequence.
    ///
    /// - returns: Observable sequence that represents `self`.
    public func asObservable() -> ObservableSource<Element, Completed, Error> {
        return self.source
    }
}
