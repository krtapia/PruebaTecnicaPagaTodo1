//
//  BankList.swift
//  PruebaTecnicaPagaTodo
//
//  Created by HLS GROUP on 31/05/23.
//

import SwiftUI

struct BankList: View {
    @Binding var bankList: [BankObjectModel]
    @ObservedObject var bankVM = BankViewModel()
    
    var body: some View {
        List(bankList) { bank in
            NavigationLink(destination: BankCellDetail(bank: bank)) {
                BankCell(bank: bank)
            }
            .navigationBarBackButtonHidden()
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}




struct BankList_Previews: PreviewProvider {
    static var previews: some View {
        BankList(bankList: .constant([]))
    }
}
