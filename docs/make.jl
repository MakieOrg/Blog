using Pkg
Pkg.activate(@__DIR__)
pkg"add Bonito#sd/static-sites"
Pkg.add(url="https://github.com/SimonDanisch/BonitoSites.jl")
blog = normpath(joinpath(@__DIR__, ".."))
Pkg.develop(PackageSpec(path=blog))
Pkg.instantiate()

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
        route = replace(entry.link, "./" => "")
        routes[route] = App(f(page))
    end
    site_entries = map(x -> x[2], entries)
    routes["/"] = App(f(Bonito.Col(site_entries...)))
    Bonito.export_static(destination, routes)
    rss_path = joinpath(destination, "rss.xml")
    BonitoSites.generate_rss_feed(site_entries, rss_path; title, link, description, relative_path="./website/")
end

build = Blog.site_path("build")
isdir(build) && rm(build; recursive=true)
make(Blog.Page, Blog.markdown(), build)
cp(Blog.assetpath("images"), Blog.site_path("build", "images"))

BonitoSites.deploy(
    "github.com/MakieOrg/Blog.git";
    push_preview = true,
    devbranch = "master",
    devurl = "website"
)

# using Pkg
# folders = filter(isdir, readdir(Blog.markdown(); join=true))
# for dir in folders
#     dir = normpath(dir)
#     path = joinpath(dir, "Project.toml")
#     if isfile(path)
#         try
#             Pkg.activate(dir)
#             pkg"add Bonito#sd/static-sites https://github.com/SimonDanisch/BonitoSites.jl"
#         catch e
#         end
#     end
# end
