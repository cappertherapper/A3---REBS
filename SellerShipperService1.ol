from SellerShipperServiceInterfaceModule import SellerInterface, SellerShipperInterface

from BuyerServiceInterfaceModule import BuyerShipperInterface, BuyerSellerInterface

include "console.iol"


service SellerService1 {
    execution{ concurrent }
// 8002 - 8010 - 8000
    outputPort Buyer {
        location: "socket://localhost:8002"
        protocol: http { format = "json" }
        interfaces: BuyerSellerInterface
    }
    outputPort SellerShipper {
        location: "socket://localhost:8010"
        protocol: http { format = "json" }
        interfaces: SellerShipperInterface
    }

    inputPort BuyerSeller {
        location: "socket://localhost:8100"
        protocol: http { format = "json" }
        interfaces: SellerInterface
    }



    main {
        [ask(item)(21)]
        [accept(item)]{
            order@SellerShipper(item)}
        [reject(item)]
    } 
}