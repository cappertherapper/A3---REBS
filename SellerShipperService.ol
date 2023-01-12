from SellerShipperServiceInterfaceModule import SellerInterface, SellerShipperInterface

from BuyerServiceInterfaceModule import BuyerShipperInterface, BuyerSellerInterface

include "console.iol"


service SellerService {
    execution{ single }
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
        [ask(item)(response)]{
            if (item == "chips") {response=15}
            else {response=0}
        }
        //quote@Buyer(15)
        [accept(item)]{
            order@SellerShipper(item)}
        [reject(item)]
    } 
}