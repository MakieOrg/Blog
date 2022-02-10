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
    return sprint() do io
        println(io, "<!doctype html>")
        show(io, MIME"text/html"(), Hyperscript.Pretty(html_body))
    end
end

function make()
    src = readdir(joinpath(@__DIR__, "entries"), join=true)
    out = abspath(joinpath(@__DIR__, "..", "site"))
    @show out
    for file in src
        name, ext = splitext(file)
        if ext == ".md"
            entry =  Markdown.parse_file(file)
            @show joinpath(out, name * ".html")
            open(joinpath(out, name * ".html"), "w") do io
                show_html(io, DOM.div(entry))
            end
        end
    end
end

end
