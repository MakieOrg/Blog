using Blog
using Blog: Video
using Bonito, ImageShow
using Bonito: Link
ENV["DATADEPS_ALWAYS_ACCEPT"] = true
using TidierPlots, CairoMakie, DataFrames, PalmerPenguins
penguins = dropmissing(DataFrame(PalmerPenguins.load()))
# Blog.make("makie-news")


# Blog.make("v0.19.7")
# rm(joinpath(Blog.site_path(), "jsserve"); recursive=true, force=true)
Blog.make()
