#!/bin/bash

#!/bin/bash

for i in {0000..9999}
do
        echo $i >> possibilities.txt
done

cat possibilities.txt | ./leviathan6 
