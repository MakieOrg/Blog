module Blog

using JSServe
using Markdown
using Hyperscript
using JSServe: Asset, ES6Module, AssetFolder, Routes
using GitHub, Downloads

include("gh-utils.jl")

site_path(files...) = normpath(joinpath(@__DIR__, "..", "docs", files...))
markdown(files...) = joinpath(@__DIR__, "pages", "blogposts", files...)
assetpath(files...) = normpath(joinpath(@__DIR__, "assets", files...))
asset(files...) = Asset(assetpath( files...))

JSServe.jsrender(x::Vector) = DOM.div(x...)

function list(elements)
    style = "display: flex; flex-direction: column; justify-content: start; align-items: start"
    return DOM.div(JSServe.jsrender.(elements)..., style=style)
end

function parse_markdown(session, file)
    source = read(file, String)
    md = JSServe.string_to_markdown(session, source; eval_julia_code=Main)
    banner = DOM.a(DOM.img(src = asset("images", "bannermesh_gradient.png")), href="/")
    body = DOM.div(DOM.div(md, class="inner-page"), class="outer-page")
    return DOM.div(banner, body)
end

function tracking()
    DOM.div(
        DOM.script(src="https://api.makie.org/latest.js"; async=true, defer=true),
        DOM.noscript(DOM.img(src="https://api.makie.org/noscript.gif"; alt="", referrerpolicy="no-referrer-when-downgrade"))
    )
end

function page(file)
    return JSServe.App() do session::Session
        assets = asset.([
            "css/makie.css",
            "css/minimal-mistakes.css",
            "libs/highlight/github.min.css",
            "css/style.css"])

        highlight = DOM.div(
            DOM.script(src=asset("libs", "highlight", "highlight.pack.js")),
            DOM.script("hljs.highlightAll()")
        )
        dom = parse_markdown(session, file)
        return DOM.html(
            DOM.head(
                DOM.meta(charset="UTF-8"),
                DOM.meta(name="viewport", content="width=device-width, initial-scale=1"),
                assets...,
                DOM.link(rel="icon", type="image/x-icon", href=asset("images", "favicon.ico")),
            ),
            DOM.body(dom, highlight, tracking())
        )
    end
end

function Video(url)
    return DOM.video(DOM.source(src=url,type="video/mp4"), autoplay=true, controls=true)
end

function make(pages::String...)
    src = readdir(markdown(), join=true)
    routes = Routes()
    for file in readdir(markdown(); join=true)
        name, ext = splitext(basename(file))
        if ext == ".md"
            if isempty(pages) || (name in pages)
                routes["blogposts/" * name] = page(file)
            end
        end
    end
    if isempty(pages) || ("index" in pages)
        routes["/"] = page(markdown("..", "index.md"))
    end
    JSServe.export_static(site_path(), routes)
end

end
