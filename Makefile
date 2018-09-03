output-dir := dist
tmp-dir := tmp
color := \#fdbe2c

.PHONY: all
all: $(output-dir) $(output-dir)/cat-1.png $(output-dir)/cat-2.png $(output-dir)/cat-3.png $(output-dir)/cat-4.png

.PHONY: clean
clean:
	rm -rf $(output-dir)

$(output-dir):
	mkdir -p $(output-dir)

$(output-dir)/%.png: src/%.png
	convert -size $$(identify -format "%wx%h" $^) "xc:$(color)" $(tmp-dir)/fill.png
	composite -compose Dst_In $^ $(tmp-dir)/fill.png -alpha Set $@

$(output-dir)/%.png: src/%.jpg
	convert -size $$(identify -format "%wx%h" $^) "xc:$(color)" $(tmp-dir)/fill.png
	convert $(tmp-dir)/fill.png \( $^ -negate -evaluate multiply 1.2 \) -alpha off -compose Copy_Opacity -composite $@
