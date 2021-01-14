using Query, DataFrames, Dates


files = DataFrame(markdown = readdir() |> 
    @filter(endswith(_,".md")) |> collect) |>
    @mutate(html = replace(_.markdown, ".md" => ".html")) |> 
    @mutate(mdtime = Dates.unix2datetime(mtime(_.markdown)),htmltime=Dates.unix2datetime(mtime(_.html))) |>
    @filter(_.mdtime>_.htmltime) |>
    @mutate(pd = "pandoc $(_.markdown) -s --mathjax -o $(_.html)") |>
    DataFrame


for cmd in files[!,:pd]
    @show cmd
    run(`sh -c $cmd`)
end