//
//  CalculatorBtnView.swift
//  calculator-app
//
//  Created by Matúš Klasovitý on 29/04/2022.
//

import SwiftUI


struct CalculatorBtnView: View {
    let text: String?
    let image: Image?
    let key: CalculatorKey
    let onKeyClick: (_ key: CalculatorKey) -> Void
    let backgroundColor: Color
    
    init(text: String, key: CalculatorKey, onKeyClick: @escaping (_ key: CalculatorKey) -> Void, backgroundColor: Color = Color.btnColor) {
        self.text = text
        self.key = key
        self.onKeyClick = onKeyClick
        self.backgroundColor = backgroundColor
        self.image = nil
    }
    
    init(image: Image, key: CalculatorKey, onKeyClick: @escaping (_ key: CalculatorKey) -> Void, backgroundColor: Color = Color.btnColor) {
        self.image = image
        self.key = key
        self.onKeyClick = onKeyClick
        self.backgroundColor = backgroundColor
        self.text = nil
    }
    
    var body: some View {
        Button {
            // AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
            Vibration.medium.vibrate()
            onKeyClick(key)
        } label: {
            if let text = text {
                Text(text)
                    .font(.title2)
                    .fontWeight(.semibold)
                    //.padding()
                    .frame(width: 70, height: 70)
                    .background(backgroundColor)
                    .cornerRadius(10)
                    .shadow(radius: 3)
            }
            
            if let image = image {
                image
                    .resizable()
                    .padding(.all, 25)
                    .frame(width: 70, height: 70)
                    .background(backgroundColor)
                    .cornerRadius(10)
                    .shadow(radius: 3)
            }
            
        }.buttonStyle(.borderless)

        
    }
}

struct CalculatorBtnView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorBtnView(
            text: "C",
            key: .keyClear,
            onKeyClick: { key in
                print(key.rawValue)
            }
        )
            .preferredColorScheme(.dark)
    }
}
