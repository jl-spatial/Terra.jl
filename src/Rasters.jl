# import Rasters._sourcetype, Rasters._filterkw
    # Rasters.defaultmappedcrs, 
    # Rasters.defaultcrs;
import Rasters: FileArray, getraster, layerkeys, RasterDataSource, 
    defaultcrs, defaultmappedcrs, _sourcetype, 
    haslayers, _open


# `lazy`: If true Lazy DiskArray will be used; if false, all data will be read 
# into memory.
function Rasters.Raster(ds::NCD.CFVariable, filename::AbstractString, key=nothing;
    crs=nothing, mappedcrs=nothing, dims=nothing, refdims=(),
    name=Symbol(key isa Nothing ? "" : string(key)),
    metadata=metadata(ds), missingval=missingval(ds), write=false,
    source=_sourcetype(filename), lazy = true)

    crs = defaultcrs(source, crs)
    mappedcrs = defaultmappedcrs(source, mappedcrs)
    dims = dims isa Nothing ? DD.dims(ds, crs, mappedcrs) : dims
    
    data = lazy ? FileArray(ds, filename; key, write) : ds[:]
    return Raster(data, dims, refdims, name, metadata, missingval)
end


raster = Raster;
brick = RasterStack;


export raster, brick, dims
