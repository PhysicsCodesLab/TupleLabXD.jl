using Random, Test
using TupleManipulationsXD

using Base: tail, front

n = 10

p = randperm(n)
ip = invperm(p)

t = (p...,)

@test @inferred(TupleManipulationsXD.argtail2(1, 2, 3, 4)) == (3, 4)
@test @inferred(TupleManipulationsXD.tail2(t)) == t[3:n]
@test @inferred(TupleManipulationsXD.unsafe_tail(t)) == t[2:n]
@test @inferred(TupleManipulationsXD.unsafe_front(t)) == t[1:n-1]
@test @inferred(TupleManipulationsXD.unsafe_tail(())) == ()
@test @inferred(TupleManipulationsXD.unsafe_front(())) == ()
@test @inferred(TupleManipulationsXD.vcat()) == ()
@test @inferred(TupleManipulationsXD.vcat((1, 2))) == (1, 2)
@test @inferred(TupleManipulationsXD.getindices(t, ())) == ()
@test @inferred(TupleManipulationsXD.getindices(t, (1,2,3))) == t[1:3]

@test @inferred(TupleManipulationsXD.deleteat((1, 2), (1, ))) == (2, )
for i = 1:n
    @test @inferred(TupleManipulationsXD.deleteat(t, i)) == (deleteat!(copy(p), i)...,)
    @test @inferred(TupleManipulationsXD.insertat(t, i, (1,2,3))) == (vcat(p[1:i-1], [1,2,3], p[i+1:n])...,)
end
@test @inferred(TupleManipulationsXD.deleteat((1,2,3,4,5,6), (3,1,5))) == (2,4,6)
@test_throws BoundsError TupleManipulationsXD.deleteat(t, 0)
@test_throws BoundsError TupleManipulationsXD.deleteat(t, n+1)
@test_throws BoundsError TupleManipulationsXD.insertat(t, 0, (1,2,3))
@test_throws BoundsError TupleManipulationsXD.insertat(t, n+1, (1,2,3))
for i = 0:n
    @test @inferred(TupleManipulationsXD.insertafter(t, i, (1,2,3))) == (vcat(p[1:i], [1,2,3], p[i+1:n])...,)
end
@test_throws BoundsError TupleManipulationsXD.insertafter(t, -1, (1,2,3))
@test_throws BoundsError TupleManipulationsXD.insertafter(t, n+1, (1,2,3))
@test @inferred(TupleManipulationsXD.vcat((1,2,3),4,(5,),(),(6,7,8))) == (1,2,3,4,5,6,7,8)
@test @inferred(TupleManipulationsXD.flatten((1,2,3),4,(5,),(),(6,7,8))) == (1,2,3,4,5,6,7,8)
@test @inferred(TupleManipulationsXD.flatten((1,(2,3)),4,(5,),(),((6,),(7,(8,))))) == (1,2,3,4,5,6,7,8)

@test @inferred(TupleManipulationsXD.sum(())) == 0
@test @inferred(TupleManipulationsXD.sum((1, ))) == 1
@test @inferred(TupleManipulationsXD.sum(t)) == sum(t)
@test @inferred(TupleManipulationsXD.cumsum(())) == ()
@test @inferred(TupleManipulationsXD.cumsum((1, ))) == (1, )
@test @inferred(TupleManipulationsXD.cumsum(t)) == (cumsum(p)...,)
@test @inferred(TupleManipulationsXD.prod(())) == 1
@test @inferred(TupleManipulationsXD.prod((2, ))) == 2
@test @inferred(TupleManipulationsXD.prod(t)) == prod(t)
@test @inferred(TupleManipulationsXD.cumprod(())) == ()
@test @inferred(TupleManipulationsXD.cumprod((1, ))) == (1, )
@test @inferred(TupleManipulationsXD.cumprod(t)) == (cumprod(p)...,)

for a in (t, (1, ))
    @test @inferred(TupleManipulationsXD.findmin(a)) == findmin(a)
    @test @inferred(TupleManipulationsXD.findmax(a)) == findmax(a)
    @test @inferred(TupleManipulationsXD.minimum(a)) == minimum(a)
    @test @inferred(TupleManipulationsXD.maximum(a)) == maximum(a)
    @test @inferred(TupleManipulationsXD.argmin(a)) == argmin(a)
    @test @inferred(TupleManipulationsXD.argmax(a)) == argmax(a)
end

@test @inferred(TupleManipulationsXD.sort((1, ))) == (1, )
@test @inferred(TupleManipulationsXD.sort(())) == ()
@test @inferred(TupleManipulationsXD.sort(t; rev = true)) == (sort(p; rev = true)...,)
@test @inferred(TupleManipulationsXD.sort(t; rev = false)) == (sort(p; rev = false)..., )
@test @inferred(TupleManipulationsXD.sortperm(t)) == (sortperm(p)...,)
@test @inferred(TupleManipulationsXD.sortperm(t; rev=true)) == (sortperm(p; rev=true)..., )
@test @inferred(TupleManipulationsXD.invperm(t)) == (ip...,)
@test @inferred(TupleManipulationsXD.isperm(t)) == true
@test @inferred(TupleManipulationsXD.isperm((1,2,1))) == false
@test @inferred(TupleManipulationsXD.permute(t, t)) == (p[p]...,)

@test @inferred(TupleManipulationsXD.vcat()) == ()
@test @inferred(TupleManipulationsXD.diff(())) == ()
@test @inferred(TupleManipulationsXD.diff((1, ))) == ()
@test @inferred(TupleManipulationsXD.diff((1, 2, 3))) == (1, 1)
