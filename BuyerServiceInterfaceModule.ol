interface BuyerShipperInterface {
    OneWay:
        details(string)
}

interface BuyerSellerInterface {
    RequestResponse:
        quote (string)(int)

}
