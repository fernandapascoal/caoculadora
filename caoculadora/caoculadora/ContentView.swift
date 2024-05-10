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
    @State var porteSelecionado: Porte = .pequeno

    var body: some View {
        VStack (alignment: .leading) {
            Text("Qual a idade do seu cão?")
                .font(.header5)
            
            Text("Anos")
                .font(.body1)
            TextField(
                "Digite quantos anos seu cão tem",
                value: $years,
                format: .number
            )
            Text("Meses")
                .font(.body1)
            TextField(
                "E quantos anos meses além disso ele tem",
                value: $months,
                format: .number
            )
            
            Text("Porte")
                .font(.body1)
            
            Picker("Porte", selection: $porteSelecionado) {
                ForEach(Porte.allCases, id: \.self) {porte in
                    Text(porte.rawValue)
                        .tag(porte)
                }
            }
            .pickerStyle(.segmented)
            
            Divider()
            Spacer()
            if let result {
                Text("Seu Cachorro tem, em idade canina...")
                    .font(.body1)
                Text("\(result) anos")
                    .font(.display)
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
                        .font(.body1)
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
        
        result = porteSelecionado.conversaoDeIdade(
            anos: years,
            meses: months)
        
    }
}

#Preview {
    ContentView()
}
