
type QuoteRequest: void {
    item: string
}
type QuoteResponse: void {
    price: int 
}
type OrderRequest: void {

}
type ResponseDetails: void {
    invoice: string
}


interface BuyerShipperInterface {
    OneWay:
        details(ResponseDetails)
}

interface BuyerSellerInterface {
    OneWay:
        quote (QuoteResponse)
}
