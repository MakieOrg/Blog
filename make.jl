using Blog, Bonito, BonitoBlog
using Blog

# Example usage
blog_title = "Makie Blog"
blog_link = "https://blog.makie.org"
blog_description = "A Blog about anything new in the Makie world"
rss_path = "rss.xml"

function make(f, page_folder, destination)
    routes = Routes()
    folders = filter(isdir, readdir(page_folder; join=true))
    entries = map(folders) do dir
        dir = normpath(dir)
        path = joinpath(dir, "post.xml")
        return dir => BonitoBlog.from_xml(path)
    end
    sort!(entries; by=x -> x[2].date, rev=true)
    for (dir, entry) in entries
        page = BonitoBlog.MarkdownPage(dir)
        routes[entry.link] = f(page)
    end
    routes["/"] = f(Bonito.Col(map(x-> x[2], entries)...))
    Bonito.export_static(destination, routes)
end


rm(Blog.site_path("bonito"); recursive=true)
make(Blog.Page, Blog.markdown(), Blog.site_path())


# matchi = Base.eachmatch(r"https://hackmd\.io/_uploads/(.*?)\.png", txt)

# using Downloads
# assets = joinpath(@__DIR__, "docs", "images")
# for match in matchi
#     Downloads.download(String(match.match), joinpath(assets, String(match[1]) * ".png"))
# end
# replace(txt, r"https://hackmd\.io/_uploads/(.*?)\.png" => "/images/$1.png")
# write(md_path, txt)
