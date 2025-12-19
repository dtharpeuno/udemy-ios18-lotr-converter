//
//  ExchangeInfo.swift
//  LOTRConverter
//
//  Created by dtharpeuno on 12/18/25.
//

import SwiftUI

struct ExchangeInfo: View {
	@Environment(\.dismiss) var dismiss
	
	// property view
	var body: some View {
		
		ZStack {
			
			// bg image
			Image(.parchment)
				.resizable()
				.ignoresSafeArea()
				.background(.brown)
			
			VStack {
				
				//title wtest
				Text("Exchange Rates")
					.font(.largeTitle)
					.tracking(2)
				
				//description text
				Text("Here at the Prancing Pony, we are happy to offer you a place where you can exchange all the known currencies in the entire world except one. We used to take Brandy Bucks, but after finding out that it was a person instead of a piece of paper, we realized it had no value to us. Below is a simple guide to our currency exchange rates:")
					.font(.title3)
					.padding()

				ExchangeRate(leftImage: .goldpiece, text: "1 Gold Piece = 4 Gold Pennies", rightImage: .goldpenny)
				
				ExchangeRate(leftImage: .goldpenny, text: "1 Gold Penny = 4 Silver Pennies", rightImage: .silverpiece)
				
				ExchangeRate(leftImage: .goldpiece, text: "1 Gold Piece = 4 Gold Pennies", rightImage: .goldpenny)
				
				ExchangeRate(leftImage: .goldpiece, text: "1 Gold Piece = 4 Gold Pennies", rightImage: .goldpenny)
				
				// Done Button
				Button("Done") {
					dismiss()
				}
				.buttonStyle(.borderedProminent)
				.tint(.brown.mix(with: .black, by: 0.2))
				.font(.title)
				.padding()
				.foregroundStyle(.white)
			}
			.foregroundStyle(.black)

		}
	}
}

#Preview {
    ExchangeInfo()
}
