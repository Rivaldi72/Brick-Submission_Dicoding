//
//  RemoteDataSource.swift
//  Brick
//
//  Created by Rivaldi Aliando on 29/11/20.
//

import Foundation
import Alamofire
import RxSwift

protocol RemoteDataSourceProtocol: class {
  
  func getAllGames() -> Observable<[GameResponse]>
  
  func getLatestGames() -> Observable<[GameResponse]>
  
  func getGamesByGenre(result: @escaping (Result<[GameResponse], URLError>) -> Void)
}

final class RemoteDataSource: NSObject {
  
  private override init() { }
  
  static let sharedInstance: RemoteDataSource =  RemoteDataSource()
  
}

extension RemoteDataSource: RemoteDataSourceProtocol {
  
  func getAllGames() -> Observable<[GameResponse]> {
    return Observable<[GameResponse]>.create { observer in
      if let url = URL(string: Endpoints.Gets.all.url) {
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
  
  func getLatestGames() -> Observable<[GameResponse]> {
    return Observable<[GameResponse]>.create { observer in
      if let url = URL(string: Endpoints.Gets.latest.url) {
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
  
  func getGamesByGenre(
      result: @escaping (Result<[GameResponse], URLError>) -> Void
    ) {
      guard let url = URL(string: Endpoints.Gets.genre.url) else { return }
      AF.request(url)
        .validate()
        .responseDecodable(of: GamesResponse.self) { response in
          switch response.result {
          case .success(let value):
            result(.success(value.results))
          case .failure:
            result(.failure(.invalidResponse))
          }
      }
    }
  
}
