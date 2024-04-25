//
//  MainView.swift
//  ButtonSheet
//
//  Created by Omid Heydarzadeh on 4/25/24.
//

import SwiftUI
import MapKit

struct MainView: View {
    @State private var isShowingTravelModes = false
    @State private var selectedTravelName = "car.fill"
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.331516, longitude: -121.891054), span: MKCoordinateSpan(latitudeDelta: 0.9, longitudeDelta: 0.9))
    
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Map(coordinateRegion: $region).ignoresSafeArea()
            
            Button("") {
                isShowingTravelModes.toggle()
            }
            .buttonStyle(TravelModeButton(systemImageName: selectedTravelName))
            .padding(30)
            .sheet(isPresented: $isShowingTravelModes) {
                travelOptionView
//                    .presentationDetents([.medium, .large])
//                    .presentationDetents([.height(300)])
                    .presentationDetents([.fraction(0.20), .fraction(0.40), .fraction(0.60), .fraction(0.80), .fraction(1)])
                    .presentationDragIndicator(.visible)
            }
        }
    }
    
    var travelOptionView: some View {
        VStack(spacing: 20) {
            Text("Select Travel Mode")
            
            HStack(spacing: 16) {
                Button("") {
                    selectedTravelName = "airplane"
                    isShowingTravelModes.toggle()
                }
                .buttonStyle(TravelModeButton(systemImageName: "airplane"))
                
                Button("") {
                    selectedTravelName = "car.fill"
                    isShowingTravelModes.toggle()
                }
                .buttonStyle(TravelModeButton(systemImageName: "car.fill"))
                
                Button("") {
                    selectedTravelName = "ferry.fill"
                    isShowingTravelModes.toggle()
                }
                .buttonStyle(TravelModeButton(systemImageName: "ferry.fill"))
                
                Button("") {
                    selectedTravelName = "tram.fill"
                    isShowingTravelModes.toggle()
                }
                .buttonStyle(TravelModeButton(systemImageName: "tram.fill"))
            }
        }
    }
}


struct Test_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

struct TravelModeButton: ButtonStyle {
    let systemImageName: String
    
    func makeBody(configuration: Configuration) -> some View {
        Image(systemName: systemImageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(.white)
            .frame(width: 33, height: 33)
            .padding()
            .background(Color.pink)
            .clipShape(Circle())
    }
}

#Preview {
    MainView()
}
