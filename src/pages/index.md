# Welcome to the Makie Blog


```julia
# hide

using JSServe
entries = []
foreach(readdir(Blog.markdown())) do entry
    name, ext = splitext(basename(entry))
    if ext == ".md"
        push!(entries, DOM.a(name, href="blogposts/$(name).html"))
    end
end
Blog.list(entries)
```
