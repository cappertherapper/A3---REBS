from SellerShipperServiceInterfaceModule import SellerShipperInterface

from BuyerServiceInterfaceModule import BuyerShipperInterface

include "console.iol"
service ShipperService {
    execution{ single }
    inputPort SellerShipper {
        location: "socket://localhost:8010"
        protocol: http { format = "json" }
        interfaces: SellerShipperInterface
    }

    outputPort ShipperBuyer {
        location: "socket://localhost:8001"
        protocol: http { format = "json" }
        interfaces: BuyerShipperInterface
    }
    main {
        [order(OrderRequest)]{details@ShipperBuyer("invoice")}
    }
}