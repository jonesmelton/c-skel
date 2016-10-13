echo "Running unit tests"

for i in tests/*_tests
do
  if test -f $i
  then
    if $VALGRIND ./$i 2>> test/test.log
    then
      echo $i PASS
    else
      echo "FAILURE: $i:"
      echo "-------"
      tail test/test.log
      exit 1
    fi
  fi
done

echo ""
