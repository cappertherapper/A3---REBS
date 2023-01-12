from SellerShipperServiceInterfaceModule import SellerInterface

from BuyerServiceInterfaceModule import BuyerShipperInterface, BuyerSellerInterface

include "console.iol"

service SellerService {
    execution{ single }

    outputPort Buyer {
        location: "socket://localhost:8002"
        protocol: http { format = "json" }
        interfaces: BuyerSellerInterface
    }

    inputPort BuyerSeller {
        location: "socket://localhost:8000"
        protocol: http { format = "json" }
        interfaces: SellerInterface
    }



    main {
        [ask(product)]{
            quote@Buyer(15)
            [accept(response)]{
                if (response == true) {
                    Order@SellerShipper()
                }
            }
        }

    } 
}