import UIKit

protocol CurrencyDescribing {
    var symbol: String { get }
    var code: String { get }
}

final class Euro: CurrencyDescribing {
    var symbol: String {
        return "€"
    }

    var code: String {
        return "EUR"
    }
}

final class UnitedStatesDolar: CurrencyDescribing {
    var symbol: String {
        return "$"
    }

    var code: String {
        return "USD"
    }
}

enum Country {
    case unitedStates
    case spain
    case uk
    case greece
}

enum CurrencyFactory {
    //  条件に応じて柔軟にインスタンスを切り替える
    static func currency(for country: Country) -> CurrencyDescribing? {
        switch country {
            case .spain, .greece:
                return Euro()
            case .unitedStates:
                return UnitedStatesDolar()
            default:
                return nil
        }
    }
}

// greece
print(CurrencyFactory.currency(for: .greece)?.symbol ?? "")

// spain
print(CurrencyFactory.currency(for: .spain)?.symbol ?? "")

// unitedStates
print(CurrencyFactory.currency(for: .unitedStates)?.symbol ?? "")

