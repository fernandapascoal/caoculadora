//
//  ContentView.swift
//  caoculadora
//
//  Created by Fernanda Pascoal on 07/05/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var years: Int? = nil
    @State var months: Int? = nil
    @State var result: Int?
    let portes = ["Pequeno", "Médio", "Grande"]
    @State var porte: String = "Pequeno"

    var body: some View {
        VStack (alignment: .leading) {
            Text("Qual a idade do seu cão?")
                .font(.system(size: 24))
            
            Text("Anos")
            TextField(
                "Digite quantos anos seu cão tem",
                value: $years,
                format: .number
            )
            Text("Meses")
            TextField(
                "E quantos anos meses além disso ele tem",
                value: $months,
                format: .number
            )
            
            Text("Porte")
            
            Picker("Porte", selection: $porte) {
                ForEach(portes, id: \.self) {porte in
                    Text(porte)
                        .tag(porte)
                }
            }
            .pickerStyle(.segmented)
            
            Divider()
            Spacer()
            if let result {
                Text("Seu Cachorro tem, em idade canina...")
                Text("\(result) anos")
            } else {
                Image(ImageResource.clarinha)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, maxHeight: 150)
                    .shadow(radius: 20)
            }
            
            Spacer()
            Button(action: processYears, label: {
                ZStack{
                    Color.indigo
                    Text("CãoCular")
                        .foregroundStyle(.white)
                }
            })
            .cornerRadius(10)
            .frame(height: 50)
            
        }
        .textFieldStyle(.roundedBorder)
        .keyboardType(.numberPad)
        .bold()
        .fontDesign(.rounded)
        .padding()
    }
    
    func processYears() {
        
        // meu resultado vai ser years * 7 + a fração de meses do ano * 7
        guard
            let years,
            let months
        else {
            print("preencha o campo de entrada")
            return
        }
        guard years > 0 || months > 0 else {
            print("algum campo tem que ter valor maior que zero")
            return
        }
        
        result = years * 7
    }
}

#Preview {
    ContentView()
}
