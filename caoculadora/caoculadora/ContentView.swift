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
    @State var failedInput = false
    @State var zeroInput = false
    let tituloPreencherCampos = "Preencha os campus para poder cãocular!"
    let tituloCamposZero = "Algum dos campos precisa ter valor maior que zero"
    
    var body: some View {
        NavigationStack {

            ScrollView {
                VStack {
                    VStack (alignment: .leading, spacing: 20.0) {
                        Text("Qual a idade do seu cão?")
                            .font(.header5)
                            .padding(.top, 24)
                        VStack (alignment: .leading, spacing: 8.0) {
                            Text("Anos")
                                .font(.body1)
                            TextField(
                                "quantos anos completos seu cão tem",
                                value: $years,
                                format: .number
                            )
                        }
                        VStack (alignment: .leading, spacing: 8.0) {
                            Text("Meses")
                                .font(.body1)
                            TextField(
                                "E quantos anos meses além disso ele tem",
                                value: $months,
                                format: .number
                            )
                        }
                    }
                    
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
                        Text("Seu Cachorro tem, em idade humana...")
                            .font(.body1)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        Text("\(result) anos")
                            .contentTransition(.numericText())
                            .font(.display)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        
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
                            Color.indigo600
                            Text("CãoCular")
                                .foregroundStyle(.white)
                                .font(.body1)
                        }
                    })
                    .cornerRadius(10)
                    .frame(height: 50)
                }
                .containerRelativeFrame(.vertical)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
                .bold()
                .fontDesign(.rounded)
                .padding()
                .navigationTitle("Cãoculadora")
                .toolbarBackground(.visible, for: .navigationBar)
                .toolbarBackground(.indigo600, for: .navigationBar)
                .toolbarColorScheme(.dark, for: .navigationBar, .tabBar)
                .alert(tituloPreencherCampos, isPresented: $failedInput) {
                    Button("OK", role: .cancel, action: {})
                }
                .alert(tituloCamposZero, isPresented: $zeroInput) {
                    Button("OK", role: .cancel, action: {})
                }
            }
            
        }
        .animation(.easeOut, value: result)
        .scrollDismissesKeyboard(.immediately)
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
            zeroInput = true
            return
        }
      
        withAnimation(.easeIn.speed(0.5)) {
            result = porteSelecionado.conversaoDeIdade(
                anos: years,
                meses: months)
            
        }
        
    }
}

#Preview {
    ContentView()
}
