using Blog, Bonito, BonitoSites

title = "Makie Blog"
link = "https://blog.makie.org"
description = "A Blog about anything new in the Makie world"

function make(f, page_folder, destination)
    routes = Routes()
    folders = filter(isdir, readdir(page_folder; join=true))
    entries = map(folders) do dir
        dir = normpath(dir)
        path = joinpath(dir, "post.xml")
        return dir => BonitoSites.from_xml(path)
    end
    sort!(entries; by=x -> x[2].date, rev=true)
    for (dir, entry) in entries
        page = BonitoSites.MarkdownPage(dir)
        routes[entry.link] = App(f(page))
    end
    site_entries = map(x -> x[2], entries)
    routes["/"] = App(f(Bonito.Col(site_entries...)))
    Bonito.export_static(destination, routes)
    rss_path = joinpath(destination, "rss.xml")
    BonitoSites.generate_rss_feed(site_entries, rss_path; title, link, description)
end

build = Blog.site_path("build")
isdir(build) && rm(build; recursive=true)
make(Blog.Page, Blog.markdown(), build)

BonitoSites.deploy(
    "github.com/MakieOrg/Blog.git";
    push_preview = true,
    devbranch = "master",
    devurl = "website"
)
