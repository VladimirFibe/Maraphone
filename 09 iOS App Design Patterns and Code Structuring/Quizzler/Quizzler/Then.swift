import Foundation

public protocol Then {}

extension Then where Self: AnyObject {
  @inlinable
  public func then(_ block: (Self) throws -> Void) rethrows -> Self {
    try block(self)
    return self
  }
}

extension NSObject: Then {}
