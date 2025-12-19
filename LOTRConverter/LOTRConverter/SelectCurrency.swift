//
//  SelectCurrency.swift
//  LOTRConverter
//
//  Created by dtharpeuno on 12/18/25.
//

import SwiftUI


struct SelectCurrency: View {
	@Environment(\.dismiss) var dismiss
	
	@Binding var topCurrency: Currency
	@Binding var bottomCurrency: Currency
	
	var body: some View {
		ZStack {
			// bg image
			Image(.parchment)
				.resizable()
				.ignoresSafeArea()
				.background(.brown)
			
			VStack {
				
				//Text
				Text("Select the currency you are starting with:")
					.fontWeight(.bold)
				
				//currency icons
				IconGrid(currency: $topCurrency)
				
				//Text
				Text("Select the currency you would like to convert to:")
					.fontWeight(.bold)
					.padding(.top)
				
				//currency icons
				IconGrid(currency: $bottomCurrency)
				
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
			.padding()
			.multilineTextAlignment(.center)
			.foregroundStyle(.black)
		}
		
	}
}
#Preview {
	@Previewable @State var topCurrency: Currency = .silverPenny
	@Previewable @State var bottomCurrency: Currency = .goldPiece
	
	SelectCurrency(topCurrency: $topCurrency, bottomCurrency: $bottomCurrency)
}


