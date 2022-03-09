module Blog

using JSServe
using Markdown
using Hyperscript
using JSServe: Asset, ES6Module, AssetFolder, Routes

site_path(files...) = normpath(joinpath(@__DIR__, "..", "docs", files...))
markdown(files...) = joinpath(@__DIR__, "pages", "blogposts", files...)
asset(files...) = Asset(normpath(joinpath(@__DIR__, "assets", files...)))
const Highlight = ES6Module(joinpath(@__DIR__,  "assets", "libs", "highlight", "highlight.pack.js"))

function JSServe.jsrender(owner::GitHub.Owner)
    name = DOM.span(string(owner.login), style="margin: 2px; font-size:20px;color: 'gray")
    return DOM.div(
        DOM.a(DOM.div(
            DOM.img(src=owner.avatar_url, style="border-radius: 50%", width=24), name;
    style="display: flex; align-items: center; justify-content: center"),
            href=owner.html_url
        ; style="color: gray; text-decoration: none");
        style="float:left")
end

function list(elements)
    style = "display: flex; flex-direction: column; justify-content: start; align-items: start"
    return DOM.div(JSServe.jsrender.(elements)..., style=style)
end

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
                DOM.link(rel="icon", type="image/x-icon", href=asset("images", "favicon.ico")),
                DOM.script(src="https://cdn.tailwindcss.com/3.0.23")
            ),
            DOM.body(dom, highlight)
        )
    end
end

function page(file)
    source = read(file, String)
    md = JSServe.string_to_markdown(source, Blog; eval_julia_code=Blog)
    banner = DOM.a(DOM.img(src = asset("images", "bannermesh_gradient.png")), href="/")
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
