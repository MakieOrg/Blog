module Blog

using JSServe
using Markdown
using Hyperscript
using JSServe: Asset, ES6Module, AssetFolder, Routes

site_path(files...) = normpath(joinpath(@__DIR__, "..", "docs", files...))
markdown(files...) = joinpath(@__DIR__, "pages", "blogposts", files...)
asset(files...) = Asset(normpath(joinpath(@__DIR__, "assets", files...)))

const Highlight = ES6Module(joinpath(@__DIR__,  "assets", "libs", "highlight", "highlight.pack.js"))

function make_app(dom)
    return App() do
        assets = asset.([
            "css/franklin.css",
            "css/makie.css",
            "css/minimal-mistakes.css",
            "libs/highlight/github.min.css"])

        highlight = DOM.div(
            DOM.script(src=asset("libs", "highlight", "highlight.pack.js")),
            DOM.script("hljs.highlightAll()")
        )
        return DOM.html(
            DOM.head(
                DOM.meta(charset="UTF-8"),
                assets...,
                DOM.script(src="https://cdn.tailwindcss.com/3.0.23")
            ),
            DOM.body(dom, highlight))
    end
end

function page(file)
    source = read(file, String)
    md = JSServe.string_to_markdown(source, Main; eval_julia_code=Main)
    banner = DOM.img(src = asset("images", "bannermesh_gradient.png"))
    body = DOM.div(md, class="md:container md:mx-auto center")
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
