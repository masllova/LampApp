//
//  ContentView.swift
//  lamp
//
//  Created by Александра Маслова on 24.01.2023.
//

import SwiftUI



struct ContentView: View {
    
    @State var isTurnOn = false
    
    var phrase = ["You've always been a fighter, I know you can handle it", "Your mistakes and failures don't define you" , "I'm with you, you will succeed", "If you can't win, change the rules of the game", "Whatever happens, don't lose yourself", "We define the purpose of life ourselves by living it", "If love then love, if fun then fun, if shoot then shoot", "When you are sitting at the bottom, in a complete ass, if you remain a good person, then you have already done everything right", "Failure is part of the road to success", "Whatever is not done is for the better, and what is done is also for the better", "Always acting like failure is impossible", "Wherever you are: do what you can with what you have"]
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(self.isTurnOn == false ? .black : .white)
                .ignoresSafeArea()
            VStack (spacing: 0) {
                Rectangle()
                    .foregroundColor(self.isTurnOn == false ? .white : .gray)
                    .frame(width: 7, height: 100)
               
                if isTurnOn == false {Lamp()}
                else {LampOn()}
                Spacer()
            }
            VStack {
                HStack {
                    Spacer()
                    VStack (spacing: 0){
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundColor(.gray)
                            .frame(width: 3, height: 350)
                        
                        Button(action: {
                            self.isTurnOn.toggle()
                        }, label: {
                            Image(systemName: "power.circle.fill")
                                 .resizable()
                                 .frame(width: 40, height: 40)
                                 .foregroundColor(.gray)
                        })
                    } .padding(.horizontal, 20)
                }
                Spacer()
                
                VStack {
                    Spacer()
                    Text("\(phrase.randomElement()!)")
                        .font(.system(.title, design: .monospaced))
                        .multilineTextAlignment(.center)
                        .padding(.vertical, 50)
                        .padding(.bottom, 50)
                }
            }
        }
        
    }
}

struct Lamp: View {
    var body: some View {
        Image(systemName: "lightbulb.fill")
            .resizable()
            .frame(width: 80, height: 150)
            .symbolRenderingMode(.palette)
            .foregroundStyle(.black, .white)
            .rotationEffect(.degrees(180))
    }
}

struct LampOn: View {
    var body: some View {
                Image(systemName: "lightbulb.fill")
                    .resizable()
                    .frame(width: 80, height: 150)
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(.yellow, .gray)
                    .rotationEffect(.degrees(180))
                    .shadow(color: .yellow, radius: 10)
            }
        }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
