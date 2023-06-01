//
//  BankListView.swift
//  PruebaTecnicaPagaTodo
//
//  Created by HLS GROUP on 31/05/23.
//

import SwiftUI

struct BankListView: View {
    @ObservedObject var bankVM = BankViewModel()
    
    var body: some View {
        VStack {
            Text("Instituciones Bancarias")
            
            BankList(bankList: $bankVM.bankList)
            
            Button("Guardar en Base de Datos") {
                bankVM.saveDataToCoreData()
            }
        }
        .onAppear {
            bankVM.getBankInfo()
            bankVM.fetchDataFromEndpoint()
        }
        .navigationBarBackButtonHidden(false)
    }
}

struct BankListView_Previews: PreviewProvider {
    static var previews: some View {
        BankListView()
    }
}
