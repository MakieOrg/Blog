module Blog

using JSServe
using Markdown
using Hyperscript
using JSServe: Asset, ES6Module, AssetFolder, Routes
using GitHub, Downloads

include("gh-utils.jl")

site_path(files...) = normpath(joinpath(@__DIR__, "..", "docs", files...))
markdown(files...) = joinpath(@__DIR__, "pages", "blogposts", files...)
asset(files...) = Asset(normpath(joinpath(@__DIR__, "assets", files...)))
const Highlight = ES6Module(joinpath(@__DIR__,  "assets", "libs", "highlight", "highlight.pack.js"))

function list(elements)
    style = "display: flex; flex-direction: column; justify-content: start; align-items: start"
    return DOM.div(JSServe.jsrender.(elements)..., style=style)
end

function make_app(dom)
    return JSServe.App() do
        assets = asset.([
            "css/franklin.css",
            "css/makie.css",
            "css/minimal-mistakes.css",
            "libs/highlight/github.min.css",
            "css/style.css"])

        highlight = DOM.div(
            DOM.script(src=asset("libs", "highlight", "highlight.pack.js")),
        DOM.script("hljs.highlightAll()")
        )
        return DOM.html(
            DOM.head(
                DOM.meta(charset="UTF-8"),
                DOM.meta(name="viewport", content="width=device-width, initial-scale=1"),
                assets...,
                DOM.link(rel="icon", type="image/x-icon", href=asset("images", "favicon.ico")),
            ),
            DOM.body(dom, highlight)
        )
    end
end

function page(file)
    source = read(file, String)
    md = JSServe.string_to_markdown(source, Blog; eval_julia_code=Blog)
    banner = DOM.a(DOM.img(src = asset("images", "bannermesh_gradient.png")), href="/")
    body = DOM.div(DOM.div(md, class="inner-page"), class="outer-page")
    return make_app(DOM.div(banner, body))
end

function make()
    src = readdir(markdown(), join=true)
    routes = Routes()
    for file in src
        name, ext = splitext(basename(file))
        if ext == ".md"
            routes["blogposts/" * name] = page(file)
        end
    end
    routes["/"] = page(markdown("..", "index.md"))
    JSServe.export_static(site_path(), routes)
end

end
