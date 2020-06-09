//
//  ContentView.swift
//  DogOrCat
//
//  Created by Yuet Yu Melody Lam  on 6/4/20.
//  Copyright © 2020 Yuet Yu Melody Lam . All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var weight: String = ""
    @State var classification: String = "Not Determined"
    
    
    
    var body: some View {
        
        
        
        VStack{
        Text("Dog or Cat?")
            .font(.title)
        TextField("Enter weight", text: $weight).textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button(action:{
                
                //action after button is tapped
                self.classification = self.weight
                //get the string from textfield
                self.classibyAnimal()

                
            }){
                Text("Button Tapped")
            }
            
            Text("Cat or Dog: \(classification)")
            
        }.padding()
    }
    
    //function to use model
    func classibyAnimal() {
        
        //load the model
        let model = DogOrCat()
        //make the inputs
        //how to do safe typecasting????
        var input = Double(weight)
        
        
        //use exceptions to make predictions and catch errors if prediction cannot be made.
        do {
            //use this function to use the model with inputs.
            let prediction = try model.prediction(weight_in_kg: Double(input!))
            
            //get the output of the model by accessing the which output you would like.
            self.classification = prediction.animal
        }
       
        catch {
            print("Bad input and error occured")
        }
        
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
