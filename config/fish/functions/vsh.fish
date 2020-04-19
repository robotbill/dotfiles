function vsh -d "ssh and set bash's input mode to vi"
    ssh $argv -t 'exec bash -o vi'
end
