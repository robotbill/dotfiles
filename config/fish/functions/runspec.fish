function runspec
    switch (count $argv)
        case 0
            echo "Usage: ..."
        case 1
            find $argv[1] -name '*.scala' | entr -c mvn -s mvn-settings.xml -pl $argv[1] test -DfailIfNoTests=false
        case 2
            find $argv[1] -name '*.scala' | entr -c mvn -s mvn-settings.xml -pl $argv[1] test -Dtest=$argv[2] -DfailIfNoTests=false
    end
end
