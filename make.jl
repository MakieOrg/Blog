using Blog
using Blog: Video
using JSServe
using TidierPlots, CairoMakie, DataFrames, PalmerPenguins
penguins = dropmissing(DataFrame(PalmerPenguins.load()))
Blog.make("makie-news")

Blog.page("dev/Blog/src/pages/blogposts/makie-news.md")
