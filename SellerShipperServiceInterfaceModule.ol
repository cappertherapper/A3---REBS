interface SellerShipperInterface {
    OneWay:
        order(string)
}

interface SellerInterface {
    OneWay:
        accept( string ),
        reject( string )
    RequestResponse:
        ask(string)(int)
}
