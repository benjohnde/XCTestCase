import XCTest

extension XCTestCase {
    func XCTAssertOptionalNotEmpty<T: Equatable>(actual: @autoclosure () -> T?, file: String = #file, line: UInt = #line) {
        if actual() == nil {
            self.recordFailure(withDescription: "Optional value is empty", inFile: file, atLine: line, expected: true)
        }
    }

    func XCTAssertOptionalEmpty<T: Equatable>(actual: @autoclosure () -> T?, file: String = #file, line: UInt = #line) {
        if let o = actual() {
            self.recordFailure(withDescription: "Optional value \(o) is not empty", inFile: file, atLine: line, expected: true)
        }
    }

    func XCTAssertEqualOptional<T: Equatable>(actual: @autoclosure () -> T?, _ expected: @autoclosure () -> T, file: String = #file, line: UInt = #line) {
        if let a = actual() {
            let e = expected()
            if a != e {
                self.recordFailure(withDescription: "Optional (\(a)) is not equal to (\(e))", inFile: file, atLine: line, expected: true)
            }
            return
        }
        self.recordFailure(withDescription: "Actual Optional value is empty", inFile: file, atLine: line, expected: true)
    }

    func XCTAssertEqualOptional<T: Equatable>(actual: @autoclosure () -> T?, _ expected: @autoclosure () -> T?, file: String = #file, line: UInt = #line) {
        if actual() == nil {
            self.recordFailure(withDescription: "Actual Optional value is empty", inFile: file, atLine: line, expected: true)
        }
        if expected() == nil {
            self.recordFailure(withDescription: "Expected Optional value is empty", inFile: file, atLine: line, expected: true)
        }
        guard let a = actual(), let e = expected() else { return }
        if a != e {
            self.recordFailure(withDescription: "Optional (\(a)) is not equal to Optional (\(e))", inFile: file, atLine: line, expected: true)
        }
    }
}
