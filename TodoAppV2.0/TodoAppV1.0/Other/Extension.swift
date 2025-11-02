//
//  Extension.swift
//  TodoAppV1.0
//
//  Created by NAFIU AMOSA on 23/10/2025.
//

import Foundation

extension Encodable{
    
    func asDictionary() -> [String: Any]{
        // encode the data parsed in json object otherwise return empty array
        guard let data = try? JSONEncoder().encode(self) else{
            return [:]
        }
        
        do{
            // return a json serialised object into a dictionary
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
        }catch{
            return [:]
        }
    }
}
