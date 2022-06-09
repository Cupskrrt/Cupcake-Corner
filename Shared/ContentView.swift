//
//  ContentView.swift
//  Shared
//
//  Created by Luthfi Khan on 09/06/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var order = Order()
    
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    Picker("Select your cake type", selection: $order.type){
                        ForEach(Order.types.indices){
                            Text(Order.types[$0])
                        }
                    }
                    
                    Stepper("Number of cakes: \(order.quantity)", value:$order.quantity, in: 3...20)
                }
                
                Section{
                    Toggle("Special Request", isOn: $order.specialReqEnabled.animation())
                    
                    if order.specialReqEnabled{
                        Toggle("Add extra frosting", isOn: $order.extraFrosting)
                        Toggle("Add extra Sprinkle", isOn: $order.addSprinkles )
                    }
                }
                
                Section{
                    NavigationLink{
                        AddressView(order: order)
                    } label: {
                        Text("Delivery Details")
                    }
                }
            }
            .navigationTitle("Cupcake Corner")
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
