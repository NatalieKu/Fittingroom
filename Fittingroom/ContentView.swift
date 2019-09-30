//
//  ContentView.swift
//  Fittingroom
//
//  Created by MEI KU on 2019/9/30.
//  Copyright © 2019 Natalie KU. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var images = ["Elie Saab", "Armani", "Dior", "Givenchy","Dolce & Gabbana","Prada"]
    var names = ["Elie Saab", "Armani", "Dior", "Givenchy","Dolce & Gabbana","Prada"]
   
    @State private var selectedIndex = 0

    @State private var isSun = true
    
    @State private var age: CGFloat = 15
    
    @State private var name = ""
    
    @State private var showAlert = false
    
   var body: some View {

NavigationView {

        VStack {
          Spacer()
        if isSun {
            Image(systemName: "sun.max.fill")
                .resizable()
                .frame(width: 20, height: 20)

        } else {
            Image(systemName: "cloud.rain.fill")
                .resizable()
                .frame(width: 20, height: 20)
         
        }
        Toggle("Weather", isOn: $isSun)
    
            
            
        Text("Age:\(Int(age))")
              Slider(value: $age, in: 15...60, step: 1)
        
         TextField("Where you go", text: $name, onEditingChanged: { (editing) in
                 print("onEditingChanged", editing)
             }) {
                print(self.name)
             }
             .textFieldStyle(RoundedBorderTextFieldStyle())
             .padding()
          
        
        Picker(selection: $selectedIndex, label: Text("Style")) {
            ForEach(0..<images.count) { (index) in
               HStack {
          
                  Text(self.names[index])
                     .foregroundColor(.blue)
                
                }
              
            }
         }
        
            
          Button(action: {
              self.showAlert = true
            
            }) {
             VStack {
                         
                Image(self.images[self.selectedIndex])
                       .renderingMode(.original)
                         Text("How I Look")
                      }
                   }.alert(isPresented: $showAlert) { () -> Alert in
                    var comment:String
                    var point:Int
            
                    if isSun == true && age < 30 && name == "Party" && selectedIndex == 0 {
                    
                        comment = "Your style looks perfect."
                        point = 100
                        
                    } else if isSun == true && name == "Office" && selectedIndex == 4  {
                    
                        comment = " You looks like a office lady."
                        point = 99
                    
                    }else if isSun == true && age >= 35 && name == "Office" && selectedIndex == 5  {
                                                      
                        comment = " You looks like a career woman."
                        point = 95
                        
                                     
                  }else {
                                
                        point = 75
                        comment = "You looks nice , not ok at offcie."
                    }
                    
                    
                    return Alert(title: Text("Style Point:\(point)"), message: Text(comment))
        }
        }
        
        .navigationBarTitle("Girls Fitting Room")
    }
}
}
