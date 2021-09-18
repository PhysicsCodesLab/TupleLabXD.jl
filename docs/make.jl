using TupleLabXD
using Documenter

DocMeta.setdocmeta!(TupleLabXD, :DocTestSetup, :(using TupleLabXD); recursive=true)

makedocs(;
    modules=[TupleLabXD],
    authors="PhysicsCodesLab",
    repo="https://github.com/PhysicsCodesLab/TupleLabXD.jl/blob/{commit}{path}#{line}",
    sitename="TupleLabXD.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://PhysicsCodesLab.github.io/TupleLabXD.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/PhysicsCodesLab/TupleLabXD.jl",
    devbranch="master",
)
