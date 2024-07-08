#!/bin/bash
title_prefix="2pierre_"
book="2pet"
end=3
start=1
chap=1
leading_zero="0"
regex='^[0-9]$'
offset=5

for ((ndx=$start;ndx<=$end;ndx++))
do
if [[ $ndx =~ $regex ]]
then prefixed_ndx=$leading_zero$ndx
else prefixed_ndx=$ndx
fi
ref=$book$ndx
filename=$book$prefixed_ndx.qmd
echo $prefixed_ndx
echo $filename
cat > $filename <<EOF
---
title: $title_prefix$prefixed_ndx
author: 'paul'
date: now
date-format: "D MMM YY HH:mm.ss"
categories: [SG21]
tags: [$title_prefix]
params:
  refs: $ref
  refs_after: Rom1:1
  version: SG21
---

\`\`\`{r, BCV_code, echo=FALSE}
XMINPI::bcv_list_(params\$refs, params\$version)
\`\`\`

EOF

done
