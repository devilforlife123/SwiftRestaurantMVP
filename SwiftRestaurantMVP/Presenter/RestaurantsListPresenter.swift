//
//  RestaurantsListPresenter.swift
//  SwiftRestaurantMVP
//
//  Created by suraj poudel on 24/4/2024.
//

import Foundation

final class RestaurantsListPresenter:RestaurantsListPresenterProtocol {
  
  private weak var view: RestaurantsListView?
  private weak var delegate: RestaurantsListPresenterDelegate?

  private weak var router: RestaurantsListRouterProtocol!
  private var restaurantsInfoModel:RestaurantsInfoModel?
  private var viewState: RestaurantsListViewState = .clear {
      didSet {
          guard oldValue != viewState else {
              return
          }
          view?.changeViewState(viewState: viewState)
      }
  }
  
  init(view: RestaurantsListView?,
       router: RestaurantsListRouterProtocol,
       delegate: RestaurantsListPresenterDelegate?) {
      self.view = view
      self.router = router
      self.delegate = delegate
  }

  func didScrollBeyondCurrentPage() {
      guard viewState != .loading, !isAllModelsDisplayed() else { // already loading or all models availble
          return
      }
      viewState = .loading
      delegate?.handleNextPageRequest()
  }

  private func isAllModelsDisplayed() -> Bool {
    //find out that all the models have already been displayed
    let isAllModelsAlreadyDisplayed = !(restaurantsInfoModel?.restaurantsModels ?? []).isEmpty && restaurantsInfoModel?.nextPageInfo == nil
    return isAllModelsAlreadyDisplayed
  }

  func didSelectRow(indexPath: IndexPath) {
    guard let restaurantsInfoModel = restaurantsInfoModel else {
      return
    }
    let selectedRestaurantModel = restaurantsInfoModel.restaurantsModels[indexPath.row]
    router.showRestaurantDetails(model: selectedRestaurantModel)
  }

  private func getCellViewModel(restaurantModel: RestaurantModel) -> RestaurantCellViewModel {
      var statusString: String?
      if let status = restaurantModel.openStatus {
          statusString = status ? "Open" : "Closed"
      }
      return RestaurantCellViewModel(imageURL: restaurantModel.imageURL,
                                     name: restaurantModel.name,
                                     status: statusString)
  }
}
extension RestaurantsListPresenter:RestaurantsListChildPresenterProtocol {
  func setRestaurantsInfoModel(_ model: RestaurantsInfoModel?) {

    //Create cellViewModels from the restaurantsInfoModel

    restaurantsInfoModel = model
    let rowsViewModels = (restaurantsInfoModel?.restaurantsModels ?? []).map {
        getCellViewModel(restaurantModel: $0)
    }
    let screenViewModel = RestaurantsListViewState.ViewModel(rowsViewModels: rowsViewModels)
    //Now Change the view State
    viewState = .render(viewModel: screenViewModel)
  }
}

extension RestaurantsListPresenter:TableViewDataSource {
  func numberOfRowsInSection(section:Int) -> Int {
    return restaurantsInfoModel?.restaurantsModels.count ?? 0
  }

  func viewModelForCell(at indexPath: IndexPath) -> CellViewModel? {
    guard let restaurantModel = restaurantsInfoModel?.restaurantsModels[indexPath.row] else {
      return nil
    }
    let cellViewModel = getCellViewModel(restaurantModel: restaurantModel)
    return cellViewModel
  }
}
