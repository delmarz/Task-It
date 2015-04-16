//
//  Date.swift
//  TaskIt3
//
//  Created by delmarz on 1/20/15.
//  Copyright (c) 2015 delmarz. All rights reserved.
//

import Foundation


class Date {
    
    
    class func from (#year: Int, month: Int, day: Int) -> NSDate {
        
        
        var components = NSDateComponents()
        components.year = year
        components.month = month
        components.day = day
        
        var gregorianCalendar = NSCalendar(identifier: NSGregorianCalendar)
        var date = gregorianCalendar?.dateFromComponents(components)
        
        return date!
        
    }
    
    
    class func toString(#date:NSDate) -> String {
        
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let stringFromDate = formatter.stringFromDate(date)
        
        return stringFromDate
        
    }
    
}