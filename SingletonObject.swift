//
//  SingletonObject.swift
//  
//
//  Created by Dylan Sharkey on 5/18/17.
//
//

import Foundation


public class SingletonObject {
    public static let sharedInstance: SingletonObject = SingletonObject()
    
    private init() {
        
    }
    
    public func doStuff() {
        print("Im a singleton")
    }
}
