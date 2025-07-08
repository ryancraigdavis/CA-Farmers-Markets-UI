import SwiftUI

struct MarketDetailView: View {
    let market: FarmersMarket
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    headerSection
                    
                    detailsSection
                    
                    contactSection
                    
                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Market Details")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
    }
    
    private var headerSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(market.name)
                .font(.title2)
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
            
            HStack {
                Image(systemName: "calendar")
                    .foregroundColor(.green)
                Text(market.daysString)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            HStack {
                Image(systemName: "clock")
                    .foregroundColor(.green)
                Text(market.hours)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
    
    private var detailsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            SectionHeader(title: "Location")
            
            HStack(alignment: .top, spacing: 12) {
                Image(systemName: "location")
                    .foregroundColor(.green)
                    .font(.title3)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(market.address)
                        .font(.body)
                        .multilineTextAlignment(.leading)
                    
                    Button(action: {
                        openInMaps()
                    }) {
                        Text("Open in Maps")
                            .font(.subheadline)
                            .foregroundColor(.blue)
                    }
                }
            }
            
            SectionHeader(title: "Manager")
            
            HStack {
                Image(systemName: "person.circle")
                    .foregroundColor(.green)
                    .font(.title3)
                
                Text(market.manager)
                    .font(.body)
            }
        }
    }
    
    private var contactSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            SectionHeader(title: "Contact")
            
            HStack {
                Image(systemName: "phone")
                    .foregroundColor(.green)
                    .font(.title3)
                
                Button(action: {
                    callPhone()
                }) {
                    Text(market.phone)
                        .font(.body)
                        .foregroundColor(.blue)
                }
            }
        }
    }
    
    private func openInMaps() {
        let latitude = market.coordinate.latitude
        let longitude = market.coordinate.longitude
        let url = URL(string: "maps://?ll=\(latitude),\(longitude)&q=\(market.name.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")")
        
        if let url = url, UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
    
    private func callPhone() {
        let phoneNumber = market.phone.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        if let url = URL(string: "tel:\(phoneNumber)"), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
}

struct SectionHeader: View {
    let title: String
    
    var body: some View {
        Text(title)
            .font(.headline)
            .fontWeight(.semibold)
            .foregroundColor(.primary)
    }
}

#Preview {
    MarketDetailView(market: FarmersMarket.sampleMarkets[0])
}