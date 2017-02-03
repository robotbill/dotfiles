function vsh
	ssh $argv -t 'exec bash -o vi'
end
