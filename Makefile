
TARGET = spritesheetify
INSTALL_PATH = /usr/local

install: $(TARGET)
	mkdir -p $(INSTALL_PATH)/bin
	cp -f $(TARGET) $(INSTALL_PATH)/bin
	chmod 755 $(INSTALL_PATH)/bin/$(TARGET)
	ln -fs $(TARGET) $(INSTALL_PATH)/bin/t$(TARGET)
	mkdir -p $(INSTALL_PATH)/share/man/man1/
	cp -f $(TARGET).1 $(INSTALL_PATH)/share/man/man1/$(TARGET).1
	chmod 644 $(INSTALL_PATH)/share/man/man1/$(TARGET).1

uninstall:
	rm -f $(INSTALL_PATH)/bin/$(TARGET)
