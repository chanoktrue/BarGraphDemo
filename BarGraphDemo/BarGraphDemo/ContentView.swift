//
//  ContentView.swift
//  BarGraphDemo
//
//  Created by Thongchai Subsaidee on 1/9/2564 BE.
//

import SwiftUI


struct Stock {
    let price: Double
}

private func getHistoricalStocks() -> [Stock] {
    var stocks = [Stock]()
    
    for _ in 1...20 {
        let stock = Stock(price: Double.random(in: 100...300))
        stocks.append(stock)
    }
    
    return stocks
}

private func getYearlyLabel() -> [String] {
    return (2000...2021).map({String($0)})
}

struct BarChartView: View {
    
    let values: [Int]
    let labels: [String]
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .bottom) {
                
                ForEach(values.indices, id: \.self) { index in
                    
                    let label = labels[index]
                    let value = values[index]
                    
                    VStack {
                        Text("\(value)")
                        Rectangle()
                            .fill(value <= 120 ? Color.red : Color.blue)
                            .frame(width: 44, height: CGFloat(value))
                        Text(label)
                    }
                    .padding([.leading, .trailing], 8    )
                    
                }
                
            }
        }
    }
}


struct ContentView: View {
    
    let prices = getHistoricalStocks().map({Int($0.price)})
    let labels = getYearlyLabel()
        
    var body: some View {
        VStack {
            Text("Stocks")
                .font(.largeTitle)
            BarChartView(values: prices, labels: labels  )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(#colorLiteral(red: 0.2717101276, green: 0.8063796163, blue: 0.4401132464, alpha: 1)))
        .foregroundColor(.white)
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
