//
//  Utils.swift
//  ITapSdkVTVLive
//
//  Created by Minh Vu on 30/06/2022.
//

import Foundation
import JWTKit

class Utils: NSObject {
    
    static let shared = Utils()
    
    func formatPercent(value: Double,isManual: Bool = false,maximumFractionDigits : Int = 2) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        if isManual
        {
            formatter.maximumFractionDigits = maximumFractionDigits
        }
        else
        {
            if -1.0 < value && value < 1.0 {
                formatter.maximumFractionDigits = 8
            }
            else
            {
                formatter.maximumFractionDigits = 2
            }
        }
        let result = formatter.string(from: (value/100.0) as NSNumber)
        return result!
    }
    
    func formatValue(value: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        if -1.0 < value && value < 1.0 {
            formatter.maximumFractionDigits = 8
            var result = formatter.string(from: value as NSNumber)
            if let range = result?.range(of: ".") {
                result?.replaceSubrange(range, with: "0.")
            }
            if let range = result?.range(of: "00.") {
                result?.replaceSubrange(range, with: "0.")
            }
            return result!
        }
        else
        {
            formatter.maximumFractionDigits = 2
            if (value > 1000000.0 && value < 1000000000.0) || (value < -1000000.0 && value > -1000000000.0) {
                let newValue = value/1000000.0
                if let result = formatter.string(from: newValue as NSNumber)
                {
                    return result + "MM"
                }
            }
            if value > 1000000000.0 || value < -1000000000.0 {
                let newValue = value/1000000000.0
                if let result = formatter.string(from: newValue as NSNumber)
                {
                    return result + "B"
                }
            }
            
        }
        let result = formatter.string(from: value as NSNumber)
        return result!
    }
    
    func formatValue(maximumFractionDigits : Int,value : Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = ""
        formatter.maximumFractionDigits = maximumFractionDigits
        if -1.0 < value && value < 1.0 {
            var result = formatter.string(from: value as NSNumber)
            if let range = result?.range(of: ".") {
                result?.replaceSubrange(range, with: "0.")
            }
            if let range = result?.range(of: "00.") {
                result?.replaceSubrange(range, with: "0.")
            }
            return result!
        }
        
        let result = formatter.string(from: value as NSNumber)
        return result!
    }
    
    func formatValue2(value: Double) -> String {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 3
        if -1.0 < value && value < 1.0 {
            formatter.maximumFractionDigits = 8
            var result = formatter.string(from: value as NSNumber)
            if let range = result?.range(of: ".") {
                result?.replaceSubrange(range, with: "0.")
            }
            if let range = result?.range(of: "00.") {
                result?.replaceSubrange(range, with: "0.")
            }
            return result!
        }
        else
        {
            formatter.maximumFractionDigits = 4
            if (value > 1000000.0 && value < 1000000000.0) || (value < -1000000.0 && value > -1000000000.0) {
                let newValue = value/1000000.0
                if let result = formatter.string(from: newValue as NSNumber)
                {
                    return result + "MM"
                }
            }
            if value > 1000000000.0 || value < -1000000000.0 {
                let newValue = value/1000000000.0
                if let result = formatter.string(from: newValue as NSNumber)
                {
                    return result + "B"
                }
            }
            
        }
        let result = formatter.string(from: value as NSNumber)
        return result!
    }
    
    func convertTimeStringToDouble(tString : String) -> Double {
        let dateFormatter = DateFormatter()
        //        let tempLocale = dateFormatter.locale // save locale temporarily
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssz"
        let date = dateFormatter.date(from: tString)!
        let timeStamp = date.timeIntervalSince1970
        return Double(timeStamp)
    }
    func convertTimeStringToDouble(tString : String,format : String) -> String {
        var nFormat = "yyyy/MM/dd HH:mm:ss"
        if tString.contains(".")
        {
            nFormat = "yyyy/MM/dd HH:mm:ss.z"
        }
        let dateFormatter = DateFormatter()
        let tempLocale = dateFormatter.locale // save locale temporarily
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        if nFormat == format
        {
            dateFormatter.dateFormat = format
        }
        else
        {
            dateFormatter.dateFormat = nFormat
        }
        let date = dateFormatter.date(from: tString)!
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = tempLocale
        dateFormatter.dateFormat = "HH:mm - dd/MM"
        let date21 = dateFormatter.string(from: date)
        return date21
    }
    
    func convertTimeString(tString : String,format : String) -> String {
        var nFormat = "yyyy/MM/dd HH:mm:ss"
        if tString.contains(".")
        {
            nFormat = "yyyy/MM/dd HH:mm:ss.z"
        }
        let dateFormatter = DateFormatter()
        let tempLocale = dateFormatter.locale // save locale temporarily
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        if nFormat == format
        {
            dateFormatter.dateFormat = format
        }
        else
        {
            dateFormatter.dateFormat = nFormat
        }
        let date = dateFormatter.date(from: tString)!
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = tempLocale
        dateFormatter.dateFormat = "dd 'thg' MM"
        let date21 = dateFormatter.string(from: date)
        return date21
    }
    
    func convertTime(tString : String,format : String) -> String {
        var nFormat = "yyyy/MM/dd HH:mm:ss"
        if tString.contains(".")
        {
            nFormat = "yyyy/MM/dd HH:mm:ss.z"
        }
        let dateFormatter = DateFormatter()
        let tempLocale = dateFormatter.locale // save locale temporarily
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        if nFormat == format
        {
            dateFormatter.dateFormat = format
        }
        else
        {
            dateFormatter.dateFormat = nFormat
        }
        let date = dateFormatter.date(from: tString)!
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = tempLocale
        dateFormatter.dateFormat = "HH:mm - dd/MM"
        let date21 = dateFormatter.string(from: date)
        return date21
    }
    
    func convertTimetoDateYear(tString : String,format : String) -> String {
        var nFormat = "yyyy/MM/dd HH:mm:ss"
        if tString.contains(".")
        {
            nFormat = "yyyy/MM/dd HH:mm:ss.z"
        }
        let dateFormatter = DateFormatter()
        let tempLocale = dateFormatter.locale // save locale temporarily
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        if nFormat == format
        {
            dateFormatter.dateFormat = format
        }
        else
        {
            dateFormatter.dateFormat = nFormat
        }
        let date = dateFormatter.date(from: tString)!
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = tempLocale
        dateFormatter.dateFormat = "yyyy/MM/dd"
        let date21 = dateFormatter.string(from: date)
        return date21
    }
    
    
    func formatDateMessage(tString : String, format : String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = format
        if let dateInput = dateFormatter.date(from: tString) {
            return formatDateMessage(date: dateInput)
        }
        return ""
    }
    
    func formatDateMessage(date: Date) -> String {
        let dateFormatter = DateFormatter()
        if (Calendar.current.isDateInToday(date)) {
            dateFormatter.dateFormat = "HH:mm"
        } else {
            dateFormatter.dateFormat = "yyyy/MM/dd"
        }
        dateFormatter.timeZone = TimeZone.current
        let output = dateFormatter.string(from: date)
        return output
    }
    
    func convertTimetoHour(tString : String,format : String) -> String {
        var nFormat = "yyyy/MM/dd HH:mm:ss"
        if tString.contains(".")
        {
            nFormat = "yyyy/MM/dd HH:mm:ss.z"
        }
        let dateFormatter = DateFormatter()
        let tempLocale = dateFormatter.locale // save locale temporarily
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        if nFormat == format
        {
            dateFormatter.dateFormat = format
        }
        else
        {
            dateFormatter.dateFormat = nFormat
        }
        let date = dateFormatter.date(from: tString)!
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = tempLocale
        dateFormatter.dateFormat = "HH:mm"
        let date21 = dateFormatter.string(from: date)
        return date21
    }
    
    func UTCToLocal(date:String, fromFormat: String, toFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = fromFormat
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT+00")
        
        let dt = dateFormatter.date(from: date)
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = toFormat
        
        return dateFormatter.string(from: dt!)
    }
    
    func formatCurrency(currencyString : String) -> String {
        if let value = Int(currencyString)
        {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.groupingSeparator = "."
            formatter.maximumFractionDigits = 0
            if let result = formatter.string(from: value as NSNumber)
            {
                return result
            }
        }
        return ""
    }
    
    func formatCurrency(value: NSNumber, identifier: String) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        formatter.locale = Locale(identifier: identifier) //  "vi_VN"
        return formatter.string(from: value) ?? "0 đ"
    }
     
    func createJwtFromJdt (appInfo : AppInfo, time : String) -> String {
        
        var body : String = ""
        let client_secret : String = appInfo.client_secret ?? ""
        let iss : String = appInfo.client_id ?? ""
        let nbf = (time as NSString) .integerValue
        let jtiNbf = nbf * 1000
        let jti = String(jtiNbf)
        let expdate : Int = nbf + 60
        let jdt = JDT(dvId: "1656572775", os: appInfo.platformOS ?? "")
        
        let exp = ExpirationClaim(value: Date(timeIntervalSince1970: TimeInterval(expdate)))
            do {
                let jwt = try JWTSigner.hs256(key: client_secret)
                    .sign(Payload(jti: jti, iss: iss, nbf: nbf, jdt: jdt, exp : exp))
                body = jwt
            } catch {
                body = "testExpirationEncoding"
            }
        return body
    }
    
    func testExpirationEncoding() -> String {
        let test = "PGlDvJMrBFmnsZPA29bRSOTxYsw4YvLJ4HnQuGhR42q+jZYOHL3z3sRr0QSQXH8B"
        let jti = "1656572775"
        let iss = "643621c719624254"
        let nbf = 1656572775
        let jdt = JDT(dvId: "a", os: "a")
        let exp = ExpirationClaim(value: Date(timeIntervalSince1970: 1656572835))
            do {
                let jwt = try JWTSigner.hs256(key: test)
                    .sign(Payload(jti: jti, iss: iss, nbf: nbf, jdt: jdt,exp : exp))
                print(" test : \(jwt)")
            } catch {
                print("testExpirationEncoding")
            }

            return test
        }
    
}
struct Payload: JWTPayload, Equatable {

    var jti: String
    var iss: String
    var nbf: Int = 0
    var jdt: JDT
    var exp: ExpirationClaim
    func verify(using signer: JWTSigner) throws {
        try self.exp.verifyNotExpired()
    }
}


struct JDT: JWTPayload, Equatable {
    var dvId : String
    var os : String
    
    /// See `JWTClaim`.
    public init(dvId: String, os: String) {
        self.dvId = dvId
        self.os = os
    }
    
    func verify(using signer: JWTSigner) throws {
                
    }

}
