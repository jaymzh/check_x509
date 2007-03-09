### USERS CAN CHANGE STUFF HERE

PREFIX?=/usr
BIN?=$(PREFIX)/bin
NAGLIB?=$(PREFIX)/lib/nagios/plugins
MAN?=$(PREFIX)/share/man
INSTALL?=/usr/bin/install
POD2MAN?=/usr/bin/pod2man

### YOU SHOULDN'T NEED TO CHANGE ANYTHING BELOW THIS

all:
	@\
	echo "You have two options:" ;\
	echo "  make install -- a standard install" ;\
	echo "  make nag     -- a nagios-plugins install" ;\
	echo ""

install:
	$(INSTALL) -D --mode=755 check_x509 $(BIN)/check_x509
	$(POD2MAN) check_x509 > $(MAN)/man1/check_x509.1

nag: install-nagios
install-nag: install-nagios
install-nagios:	
	$(INSTALL) -D --mode=755 check_x509 $(NAGLIB)/check_x509

uninstall:
	/bin/rm -rf $(BIN)/check_x509
	/bin/rm -rf $(NAGLIB)/check_x509
	/bin/rm -rf $(MAN)/man1/check_x509.1

