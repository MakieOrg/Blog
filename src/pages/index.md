# Welcome to the Makie Blog


```julia
# hide

entries = map(readdir(Blog.markdown())) do entry
    name = splitext(basename(entry))[1]
    DOM.a(entry, href="blogposts/$(name).html")
end
DOM.div(entries...)
```
