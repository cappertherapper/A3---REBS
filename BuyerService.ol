from SellerShipperServiceInterfaceModule import SellerInterface

from BuyerServiceInterfaceModule import BuyerShipperInterface, BuyerSellerInterface

include "console.iol"


service BuyerService {
    execution{ single }

    outputPort Seller1 {
        location: "socket://localhost:8000"
        protocol: http { format = "json" }
        interfaces: SellerInterface
    }
    outputPort Seller2 {
        location: "socket://localhost:8111"
        protocol: http { format = "json" }
        interfaces: SellerInterface
    }

    inputPort ShipperBuyer {
        location: "socket://localhost:8001"
        protocol: http { format = "json" }
        interfaces: BuyerShipperInterface
    }

    inputPort SellerBuyer1 {
        location: "socket://localhost:8002"
        protocol: http { format = "json" }
        interfaces: BuyerSellerInterface
    }

    inputPort SellerBuyer2 {
        location: "socket://localhost:8222"
        protocol: http { format = "json" }
        interfaces: BuyerSellerInterface
    }

    main {

        ask@Seller1("chips"){[quote(price1)]} | ask@Seller2("chips"){[quote(price2)]}
            {
                if (price1 <= price2) {
                    reject@Seller2("Not ok to buy chips for " + price)
                    if (price1 <20) {
                        println@Console( "price lower than 20")()
                        accept@Seller1("Ok to buy chips for " + price1)
                        [details(invoice)]
                        println@Console( "Received "+invoice+" from Shipper1!")()
                    } else {
                    println@Console( "price not lower than 20")()
                    reject@Seller1("Not ok to buy chips for " + price)
                    }
                    
                } else {
                    reject@Seller1("Not ok to buy chips for " + price)
                    if (price <20) {
                        println@Console( "price lower than 20")()
                        accept@Seller2("Ok to buy chips for " + price)
                        [details(invoice)]
                        println@Console( "Received "+invoice+" from Shipper2!")()
                    } else {
                    println@Console( "price not lower than 20")()
                    reject@Seller2("Not ok to buy chips for " + price)
                    }
                }
            }
    } 
}