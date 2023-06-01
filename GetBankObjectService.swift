//
//  GetBankObjectService.swift
//  PruebaTecnicaPagaTodo
//
//  Created by HLS GROUP on 31/05/23.
//

import Foundation

func getInfo(completion: @escaping ([BankObjectModel]?) -> Void) {
    guard let url = URL(string: "https://dev.obtenmas.com/catom/api/challenge/banks") else {
        completion(nil)
        return
    }
    
    URLSession.shared.dataTask(with: url) { data, _, error in
        if let error = error {
            print("Error: \(error.localizedDescription)")
            completion(nil)
            return
        }
        
        guard let data = data else {
            completion(nil)
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let bankList = try decoder.decode([BankObjectModel].self, from: data)
            
            DispatchQueue.main.async { 
                completion(bankList)
            }
        } catch {
            print("Error decoding JSON: \(error.localizedDescription)")
            completion(nil)
        }
    }.resume()
}

