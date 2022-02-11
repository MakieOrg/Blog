module Blog

using JSServe
using Markdown
using Hyperscript

site_path(files...) = normpath(joinpath(@__DIR__, "..", "docs", files...))
markdown(files...) = joinpath(@__DIR__, "pages", "blogposts", files...)
library(name, paths...) = JSServe.Dependency(name,site_path.("/libs", collect(paths)))
asset(files...) = JSServe.Asset(site_path(files...))

const hljs = library(:hljs, "highlight/highlight.pack.js", "highlight/github.min.css")

function StaticSession()
    us = JSServe.UrlSerializer(false, site_path(), false, "", false)
    return Session(; url_serializer=us)
end

function show_html(io, dom)
    s = StaticSession()
    assets = asset.(["/css/franklin.css", "/css/makie.css", "/css/minimal-mistakes.css"])
    append!(assets, Blog.hljs.assets)
    rendered = JSServe.jsrender(s, dom)
    html_body = DOM.html(
        DOM.head(
            DOM.meta(charset="UTF-8"),
            JSServe.include_asset.(assets, (s.url_serializer,))...
        ),
        DOM.body(
            rendered,
        )
    )
    println(io, "<!doctype html>")
    show(io, MIME"text/html"(), Hyperscript.Pretty(html_body))
end

function page(file)
    source = read(file, String)
    md = JSServe.string_to_markdown(source, Main; eval_julia_code=Main)
    banner = DOM.img(src = asset("/assets", "bannermesh_gradient.png"))
    return DOM.div(banner, md, js"$(hljs).highlightAll()")
end

function make()
    src = readdir(markdown(), join=true)
    out = normpath(joinpath(@__DIR__, "..", "docs", "blogposts"))
    for file in src
        name, ext = splitext(file)
        if ext == ".md"
            p = page(file)
            outfile = joinpath(out, basename(name) * ".html")
            open(outfile, "w") do io
                show_html(io, DOM.div(p))
            end
        end
    end
    open(joinpath(@__DIR__, "..", "docs", "index.html"), "w") do io
        p = page(markdown("..", "index.md"))
        show_html(io, DOM.div(p))
    end
end

end
