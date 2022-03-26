using Terra

f = "/mnt/z/ChinaHW/Observed/clusterId_ncell=16/clusterId_HI_Tmax_(1961-2016).nc"

@time r = brick(f);
