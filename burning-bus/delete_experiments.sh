#!/bin/bash

experiments=( "'291466893881088003'" "'11687726917012089685'" "'1774986432794492271'" "'6640889959924881339'" "'18054034121795907211'" "'2022326535539004000'" "'2235104427634649129'" "'13578963889485391339'" "'17148943305476376222'" "'3155606761139264737'")

for item in ${experiments[*]}
do
    psql -f delete_experiments.sql -v exp=$item
done