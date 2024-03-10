//
//  OrderTotalView.swift
//  CoffeeOrdering
//
//  Created by Kiss Roland on 07/03/2024.
//

import SwiftUI

struct OrderTotalView: View {
    
    var total: Double
    var body: some View {
        HStack{
            Spacer()
            Text(String(format: "$%.2f", self.total)).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .foregroundStyle(.green)
            Spacer()
        }
        .padding(10)
    }
}

#Preview {
    OrderTotalView(total: 45.9)
}
