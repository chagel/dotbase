function cabrf
 cf(){ git checkout -b z_hotfix/$(date "+%Y%m")_"$1"; unset -f cf; }; cf; 
end
