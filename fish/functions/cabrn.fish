function cabrn
 cf(){ git checkout -b z_features/$(date "+%Y%m")_"$1"; unset -f cf; }; cf; 
end
