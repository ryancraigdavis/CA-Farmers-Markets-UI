import Foundation
import CoreLocation

extension FarmersMarket {
    static let sampleMarkets = [
        FarmersMarket(
            name: "Pomona Valley Certified Farmers Market",
            address: "683 N Garey Ave, Garey Ave. & Pearl St., Pomona, 91767",
            manager: "Harry Brown-Hiegel",
            days: ["Saturday"],
            hours: "9am - 1pm",
            phone: "(818) 591-8161",
            coordinate: CLLocationCoordinate2D(latitude: 34.0631, longitude: -117.7488)
        ),
        FarmersMarket(
            name: "Santa Monica Farmers Market - Saturday Downtown",
            address: "Arizona Ave. @ 3rd St., Santa Monica, 90401",
            manager: "Tyler Hill",
            days: ["Saturday"],
            hours: "8am - 1pm",
            phone: "(661) 313-1000",
            coordinate: CLLocationCoordinate2D(latitude: 34.0122, longitude: -118.4921)
        ),
        FarmersMarket(
            name: "Santa Monica Farmers Market - Saturday Pico",
            address: "2200 Virginia Ave., corner Virginia Ave. & Cloverfield Ave., Santa Monica, 90404",
            manager: "Kym Otterstedt",
            days: ["Saturday"],
            hours: "8am - 1pm",
            phone: "(323) 330-4722",
            coordinate: CLLocationCoordinate2D(latitude: 34.0230, longitude: -118.4782)
        ),
        FarmersMarket(
            name: "Palos Verdes Farmers Market",
            address: "27118 Silver Spur Rd., Hawthorne / Silver Spur, Rolling Hills Estates, 90275",
            manager: "Brian Weiss",
            days: ["Sunday"],
            hours: "8am - 1pm",
            phone: "(323) 373-3358",
            coordinate: CLLocationCoordinate2D(latitude: 33.7853, longitude: -118.3607)
        ),
        FarmersMarket(
            name: "Studio City Farmers Market",
            address: "1 Ventura Place between Laurel Canyon Blvd. and Radford Ave., Studio City, 91604",
            manager: "Esther Walker",
            days: ["Sunday"],
            hours: "8am - 1pm",
            phone: "(818) 591-8161",
            coordinate: CLLocationCoordinate2D(latitude: 34.1388, longitude: -118.3952)
        ),
        FarmersMarket(
            name: "Larchmont Sunday CFM",
            address: "209 N Larchmont Blvd, Lot #694, at Beverly, Los Angeles, 90067",
            manager: "Aurora Vaughn",
            days: ["Sunday"],
            hours: "10am - 2pm",
            phone: "(562) 308-7364",
            coordinate: CLLocationCoordinate2D(latitude: 34.0740, longitude: -118.3230)
        )
    ]
}