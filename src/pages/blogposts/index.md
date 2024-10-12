# Welcome to the Makie Blog


```julia
# hide
using Bonito
using Bonito: Link
entries = []
foreach(reverse(["v0.16.md", "v0.18.md", "makiecon.md", "May-2023-News.md", "v0.19.7.md", "v0.19.9-12.md", "v0.20.md", "v0.21.md"])) do entry
    name, ext = splitext(basename(entry))
    if ext == ".md"
        push!(entries, DOM.a(titlecase(replace(name, "-" => " ")), href=Link("/blogposts/$(name)")))
    end
end
DOM.div(entries...)
```
