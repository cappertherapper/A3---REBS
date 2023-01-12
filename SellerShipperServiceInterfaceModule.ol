type QuoteRequest: void {
    item: string
}
type QuoteResponse: void {
    price: int 
}
type OrderRequest: void {

}
type OrderResponse: void {

}
interface SellerShipperInterface {
    RequestResponse:
        order(OrderRequest)(OrderResponse)
}

interface SellerInterface {
    RequestResponse:
        quote( QuoteRequest )( QuoteResponse )
        // order( OrderRequest )( OrderResponse )
}
