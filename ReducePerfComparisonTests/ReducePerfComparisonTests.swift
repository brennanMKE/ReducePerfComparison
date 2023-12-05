import XCTest
@testable import ReducePerfComparison

final class ReducePerfComparisonTests: XCTestCase {
    let maxCount = 25_000
    let separator = Data("\0".utf8)

    // Test using reduce(_:_:)
    func testReduceConcatenation() {
        let dataArray = generateTestData(count: maxCount)

        measure {
            let _ = dataArray.reduce(Data()) { (result, element) in
                var newResult = result
                if !newResult.isEmpty {
                    newResult.append(separator)
                }
                newResult.append(element)
                return newResult
            }
        }
    }

    // Test using reduce(into:_:)
    func testReduceIntoConcatenation() {
        let dataArray = generateTestData(count: maxCount)

        measure {
            let _ = dataArray.reduce(into: Data()) { (result, element) in
                if !result.isEmpty {
                    result.append(separator)
                }
                result.append(element)
            }
        }
    }

    // Test using Data(dataArray.joined(separator: separator))
    func testJoinedConcatenation() {
        let dataArray = generateTestData(count: maxCount)

        measure {
            let x = dataArray.joined(separator: separator)
            let _ = Data(x)
        }
    }

    private func generateTestData(count: Int) -> [Data] {
        (1...count).map { Data("\($0)".utf8) }
    }

}
