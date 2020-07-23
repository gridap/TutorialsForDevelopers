using TutorialsForDevelopers
using Documenter

makedocs(;
    modules=[TutorialsForDevelopers],
    authors="Francesc Verdugo <fverdugo@cimne.upc.edu> and contributors",
    repo="https://github.com/gridap/TutorialsForDevelopers/blob/{commit}{path}#L{line}",
    sitename="TutorialsForDevelopers",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://gridap.github.io/TutorialsForDevelopers",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/gridap/TutorialsForDevelopers",
)
