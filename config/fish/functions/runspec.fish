function runspec --description "Run Maven tests on scala file changes"
    if test (count $argv) = 0
        echo "Usage: runspec project-path [TestClass]"
    else
        if test (count $argv) = 2
            set test_class -Dtest=$argv[2]
        end

        find $argv[1] -name '*.scala' |  \
            entr -c mvn -s mvn-settings.xml -pl $argv[1] test -DfailIfNoTests=false $test_class
    end
end
