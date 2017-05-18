//
//  SingletonObject.swift
//  
//
//  Created by Dylan Sharkey on 5/18/17.
//
//

import Foundation


public class SingletonObject {
    private init() {
        
    }
    
    public static let sharedInstance: SingletonObject = SingletonObject()
    
    
    
    public func doStuff() {
        print("Im a singleton")
    }
}
