APP      := Neko
BUILD    := build
BUNDLE   := $(BUILD)/$(APP).app
BIN      := $(BUNDLE)/Contents/MacOS/$(APP)
PREFIX   ?= $(HOME)/Applications

# Pass IDENTITY=- for an ad-hoc signature when the Developer ID key isn't available.
IDENTITY ?= Developer ID Application: Henrique Carvalho Alves (CD8765XKTJ)

CC       := clang
ARCHS    := -arch arm64 -arch x86_64
MINOS    := -mmacosx-version-min=11.0
CFLAGS   := $(ARCHS) $(MINOS) -fno-objc-arc -O2 -Wall
LDFLAGS  := $(ARCHS) $(MINOS) -framework Cocoa

SRCS      := $(wildcard src/*.m)
HDRS      := $(wildcard src/*.h)
RESOURCES := $(shell find Resources -type f ! -name .DS_Store)

.PHONY: all run install clean

all: $(BUNDLE)

$(BIN): $(SRCS) $(HDRS)
	mkdir -p $(@D)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $(SRCS)

$(BUNDLE): $(BIN) Info.plist Neko.entitlements $(RESOURCES)
	mkdir -p $@/Contents/Resources
	cp Info.plist $@/Contents/
	rsync -a --exclude .DS_Store Resources/ $@/Contents/Resources/
	codesign --force --sign "$(IDENTITY)" --options runtime --timestamp \
		--entitlements Neko.entitlements $@
	touch $@

run: $(BUNDLE)
	open $(BUNDLE)

install: $(BUNDLE)
	-killall $(APP) 2>/dev/null; while pgrep -x $(APP) >/dev/null; do sleep 0.2; done
	rm -rf "$(PREFIX)/$(APP).app"
	ditto $(BUNDLE) "$(PREFIX)/$(APP).app"
	open "$(PREFIX)/$(APP).app"

clean:
	rm -rf $(BUILD)
