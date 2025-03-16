extension Sequence {

    func first<T>(as: T.Type) -> T? {
        lazy.compactMap { $0 as? T }.first
    }

    func last<T>(as: T.Type) -> T? {
        lazy.compactMap { $0 as? T }.last
    }
}
