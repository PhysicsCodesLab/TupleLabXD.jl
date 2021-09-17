using TupleManipulationsXD
using Documenter

DocMeta.setdocmeta!(TupleManipulationsXD, :DocTestSetup, :(using TupleManipulationsXD); recursive=true)

makedocs(;
    modules=[TupleManipulationsXD],
    authors="PhysicsCodesLab",
    repo="https://github.com/PhysicsCodesLab/TupleManipulationsXD.jl/blob/{commit}{path}#{line}",
    sitename="TupleManipulationsXD.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://PhysicsCodesLab.github.io/TupleManipulationsXD.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/PhysicsCodesLab/TupleManipulationsXD.jl",
    devbranch="master",
)
