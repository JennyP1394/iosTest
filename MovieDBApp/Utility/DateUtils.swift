//
//  DateUtils.swift
//  MovieDBApp
//
//  Created by Janki on 14/11/22.
//

import UIKit


let yymmddFormat = "yyyy-MM-dd"
let ddmmyyFormat = "dd-MM-yyyy"
// MARK: - DateUtils methods
class DateUtils {
    static func convertDateFormateFromYYYYMMDDToDDMMYYYY(dateStr: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = yymmddFormat
        let date = dateFormatter.date(from: dateStr)
        let formatter = DateFormatter()
        formatter.dateFormat = ddmmyyFormat
        if let dateObj = date {
            let finalDate = formatter.string(from: dateObj)
            return finalDate
        }
        return ""
    }
    
}
