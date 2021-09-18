using Random, Test
using TupleLabXD

using Base: tail, front

n = 10

p = randperm(n)
ip = invperm(p)

t = (p...,)

@test @inferred(TupleLabXD.argtail2(1, 2, 3, 4)) == (3, 4)
@test @inferred(TupleLabXD.tail2(t)) == t[3:n]
@test @inferred(TupleLabXD.unsafe_tail(t)) == t[2:n]
@test @inferred(TupleLabXD.unsafe_front(t)) == t[1:n-1]
@test @inferred(TupleLabXD.unsafe_tail(())) == ()
@test @inferred(TupleLabXD.unsafe_front(())) == ()
@test @inferred(TupleLabXD.vcat()) == ()
@test @inferred(TupleLabXD.vcat((1, 2))) == (1, 2)
@test @inferred(TupleLabXD.getindices(t, ())) == ()
@test @inferred(TupleLabXD.getindices(t, (1,2,3))) == t[1:3]

@test @inferred(TupleLabXD.deleteat((1, 2), (1, ))) == (2, )
for i = 1:n
    @test @inferred(TupleLabXD.deleteat(t, i)) == (deleteat!(copy(p), i)...,)
    @test @inferred(TupleLabXD.insertat(t, i, (1,2,3))) == (vcat(p[1:i-1], [1,2,3], p[i+1:n])...,)
end
@test @inferred(TupleLabXD.deleteat((1,2,3,4,5,6), (3,1,5))) == (2,4,6)
@test_throws BoundsError TupleLabXD.deleteat(t, 0)
@test_throws BoundsError TupleLabXD.deleteat(t, n+1)
@test_throws BoundsError TupleLabXD.insertat(t, 0, (1,2,3))
@test_throws BoundsError TupleLabXD.insertat(t, n+1, (1,2,3))
for i = 0:n
    @test @inferred(TupleLabXD.insertafter(t, i, (1,2,3))) == (vcat(p[1:i], [1,2,3], p[i+1:n])...,)
end
@test_throws BoundsError TupleLabXD.insertafter(t, -1, (1,2,3))
@test_throws BoundsError TupleLabXD.insertafter(t, n+1, (1,2,3))
@test @inferred(TupleLabXD.vcat((1,2,3),4,(5,),(),(6,7,8))) == (1,2,3,4,5,6,7,8)
@test @inferred(TupleLabXD.flatten((1,2,3),4,(5,),(),(6,7,8))) == (1,2,3,4,5,6,7,8)
@test @inferred(TupleLabXD.flatten((1,(2,3)),4,(5,),(),((6,),(7,(8,))))) == (1,2,3,4,5,6,7,8)

@test @inferred(TupleLabXD.sum(())) == 0
@test @inferred(TupleLabXD.sum((1, ))) == 1
@test @inferred(TupleLabXD.sum(t)) == sum(t)
@test @inferred(TupleLabXD.cumsum(())) == ()
@test @inferred(TupleLabXD.cumsum((1, ))) == (1, )
@test @inferred(TupleLabXD.cumsum(t)) == (cumsum(p)...,)
@test @inferred(TupleLabXD.prod(())) == 1
@test @inferred(TupleLabXD.prod((2, ))) == 2
@test @inferred(TupleLabXD.prod(t)) == prod(t)
@test @inferred(TupleLabXD.cumprod(())) == ()
@test @inferred(TupleLabXD.cumprod((1, ))) == (1, )
@test @inferred(TupleLabXD.cumprod(t)) == (cumprod(p)...,)

for a in (t, (1, ))
    @test @inferred(TupleLabXD.findmin(a)) == findmin(a)
    @test @inferred(TupleLabXD.findmax(a)) == findmax(a)
    @test @inferred(TupleLabXD.minimum(a)) == minimum(a)
    @test @inferred(TupleLabXD.maximum(a)) == maximum(a)
    @test @inferred(TupleLabXD.argmin(a)) == argmin(a)
    @test @inferred(TupleLabXD.argmax(a)) == argmax(a)
end

@test @inferred(TupleLabXD.sort((1, ))) == (1, )
@test @inferred(TupleLabXD.sort(())) == ()
@test @inferred(TupleLabXD.sort(t; rev = true)) == (sort(p; rev = true)...,)
@test @inferred(TupleLabXD.sort(t; rev = false)) == (sort(p; rev = false)..., )
@test @inferred(TupleLabXD.sortperm(t)) == (sortperm(p)...,)
@test @inferred(TupleLabXD.sortperm(t; rev=true)) == (sortperm(p; rev=true)..., )
@test @inferred(TupleLabXD.invperm(t)) == (ip...,)
@test @inferred(TupleLabXD.isperm(t)) == true
@test @inferred(TupleLabXD.isperm((1,2,1))) == false
@test @inferred(TupleLabXD.permute(t, t)) == (p[p]...,)

@test @inferred(TupleLabXD.vcat()) == ()
@test @inferred(TupleLabXD.diff(())) == ()
@test @inferred(TupleLabXD.diff((1, ))) == ()
@test @inferred(TupleLabXD.diff((1, 2, 3))) == (1, 1)
