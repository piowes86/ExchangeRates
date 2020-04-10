//
//  ExchangesRatesViewModel.swift
//  ExchangeRates
//
//  Created by Piotr Wesolowski on 09/04/2020.
//  Copyright © 2020 Piotr Wesolowski. All rights reserved.
//

import Foundation

public class ExchangeRatesViewModel {
    
    let exchangeRatesTable: Box<ExchangeRatesData?> = Box(nil)
    //let currencyExchangesRatesTable = Box(CurrencyExchangesRatesData())
    
    init() {
        fetchExchangeRates(tabeleToDisplay: TableName.A)
        self.exchangeRatesTable.value = nil
    }
    
    func fetchExchangeRates(tabeleToDisplay: TableName) {
        NBPService.fetchExchangesRatesTable(tabeleName: tabeleToDisplay) { [weak self] (exchangeRatesData, error) in
            guard
                let self = self,
                let exchangeRatesData = exchangeRatesData
                else {
                    return
            }
            
            self.exchangeRatesTable.value = exchangeRatesData
        }
    }
    
//    private func fetchCurrencyExchangesRates() {
//        NBPService.fetchExchangesRatesTableForCurrency(tabeleName: TableName.A,
//                                                       currencyCode: "gbp") { [weak self] (currencyExchangeRatesData, error) in
//                                                        guard
//                                                            let self = self,
//                                                            let currencyExchangeRatesData = currencyExchangeRatesData
//                                                            else {
//                                                                return
//                                                        }
//
//                                                        self.currencyExchangesRatesTable.value = [currencyExchangeRatesData]
//        }
//    }
}
