//
//  ContentView.swift
//  LOTRConverter
//
//  Created by dtharpeuno on 12/17/25.
//

import SwiftUI
import TipKit

struct ContentView: View {
	
	// state property
	@State var showExchangeInfo = false
	@State var showSelectedCurrency = false
	@State var leftAmount = ""
	@State var rightAmount = ""
	
	@FocusState var leftTyping
	@FocusState var rightTyping
	
	@State var leftCurrency:  Currency = .silverPiece
	@State var rightCurrency: Currency = .goldPiece
	
	let currencyTip = CurrencyTip()
	
	// property view
	var body: some View {
		ZStack {
			// bg image
			Image(.background)
				.resizable()
				.ignoresSafeArea()
			
			VStack {
				// pony
				Image(.prancingpony)
					.resizable()
					.scaledToFit()
					.frame(height: 200)
				
				
				// exchanged text
				Text("Currency Exchange")
					.font(.largeTitle)
					.foregroundStyle(.white)
				
				// conversion
				HStack {
					
					// Left
					VStack {
						
						// currency
						HStack {
							// currency image
							Image(leftCurrency.image)
								.resizable()
								.scaledToFit()
								.frame(height: 33)
							//curency text
							Text(leftCurrency.name)
								.font(.headline)
								.foregroundStyle(.white)
						}
						.padding(.bottom, -5)
						.onTapGesture {
							showSelectedCurrency.toggle()
							currencyTip.invalidate(reason: .actionPerformed)
						}
						.popoverTip(currencyTip, arrowEdge: .bottom)
						
						TextField("Amount", text: $leftAmount)
							.textFieldStyle(.roundedBorder)
							.focused($leftTyping)
					}

					// Equal sign
					VStack {
						Image(systemName: "equal")
							.font(.largeTitle)
							.foregroundStyle(.white)
							.symbolEffect(.pulse)
					}
					
					
					// Right
					VStack {
						// currency
						HStack {
							// currency text
							Text(rightCurrency.name)
								.font(.headline)
								.foregroundStyle(.white)
							
							//curency image
							Image(rightCurrency.image)
								.resizable()
								.scaledToFit()
								.frame(height: 33)
						}
						.padding(.bottom, -5)
						.onTapGesture {
							showSelectedCurrency.toggle()
							currencyTip.invalidate(reason: .actionPerformed)
						}
						
						TextField("Amount", text: $rightAmount)
							.textFieldStyle(.roundedBorder)
							.multilineTextAlignment(.trailing)
							.focused($rightTyping)
					}
					
				}
				.padding()
				.background(.black.opacity(0.5))
				.keyboardType(.decimalPad)
				
				
				Spacer()
				
				HStack {
					//spacer method
					Spacer()
					
					//info button
					Button {
						showExchangeInfo.toggle()
					} label: {
						Image(systemName: "info.circle.fill")
							.font(.largeTitle)
							.foregroundStyle(.white)
					}
					.padding(.trailing)
					
				}
			}
		}
		.task {
			try? Tips.configure()
		}
		
		// onchange
		.onChange(of: rightAmount) {
			if rightTyping {
				leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
			}
		}
		.onChange(of: leftAmount) {
			if leftTyping {
				rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
			}
		}
		.onChange(of: leftCurrency) {
			leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
		}
		.onChange(of: rightCurrency) {
			rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
		}
		
		//sheet
		.sheet(isPresented: $showExchangeInfo) {
			ExchangeInfo()
		}
		.sheet(isPresented: $showSelectedCurrency) {
			SelectCurrency(
				topCurrency: $leftCurrency,
				bottomCurrency: $rightCurrency
			)
		}
	}
}




// show preview
#Preview {
	ContentView()
}
