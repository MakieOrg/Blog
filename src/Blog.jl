module Blog

using JSServe
using Markdown
using Hyperscript

markdown(files...) = Markdown.parse_file(joinpath(@__DIR__, "entries", files...))

function show_html(io, dom)
    s = Session()
    rendered = JSServe.jsrender(s, dom)
    html_body = DOM.html(
        DOM.head(
            DOM.meta(charset="UTF-8"),
        ),
        DOM.body(
            rendered,
        )
    )
    println(io, "<!doctype html>")
    show(io, MIME"text/html"(), Hyperscript.Pretty(html_body))
end

function make()
    src = readdir(joinpath(@__DIR__, "entries"), join=true)
    out = normpath(joinpath(@__DIR__, "..", "docs"))
    @show out
    for file in src
        name, ext = splitext(file)
        if ext == ".md"
            entry =  Markdown.parse_file(file)
            outfile = joinpath(out, basename(name) * ".html")
            @show outfile
            open(outfile, "w") do io
                show_html(io, DOM.div(entry))
            end
        end
    end
end

end
