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

function BlueSky(post)
    js = DOM.script(src=asset("libs", "bluesky.js"))
    container = DOM.div(
        id = "comments",
        dataUri = post,
        style = "width: 600px;",
    )
    return DOM.div(container, js)
end

function Navigation(highlighted="")
    function item(name, href; target="")
        bg = name == "Blog" ? "#73b5e4" : ""
        style = Bonito.Styles(
            CSS(
                "color" => "white",
                "cursor" => "pointer",
                "padding" => "0.25rem 0.5rem",
                "transition" => "opacity 0.2s",
                "opacity" => "1.0",
                "background-color" => bg
            ),
            CSS(":hover","opacity" => "0.5"),
        )
        l = Bonito.Styles("text-decoration" => "none",)
        return DOM.a(DOM.div(name, style=style); href=href, target=target, style=l)
    end

    github = asset("images/GitHub-Mark-Light-64px.png")
    img_style = Bonito.Styles(
        "height" => "1.2rem",
        "display" => "inline-block",
        "vertical-align" => "text-bottom"
    )

    container_style = Bonito.Styles(
        "display" => "flex",
        "justify-content" => "center",
        "background-color" => !isempty(highlighted) ? "#73b5e4" : "#3892d2",
    )

    inner_container_style = Bonito.Styles(
        "display" => "flex",
        "width" => "100%",
        "padding" => "0 1rem",
        "flex-wrap" => "wrap",
        "height" => "2rem",
    )
    return DOM.div(
        style=container_style, class="outer-page",
        DOM.div(
            style=inner_container_style, class="inner-page",
            item("Home", "https://makie.org/website/"),
            item("Team", "https://makie.org/website/team/"),
            item("Support", "https://makie.org/website/support/"),
            item("Contact", "https://makie.org/website/contact/"),
            item("Blog", Bonito.Link("/")),
            item("Docs", "http://docs.makie.org"; target="_blank"),
            item(DOM.img(src=github, style=img_style), "https://github.com/MakieOrg/Makie.jl"; target="_blank")
        )
    )
end

function Page(markdown_page, bsky=nothing)
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
    bluesky = if !isnothing(bsky)
        Centered(Card(BlueSky(bsky)))
    else
        nothing
    end
    navigation = Navigation()
    return DOM.html(
        DOM.head(
            DOM.meta(charset="UTF-8"),
            DOM.meta(name="viewport", content="width=device-width, initial-scale=1"),
            rss_link,
            assets...,
            DOM.link(rel="icon", type="image/x-icon", href=asset("images", "favicon.ico")),
        ),
        DOM.body(
            DOM.div(
                banner,
                navigation,
                body,
                bluesky
            ),
            tracking()
        )
    )
end

function Video(url)
    return DOM.video(DOM.source(src=url,type="video/mp4"), autoplay=true, controls=true)
end


end
