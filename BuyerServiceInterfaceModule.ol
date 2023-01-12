type AskRequest: void {
    term[1,*]: int
}

type AcceptResponse: void {
    minuend: int
    subtraend: int
}

type RejectResponse: void {
    factor*: double
}


interface BuyerShipperInterface {
    RequestResponse:
}

interface BuyerSellerInterface {
    RequestResponse:
        ask( AskRequest )( int ),
        accept( AcceptResponse )( int ),
        reject( RejectResponse )( double ),
}
