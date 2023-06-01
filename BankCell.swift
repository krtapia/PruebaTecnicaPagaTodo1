//
//  BankCell.swift
//  PruebaTecnicaPagaTodo
//
//  Created by HLS GROUP on 31/05/23.
//

import SwiftUI

struct BankCell: View {
    let bank: BankObjectModel
       
    var body: some View {
           HStack {
               VStack(alignment: .leading, spacing: 4) {
                   Text(bank.bankName)
                       .font(.headline)
                       .foregroundColor(.black)
               }
           }
           .padding(.vertical, 8)
       }
}

struct BankCell_Previews: PreviewProvider {
    static var previews: some View {
        List {
            BankCell(bank: BankObjectModel(bankDescription: "", age: 0, url: "", bankName: ""))
            BankCell(bank: BankObjectModel(bankDescription: "", age: 0, url: "", bankName: ""))
            BankCell(bank: BankObjectModel(bankDescription: "", age: 0, url: "", bankName: ""))
        }
        .previewLayout(.sizeThatFits)
    }
}
