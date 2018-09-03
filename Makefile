output-dir := dist
tmp-dir := tmp
color := \#fdbe2c

all: $(output-dir) $(output-dir)/output-2.png

clean:
	rm -rf $(output-dir)

$(output-dir):
	mkdir -p $(output-dir)

$(output-dir)/output-1.png: src-1/Cat-Smoothed.png
	@convert -size 300x209 "xc:$(color)" $(tmp-dir)/fill.png
	@composite -compose Dst_In $^ $(tmp-dir)/fill.png -alpha Set $@

$(output-dir)/output-2.png: src-2/cat-stretch-silhouette-in-black.jpg
	convert -size 439x615 "xc:$(color)" $(tmp-dir)/fill.png
	convert $(tmp-dir)/fill.png \( $^ -negate -evaluate multiply 1.2 \) -alpha off -compose Copy_Opacity -composite $@
