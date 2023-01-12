
// type QuoteRequest: void {
//     item: string
// }
// type OrderRequest: void {

// }
type QuoteResponse: void {
    price: int 
}
type ResponseDetails: void {
    invoice: string
}


interface BuyerShipperInterface {
    OneWay:
        details(string)
}

interface BuyerSellerInterface {
    OneWay:
        quote (int)
}
