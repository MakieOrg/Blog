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


using GitHub, XML
using XML: h

owner = "MakieOrg"
name = "Blog"
rep = GitHub.Repo(owner * "/" * name)
auth = GitHub.authenticate(ENV["GITHUB_TOKEN"])
cm = commit(rep, "3bee384d663e4f9f2ce324b7cb026967a4ef52f0"; auth)

using Dates
Dates.format(cm.commit.author.date, "e, d u y H:M:S") |> println

versions = ["v0.16", "v0.18", "makiecon", "May-2023-News", "v0.19.7", "v0.19.9-12", "v0.20", "v0.21"]
cm_f = map(versions) do x
    idx = findfirst(c -> occursin(replace(x, "v" => ""), c.commit.message), cm[1])
    if !isnothing(idx)
        return cm[1][idx]
    else
        if x == "May-2023-News"
            idx = findfirst(c -> occursin("add new blogpost", c.commit.message), cm[1])
            return cm[1][idx]
        elseif x == "v0.19.7"
            idx = findfirst(c -> occursin("new blogpost & update JSServe", c.commit.message), cm[1])
            return cm[1][idx]
        elseif x == "v0.16"
            idx = findfirst(c -> occursin("improve blogpost a bit", c.commit.message), cm[1])
            return cm[1][idx]
        end
        return x
    end
end

dates = map(x-> x.commit.author.date, cm_f)
foreach(zip(versions, dates)) do (path, date)
    open(Blog.markdown(path, "post.xml"), "w") do io
        item = h.item()
        push!(item, h.title(path))
        push!(item, h.link("/blogposts/$(path)"))
        push!(item, h.description("Updates in Makie version $(path)"))
        push!(item, h.pubDate(date))
        print(io, XML.write(item))
    end
end
