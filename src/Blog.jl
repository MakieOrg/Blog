module Blog

using Bonito
using BonitoSites

site_path(files...) = normpath(joinpath(@__DIR__, "..", "docs", files...))
markdown(files...) = joinpath(@__DIR__, "pages", "blogposts", files...)
assetpath(files...) = normpath(joinpath(@__DIR__, "assets", files...))
asset(files...) = Asset(assetpath( files...))

using BonitoSites: gh_by
export gh_by

function tracking()
    DOM.div(
        DOM.script(src="https://api.makie.org/latest.js"; async=true, defer=true),
        DOM.noscript(DOM.img(src="https://api.makie.org/noscript.gif"; alt="", referrerpolicy="no-referrer-when-downgrade"))
    )
end

function Page(markdown_page)
    assets = asset.([
        "css/makie.css",
        "css/style.css"
    ])

    banner = DOM.a(DOM.img(src=asset("images", "bannermesh_gradient.png"), width="100%"), href="/")
    body = DOM.div(DOM.div(markdown_page, class="inner-page"), class="outer-page")
    rss_link = DOM.link(
        rel="alternate",
        type="application/rss+xml",
        title="Makie Blog rss feed",
        href="./rss.xml"
    )
    return DOM.html(
        DOM.head(
            DOM.meta(charset="UTF-8"),
            DOM.meta(name="viewport", content="width=device-width, initial-scale=1"),
            rss_link,
            assets...,
            DOM.link(rel="icon", type="image/x-icon", href=asset("images", "favicon.ico")),
        ),
        DOM.body(DOM.div(banner, body), tracking())
    )
end

function Video(url)
    return DOM.video(DOM.source(src=url,type="video/mp4"), autoplay=true, controls=true)
end


end
