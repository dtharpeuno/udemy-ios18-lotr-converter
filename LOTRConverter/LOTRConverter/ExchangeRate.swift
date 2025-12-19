//
//  ExchangeRate.swift
//  LOTRConverter
//
//  Created by dtharpeuno on 12/18/25.
//

import SwiftUI


struct ExchangeRate: View {
	let leftImage: ImageResource
	let text: String
	let rightImage: ImageResource
	
	var body: some View {
		HStack {
			// left currency image
			Image(leftImage)
				.resizable()
				.scaledToFit()
				.frame(height: 33)
			
			
			// exchnage rate text
			Text(text)
			
			//right currencly image
			Image(rightImage)
				.resizable()
				.scaledToFit()
				.frame(height: 33)
		}
		
	}
}
#Preview {
	ExchangeRate(
		leftImage: .silverpenny,
		text: "Hello",
		rightImage: .silverpiece)
}


