using Blog
using Blog: Video, asset
using Bonito, ImageShow
using Bonito: Link
ENV["DATADEPS_ALWAYS_ACCEPT"] = true
using TidierPlots, CairoMakie, DataFrames, PalmerPenguins
using GLMakie, DataFrames
penguins = dropmissing(DataFrame(PalmerPenguins.load()))
# Blog.make("makie-news")

using CairoMakie
# rm(joinpath(Blog.site_path(), "jsserve"); recursive=true, force=true)
Blog.make("v0.21")
Blog.make("index")

# Blog.make("v0.19.7")
# rm(joinpath(Blog.site_path(), "jsserve"); recursive=true, force=true)
# Blog.make()


# ## Replace
# md_path = joinpath(@__DIR__, "src", "pages", "blogposts", "v0.21.md")
# txt = read(md_path, String)

# matchi = Base.eachmatch(r"https://hackmd\.io/_uploads/(.*?)\.png", txt)

# using Downloads
# assets = joinpath(@__DIR__, "docs", "images")
# for match in matchi
#     Downloads.download(String(match.match), joinpath(assets, String(match[1]) * ".png"))
# end
# replace(txt, r"https://hackmd\.io/_uploads/(.*?)\.png" => "/images/$1.png")
# write(md_path, txt)

using Blog, Pkg
foreach(reverse(["v0.16.md", "v0.18.md", "makiecon.md", "May-2023-News.md", "v0.19.7.md", "v0.19.9-12.md", "v0.20.md", "v0.21.md"])) do entry #==#
    name, ext = splitext(basename(entry))
    path = Blog.markdown(basename(entry))
    backup = joinpath(dirname(path), "_" * name * ext)
    isfile(path) && !isfile(backup) && cp(path, backup)
    folder = joinpath(dirname(path), name)
    !isdir(folder) && mkdir(folder)
    Pkg.activate(folder)
    # Pkg.develop(path=@__DIR__)
    if startswith(name, "v")
        if name == "v0.19.9-12"
            name = "v0.19.12"
        end
        version = VersionNumber(name[2:end])
        Pkg.add(name="Makie", version=string(version))
        Pkg.add(name="GLMakie")
        Pkg.add(name="WGLMakie")
        Pkg.add(name="CairoMakie")
    end
end
