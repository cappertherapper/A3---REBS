from SellerShipperServiceInterfaceModule import SellerInterface

from BuyerServiceInterfaceModule import BuyerShipperInterface, BuyerSellerInterface

include "console.iol"

service SellerService {
    execution{ single }

    outputPort Buyer {
        location: "socket://localhost:8000"
        protocol: http { format = "json" }
        interfaces: SellerInterface
    }

    outputPort SellerShipper {

    }
    inputPort ShipperBuyer {
        location: "socket://localhost:8001"
        protocol: http { format = "json" }
        interfaces: BuyerShipperInterface
    }

    inputPort SellerBuyer {
        location: "socket://localhost:8002"
        protocol: http { format = "json" }
        interfaces: BuyerSellerInterface
    }

    main {
        [ask(product)]{
            Quote@Buyer(10)
        }

    } 
}