import Foundation
import CoreLocation

struct FarmersMarket: Identifiable, Equatable {
    let id = UUID()
    let name: String
    let address: String
    let manager: String
    let days: [String]
    let hours: String
    let phone: String
    let coordinate: CLLocationCoordinate2D
    
    static func == (lhs: FarmersMarket, rhs: FarmersMarket) -> Bool {
        lhs.id == rhs.id
    }
}

extension FarmersMarket {
    var daysString: String {
        days.joined(separator: ", ")
    }
    
    var fullAddress: String {
        address
    }
    
    func isOpenOn(_ day: String) -> Bool {
        days.contains(day)
    }
}