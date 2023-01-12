type QuoteRequest: void {
    item: string
}
type QuoteResponse: void {
    price: int 
}

interface SellerShipperInterface {
    RequestResponse:
    
}

interface SellerInterface {
    RequestResponse:
        quote( QuoteRequest )( QuoteResponse )
        order( OrderRequest )( OrderResponse )
}
