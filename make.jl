using Blog
using Blog: Video, asset
using JSServe
using JSServe: Link
ENV["DATADEPS_ALWAYS_ACCEPT"] = true
using TidierPlots, CairoMakie, DataFrames, PalmerPenguins
using GLMakie, DataFrames
penguins = dropmissing(DataFrame(PalmerPenguins.load()))
# Blog.make("makie-news")

using CairoMakie
# rm(joinpath(Blog.site_path(), "jsserve"); recursive=true, force=true)
Blog.make("v0.21")
Blog.make("index")



## Replace 
md_path = joinpath(@__DIR__, "src", "pages", "blogposts", "v0.21.md")
txt = read(md_path, String)

matchi = Base.eachmatch(r"https://hackmd\.io/_uploads/(.*?)\.png", txt)

using Downloads
assets = joinpath(@__DIR__, "docs", "images")
for match in matchi
    Downloads.download(String(match.match), joinpath(assets, String(match[1]) * ".png"))
end
replace(txt, r"https://hackmd\.io/_uploads/(.*?)\.png" => "/images/$1.png")
write(md_path, txt)