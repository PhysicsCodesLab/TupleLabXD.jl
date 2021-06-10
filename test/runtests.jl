using Random, Test
using TupleToolsXD

using Base: tail, front

n = 10

p = randperm(n)
ip = invperm(p)

t = (p...,)

@test @inferred(TupleToolsXD.argtail2(1, 2, 3, 4)) == (3, 4)
@test @inferred(TupleToolsXD.tail2(t)) == t[3:n]
@test @inferred(TupleToolsXD.unsafe_tail(t)) == t[2:n]
@test @inferred(TupleToolsXD.unsafe_front(t)) == t[1:n-1]
@test @inferred(TupleToolsXD.unsafe_tail(())) == ()
@test @inferred(TupleToolsXD.unsafe_front(())) == ()
@test @inferred(TupleToolsXD.vcat()) == ()
@test @inferred(TupleToolsXD.vcat((1, 2))) == (1, 2)
@test @inferred(TupleToolsXD.getindices(t, ())) == ()
@test @inferred(TupleToolsXD.getindices(t, (1,2,3))) == t[1:3]

@test @inferred(TupleToolsXD.deleteat((1, 2), (1, ))) == (2, )
for i = 1:n
    @test @inferred(TupleToolsXD.deleteat(t, i)) == (deleteat!(copy(p), i)...,)
    @test @inferred(TupleToolsXD.insertat(t, i, (1,2,3))) == (vcat(p[1:i-1], [1,2,3], p[i+1:n])...,)
end
@test @inferred(TupleToolsXD.deleteat((1,2,3,4,5,6), (3,1,5))) == (2,4,6)
@test_throws BoundsError TupleToolsXD.deleteat(t, 0)
@test_throws BoundsError TupleToolsXD.deleteat(t, n+1)
@test_throws BoundsError TupleToolsXD.insertat(t, 0, (1,2,3))
@test_throws BoundsError TupleToolsXD.insertat(t, n+1, (1,2,3))
for i = 0:n
    @test @inferred(TupleToolsXD.insertafter(t, i, (1,2,3))) == (vcat(p[1:i], [1,2,3], p[i+1:n])...,)
end
@test_throws BoundsError TupleToolsXD.insertafter(t, -1, (1,2,3))
@test_throws BoundsError TupleToolsXD.insertafter(t, n+1, (1,2,3))
@test @inferred(TupleToolsXD.vcat((1,2,3),4,(5,),(),(6,7,8))) == (1,2,3,4,5,6,7,8)
@test @inferred(TupleToolsXD.flatten((1,2,3),4,(5,),(),(6,7,8))) == (1,2,3,4,5,6,7,8)
@test @inferred(TupleToolsXD.flatten((1,(2,3)),4,(5,),(),((6,),(7,(8,))))) == (1,2,3,4,5,6,7,8)

@test @inferred(TupleToolsXD.sum(())) == 0
@test @inferred(TupleToolsXD.sum((1, ))) == 1
@test @inferred(TupleToolsXD.sum(t)) == sum(t)
@test @inferred(TupleToolsXD.cumsum(())) == ()
@test @inferred(TupleToolsXD.cumsum((1, ))) == (1, )
@test @inferred(TupleToolsXD.cumsum(t)) == (cumsum(p)...,)
@test @inferred(TupleToolsXD.prod(())) == 1
@test @inferred(TupleToolsXD.prod((2, ))) == 2
@test @inferred(TupleToolsXD.prod(t)) == prod(t)
@test @inferred(TupleToolsXD.cumprod(())) == ()
@test @inferred(TupleToolsXD.cumprod((1, ))) == (1, )
@test @inferred(TupleToolsXD.cumprod(t)) == (cumprod(p)...,)

for a in (t, (1, ))
    @test @inferred(TupleToolsXD.findmin(a)) == findmin(a)
    @test @inferred(TupleToolsXD.findmax(a)) == findmax(a)
    @test @inferred(TupleToolsXD.minimum(a)) == minimum(a)
    @test @inferred(TupleToolsXD.maximum(a)) == maximum(a)
    @test @inferred(TupleToolsXD.argmin(a)) == argmin(a)
    @test @inferred(TupleToolsXD.argmax(a)) == argmax(a)
end

@test @inferred(TupleToolsXD.sort((1, ))) == (1, )
@test @inferred(TupleToolsXD.sort(())) == ()
@test @inferred(TupleToolsXD.sort(t; rev = true)) == (sort(p; rev = true)...,)
@test @inferred(TupleToolsXD.sort(t; rev = false)) == (sort(p; rev = false)..., )
@test @inferred(TupleToolsXD.sortperm(t)) == (sortperm(p)...,)
@test @inferred(TupleToolsXD.sortperm(t; rev=true)) == (sortperm(p; rev=true)..., )
@test @inferred(TupleToolsXD.invperm(t)) == (ip...,)
@test @inferred(TupleToolsXD.isperm(t)) == true
@test @inferred(TupleToolsXD.isperm((1,2,1))) == false
@test @inferred(TupleToolsXD.permute(t, t)) == (p[p]...,)

@test @inferred(TupleToolsXD.vcat()) == ()
@test @inferred(TupleToolsXD.diff(())) == ()
@test @inferred(TupleToolsXD.diff((1, ))) == ()
@test @inferred(TupleToolsXD.diff((1, 2, 3))) == (1, 1)
