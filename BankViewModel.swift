//
//  BankViewModel.swift
//  PruebaTecnicaPagaTodo
//
//  Created by HLS GROUP on 31/05/23.
//

import Foundation
import CoreData

final class BankViewModel: ObservableObject {
    @Published var bankList: [BankObjectModel] = []
    @Published var isLoading: Bool = false
    @Published var bankName: String = ""
    @Published var description: String = ""
    @Published var age: Int = 0
    @Published var url: String = ""
    private let coreDataStack = CoreDataStack()
    
    func getBankInfo() {
        self.isLoading = true
        
        if let bankObjects = fetchDataFromCoreData() {
            self.bankList = bankObjects
            self.isLoading = false
        } else {
            fetchDataFromEndpoint()
        }
    }
    
     func fetchDataFromEndpoint() {
        getInfo { [weak self] (bankList) in
            guard let bankList = bankList else {
                self?.isLoading = false
                return
            }
            
            DispatchQueue.main.async {
                self?.bankList = bankList
                self?.saveDataToCoreData()
                self?.isLoading = false
            }
        }
    }
    
    private func fetchDataFromCoreData() -> [BankObjectModel]? {
        let fetchRequest: NSFetchRequest<PruebaTecnica> = PruebaTecnica.fetchRequest()

        do {
            let bankObjects = try coreDataStack.context.fetch(fetchRequest)
            let bankModels = bankObjects.map { BankObjectModel(bankDescription: $0.bankDescription ?? "", age: Int($0.age), url: $0.url ?? "", bankName: $0.bankName ?? "") }
            return bankModels
        } catch {
            print("Error fetching data from CoreData: \(error.localizedDescription)")
            return nil
        }
    }

     func saveDataToCoreData() {
        for bank in bankList {
            let bankObject = convertToPruebaPagaTodo(bank)
            bankObject.bankName = bank.bankName
            bankObject.bankDescription = bank.bankDescription
            bankObject.age = Int16(bank.age)
            bankObject.url = bank.url
        }
        
        coreDataStack.saveContext()
    }

    
     func convertToPruebaPagaTodo(_ bankObject: BankObjectModel) -> PruebaTecnica {
        let PruebaTecnica = PruebaTecnica(context: coreDataStack.context)
         PruebaTecnica.bankName = bankObject.bankName
         PruebaTecnica.bankDescription = bankObject.bankDescription
         PruebaTecnica.age = Int16(bankObject.age)
         PruebaTecnica.url = bankObject.url
        return PruebaTecnica
    }

}

