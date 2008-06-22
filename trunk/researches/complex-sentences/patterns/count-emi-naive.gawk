BEGIN{
	FS = "#####!#####";
}
{
	split($3, arr, " ");

	c = 0
	for (i=1; i<=length(arr); i++){
		if ( arr[i] ~ /\/(EC|EF|ETM|ETN)/ ) {
					++c;
		}
	}
	print c;
}
