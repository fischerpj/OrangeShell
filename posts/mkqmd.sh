#!/bin/bash
title_prefix="romains_"
book="rom"
start=1
end=16
chap=1

for ((ndx=$start;ndx<=$end;ndx++))
do
ref=$book$ndx
filename=$ref.qmd
echo $filename
cat > $filename <<EOF
---
title: $title_prefix$ndx
author: 'paul'
date: '2024-06-24'
categories: [SG21]
tags: [$book]
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
