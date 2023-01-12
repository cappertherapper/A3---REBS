type AskRequest {product: string}

type OrderRequest: void {
    product: string
}

//type AskResponse: void {
//  product: string
//}

type AcceptRequest: void {
    price: string
}

//type AcceptResponse: void {
//    product: bool
//}

type RejectRequest: void {
    price: string
}

//type DetailsRequest: void { //i tvivl
//    invoice: int
//}

//type DetailsResponse: void {
    
//}


interface SellerShipperInterface {
    OneWay:
        order(string)
}

interface SellerInterface {
    OneWay:
        accept( string ),
        reject( string )
    RequestResponse:
        ask(int)(string)
}
