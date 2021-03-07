import Core
import RxSwift
import Alamofire
import Foundation

public struct GetGamesRemoteDataSource: DataSource {
    public typealias Request = String
    
    public typealias Response = [GameResponse]
    
    private let _endpoint: String
    
    public init(endpoint: String) {
        _endpoint = endpoint
    }
    
    public func execute(request: Request?) -> Observable<[GameResponse]> {
        return Observable<[GameResponse]>.create { observer in
            if let url = URL(string: _endpoint + (request ?? "")) {
                AF.request(url)
                    .validate()
                    .responseDecodable(of: GamesResponse.self) { response in
                        switch response.result {
                        case .success(let value):
                            observer.onNext(value.results)
                            observer.onCompleted()
                        case .failure:
                            observer.onError(URLError.invalidResponse)
                        }
                    }
            }
            return Disposables.create()
        }
    }
}
