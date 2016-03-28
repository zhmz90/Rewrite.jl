

@doc """ copy build file from destine dir to source dir
""" ->
function makebuild(dst, src)
    build_fl = joinpath(src, "BUILD")
    @assert isfile(build_fl)
    
    data = readlines(build_fl)
    
    srcname = basename(src)
    dstname = basename(dst)

    data = convert(Array{ASCIIString,1}, data)

    #rstr = Regex("name = \"$(srcname)\"")

    data = map(line->replace(line, srcname, dstname), data)
    
    dstbuild = joinpath(dst, "BUILD")
    
    write(dstbuild, data)
end



