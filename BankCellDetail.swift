//
//  BankCellDetail.swift
//  PruebaTecnicaPagaTodo
//
//  Created by HLS GROUP on 31/05/23.
//

import SwiftUI

struct BankCellDetail: View {
    let bank: BankObjectModel
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: bank.url)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
            } placeholder: {
                ProgressView()
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Descripcion: \(bank.bankDescription)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Text("Edad: \(bank.age)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
        .padding(.vertical, 18)
        .padding(.horizontal, 15)
    }
}

struct BankCellDetail_Previews: PreviewProvider {
    static var previews: some View {
        List {
            BankCellDetail(bank: BankObjectModel(bankDescription: "", age: 0, url: "", bankName: ""))
            BankCellDetail(bank: BankObjectModel(bankDescription: "", age: 0, url: "", bankName: ""))
            BankCellDetail(bank: BankObjectModel(bankDescription: "", age: 0, url: "", bankName: ""))
        }
        .previewLayout(.sizeThatFits)
    }
}
