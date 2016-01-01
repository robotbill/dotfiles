function runspec --description "Run Maven tests on scala file changes"
    set entr_mvn "entr -c mvn -s mvn-settings.xml -pl"
    set test_args "test -DfailIfNoTests=false"

    switch (count $argv)
        case 0
            echo "Usage: runspec project-path [TestClass]"
        case 1
            eval find $argv[1] "-name '*.scala' | " $entr_mvn $argv[1] $test_args
        case 2
            eval find $argv[1] "-name '*.scala' | " $entr_mvn $argv[1] $test_args -Dtest=$argv[2]
    end
end
