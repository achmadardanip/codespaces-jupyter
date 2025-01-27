#!/usr/bin/env bash

# ======== Parameters to set post-processing steps ============================
# ('-i', '--infile'    , default=""   , help="input FITS file")
# ('-o', '--outfile'   , default=""   , help="output PDF file")
# ('-s', '--scale'     , default=False, help="display scale in output")
# ('-b', '--beam'      , default=False, help="display beam size in output")
# ('-l', '--blur'      , default=False, help="apply Gaussian blur to image")
# ('-u', '--afmhot10us', default=False, help="use the afmhot_10us colormap")
# ('-t', '--notitle'   , default=False, help="display with no title")
# ('-a', '--all'       , default=False, help="perform all post-processing steps")

# Traverse output dir and apply post-processing to each .fits file
for d in 095 096 100 101; do
    python eht-imaging_postprocessing.py \
        -i  ../output/SR1_M87_2017_${d}.fits \
        -o  ../output/SR1_M87_2017_${d}_processed.pdf \
        --blur --afmhot10us --notitle
done

# For succesion / timeline of steps:
# fits -> pipeline output image -> EHTIM script: none(afmhot) -> EHTIM script: blur(afmhot) -> EHTIM script: blur(afmhot_10us)
python eht-imaging_postprocessing.py \
    -i  ../output/SR1_M87_2017_101.fits \
    -o  ../output/SR1_M87_2017_101_afmhot.pdf \
    --notitle

python eht-imaging_postprocessing.py \
    -i  ../output/SR1_M87_2017_101.fits \
    -o  ../output/SR1_M87_2017_101_afmhot10us.pdf \
    --notitle --afmhot10us

python eht-imaging_postprocessing.py \
    -i  ../output/SR1_M87_2017_101.fits \
    -o  ../output/SR1_M87_2017_101_afmhot10us_blur.pdf \
    --blur --notitle --afmhot10us

