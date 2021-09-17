using TupleToolXD
using Documenter

DocMeta.setdocmeta!(TupleToolXD, :DocTestSetup, :(using TupleToolXD); recursive=true)

makedocs(;
    modules=[TupleToolXD],
    authors="PhysicsCodesLab",
    repo="https://github.com/PhysicsCodesLab/TupleToolXD.jl/blob/{commit}{path}#{line}",
    sitename="TupleToolXD.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://PhysicsCodesLab.github.io/TupleToolXD.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/PhysicsCodesLab/TupleToolXD.jl",
    devbranch="master",
)
