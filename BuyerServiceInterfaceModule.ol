type AskRequest: void {
    item: string
}

type AcceptRequest: void {
    price: int
}


type RejectRequest: void {
    price: int
}

type DetailsRequest: void { //i tvivl
    invoice: int
}

type DetailsResponse: void { //i tvivl
    invoice: int
}

interface BuyerShipperInterface {
    RequestResponse:
        details(DetailsRequest)(DetailsRequest)
}

interface BuyerSellerInterface {
    RequestResponse:
        ask( AskRequest )( string ),
        accept( AcceptRequest )( bool ),
        reject( RejectRequest )( bool ),
}
