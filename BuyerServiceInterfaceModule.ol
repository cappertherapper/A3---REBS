type AskRequest: void {
    product: string
}

type AskResponse: void {
    product: string
}

type AcceptRequest: void {
    price: int
}

type AcceptResponse: void {
    order: int
}

type RejectRequest: void {
    price: int
}

type DetailsRequest: void { //i tvivl
    invoice: int
}

type DetailsResponse: void {
    
}


interface BuyerShipperInterface {
    RequestResponse:
        details(Details)(d)
}

interface BuyerSellerInterface {
    RequestResponse:
        ask( AskRequest )( AskResponse ),
        accept( AcceptRequest )( bool ),
        reject( RejectRequest )( bool )
}
