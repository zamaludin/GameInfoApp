//
//  File.swift
//  
//
//  Created by Zamaludin Abdulah on 25/03/23.
//

import Foundation

extension String {
  func localized() -> String {
    return Bundle.module.localizedString(forKey: self, value: nil, table: nil)
  }
  
  public func toDateFormated() -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
    dateFormatter.dateFormat = "yyyy-MM-dd"
    let date = dateFormatter.date(from: self)!
    
    dateFormatter.dateFormat = "dd MMM yyyy"
    return dateFormatter.string(from: date)
  }
  
  var htmlToAttributedString: NSAttributedString? {
    guard let data = data(using: .utf8) else { return nil }
    do {
      return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
    } catch {
      return nil
    }
  }
  
  var htmlToString: String {
    return htmlToAttributedString?.string ?? ""
  }
}
