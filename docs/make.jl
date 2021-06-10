using TupleToolsXD
using Documenter

DocMeta.setdocmeta!(TupleToolsXD, :DocTestSetup, :(using TupleToolsXD); recursive=true)

makedocs(;
    modules=[TupleToolsXD],
    authors="PhysicsCodesLab",
    repo="https://github.com/PhysicsCodesLab/TupleToolsXD.jl/blob/{commit}{path}#{line}",
    sitename="TupleToolsXD.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://PhysicsCodesLab.github.io/TupleToolsXD.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/PhysicsCodesLab/TupleToolsXD.jl",
    devbranch="master",
)
