# ReducePerfComparison

Compare performance of multiple reduce options.

There are 2 `reduce` functions included with Swift. Depending on your use case you may find one has an advantage over the other. For a large dataset efficiency is critical.

- **`reduce(_:_:)`** can be less efficient for complex data types because it may create many intermediate copies, especially if the closure is not optimized by the compiler.
- **`reduce(into:_:)`** is generally more efficient for complex data types as it mutates the result in place, reducing the overhead of creating and copying intermediate results.

To compare these functions as well as another option an array of Data items is prepared and then concatenated together with a separator. The final option is `Data(dataArray.joined(separator: separator))` which simply uses the `.joined` function on a `Sequence` which returns `JoinedSequence<[Data]>`. It can be used to initialize the final instance of `Data`.

Which of these options is most efficient and can finish with a large dataset first?
