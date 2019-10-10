.DEFAULT_GOAL := default
output = Output
project_name = dongle_learning_cdc
tty = /dev/ttyACM0
default: clean release
clean:
	@if [ -z "$(NORDIC_SDK_DIR)" ]; then \
		echo "ERROR: NORDIC_SDK_DIR environment variable not set. Exiting.."; \
		exit 1; \
	fi
	@if [ -d "$(output)" ]; then \
		rm -r $(output); \
	fi \

debug:
	emBuild -config "Debug"  -rebuild -packagesdir $(NORDIC_SDK_DIR) ses.emProject


release:
	emBuild -config "Release"  -rebuild -packagesdir $(NORDIC_SDK_DIR) ses.emProject


package-release:
	nrfutil pkg generate --hw-version 52 --sd-req=0x00  --application $(output)/Release/Exe/*.hex --application-version 1  $(output)/$(project_name).zip

flash:
	nrfutil dfu  usb-serial -pkg $(output)/$(project_name).zip -p $(tty)

build-all: clean release package-release

all: build-all flash
