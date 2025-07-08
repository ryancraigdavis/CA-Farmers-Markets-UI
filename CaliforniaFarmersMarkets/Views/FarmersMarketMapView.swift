import SwiftUI
import MapKit

struct FarmersMarketMapView: View {
    @State private var selectedMarket: FarmersMarket?
    @State private var selectedDay: String = "All"
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 34.0522, longitude: -118.2437), // Los Angeles center
        span: MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
    )
    
    private let daysOfWeek = ["All", "Saturday", "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]
    
    private var filteredMarkets: [FarmersMarket] {
        if selectedDay == "All" {
            return FarmersMarket.sampleMarkets
        } else {
            return FarmersMarket.sampleMarkets.filter { $0.isOpenOn(selectedDay) }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                dayFilterView
                
                Map(coordinateRegion: $region, annotationItems: filteredMarkets) { market in
                    MapAnnotation(coordinate: market.coordinate) {
                        MarketPin(market: market) {
                            selectedMarket = market
                        }
                    }
                }
                .ignoresSafeArea(edges: .bottom)
            }
            .navigationTitle("CA Farmers Markets")
            .navigationBarTitleDisplayMode(.inline)
            .sheet(item: $selectedMarket) { market in
                MarketDetailView(market: market)
            }
        }
    }
    
    private var dayFilterView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(daysOfWeek, id: \.self) { day in
                    Button(action: {
                        selectedDay = day
                    }) {
                        Text(day)
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(selectedDay == day ? .white : .primary)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(selectedDay == day ? Color.green : Color(UIColor.systemGray6))
                            )
                    }
                }
            }
            .padding(.horizontal)
        }
        .padding(.vertical, 12)
        .background(Color(UIColor.systemBackground))
    }
}

struct MarketPin: View {
    let market: FarmersMarket
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            Image(systemName: "mappin")
                .font(.title2)
                .foregroundColor(.green)
                .background(
                    Circle()
                        .fill(Color.white)
                        .frame(width: 30, height: 30)
                        .shadow(radius: 3)
                )
        }
    }
}

#Preview {
    FarmersMarketMapView()
}