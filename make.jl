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

