output-dir := dist
tmp-dir := tmp
color := \#fdbe2c

all: $(output-dir) $(output-dir)/output-1.png

clean:
	rm -rf $(output-dir)

$(output-dir):
	mkdir -p $(output-dir)

$(output-dir)/output-1.png: src-1/Cat-Smoothed.png
	convert -size 300x209 "xc:$(color)" $(tmp-dir)/fill.png
	composite -compose Dst_In src-1/Cat-Smoothed.png $(tmp-dir)/fill.png -alpha Set $(output-dir)/output-1.png
