using TutorialsForDevelopers
using Documenter
using Literate

repo_src = joinpath(@__DIR__,"..","src")
pages_dir = joinpath(@__DIR__,"src","pages")
Sys.rm(pages_dir;recursive=true,force=true)

pages = ["Introduction"=>"index.md"]

for (i,(file_jl,title)) in enumerate(TutorialsForDevelopers.files)

  file, = splitext(file_jl)
  file_md = file * ".md"
  tutorial_title = "# # Tutorial $i: $title"
  
  Literate.markdown(
    joinpath(repo_src,file_jl),
    pages_dir; name=file, preprocess = content -> string(tutorial_title,"\n",content))

  push!(pages,"$i $title"=>joinpath("pages",file_md))

end

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
    pages=pages,
)

deploydocs(;
    repo="github.com/gridap/TutorialsForDevelopers",
)
