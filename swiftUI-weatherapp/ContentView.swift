//
//  ContentView.swift
//  swiftUI-weatherapp
//
//  Created by Danish on 20/05/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false
    
    
    var body: some View {
        
        ZStack {
            
            BackgroundView(color1: isNight ? .black : .blue, color2: isNight ? .gray : .white)
            
            VStack(){
                
                CityTextview(cityName: "california")
                CloudAndDegreeView(cloud: isNight ? "moon.stars.fill" :  "cloud.sun.fill", degree: "70")
                .padding(.bottom,100)
                                                
                HStack(spacing : 20){
                   
                    WeatherView(day: "Tuesday", weatherImage: "cloud.sun.fill", temperature: "30")
                    WeatherView(day: "wednesday", weatherImage: "cloud.sun.fill", temperature: "40")
                    WeatherView(day: "thursday", weatherImage: "cloud.sun.fill", temperature: "50")
                    
                    WeatherView(day: "thursday", weatherImage: "cloud.sun.fill", temperature: "50")
                    
                }
                
                
                Spacer()
               
                Button {
                    isNight.toggle()
                } label: {
                    PrimaryButton(buttonTittle: "click Me")
                }
                
                
                
                Spacer()

            
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherView : View {
    var day : String
    var weatherImage : String
    var temperature : String

    var body: some View {
        VStack(){
            
            Text(day)
                .font(.system(size: 16))
                .foregroundColor(.white)
            
            Image(systemName: weatherImage)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50 , height: 50)
            
            Text(temperature)
                .font(.system(size: 30))
                .foregroundColor(.white)
            
        }
    }
}


struct PrimaryButton : View {
    var buttonTittle : String

    var body: some View {
        Text("Press Me")
            .frame(width: 200 , height: 50)
            .background(Color.white)
            .cornerRadius(7)
    }
}

struct BackgroundView : View {
    var color1 : Color
    var color2 : Color
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [color1 , color2]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}



struct CityTextview : View {
    var cityName : String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32))
            .foregroundColor(.white)
            .padding()
    }
}



struct CloudAndDegreeView : View {
    var cloud : String
    var degree : String

    
    var body: some View {
        
        VStack(spacing : 8){
            Image(systemName: cloud)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/ , height: 100)
            
            Text(degree)
                .font(.system(size: 70))
                .foregroundColor(.white)

        }
    }
}

