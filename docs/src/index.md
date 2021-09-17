# TupleToolXD.jl

TupleToolXD contains a bunch of tools for using tuples (mostly homogeneous tuples `NTuple{N}`) as a collection and performing a number of operations with an inferrable result, typically also an `NTuple{M}` with inferable length `M`. Chosen implementations are typically faster than the corresponding functions in base for those small tuple lengths, but can be slower for larger tuples. Inference breaks down for most functions in case of inhomogeneous tuples.

Note that none of the following functions are exported, since their name often collides with the equivalent functions (with different implementations) in `Base`. Some functions here provided just have an equivalent in `Base` that doesn't work for tuples at all, like `sort` or `cumsum` and `cumprod`. Some functions also provide reasonable defaults assuming that they are used for tuples of `Int`s, i.e. `TupleToolXD.sum(()) = 0` or `TupleToolXD.prod(()) = 1` (whereas the corresponding `Base` functions would error). This originates from the assumption that these methods are used to operate on tuples of e.g. sizes, indices or strides of multidimensional arrays.

## Types

```@docs
TupleToolXD.StaticLength
```

## Functions

```@docs
TupleToolXD.tail2
TupleToolXD.unsafe_tail
TupleToolXD.unsafe_front
```

```@docs
TupleToolXD.getindices
```

```@docs
TupleToolXD.deleteat
TupleToolXD.insertat
TupleToolXD.insertafter
TupleToolXD.vcat
TupleToolXD.flatten
```

```@docs
TupleToolXD.sum
TupleToolXD.cumsum
TupleToolXD.diff
TupleToolXD.prod
TupleToolXD.cumprod
```

```@docs
TupleToolXD.minimum
TupleToolXD.maximum
TupleToolXD.findmin
TupleToolXD.findmax
TupleToolXD.argmin
TupleToolXD.argmax
```

```@docs
TupleToolXD.sort
TupleToolXD.sortperm
TupleToolXD.isperm
TupleToolXD.invperm
TupleToolXD.permute
```
