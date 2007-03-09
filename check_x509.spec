# Sample spec file.
# $Id$

%define name check_x509
%define version	1.0
%define release 1

Name: %{name}
Summary: A generic x509 checking utility
Version: %{version}
Release: %{release}
Group: Monitoring
License: GPLv2
URL: http://www.phildev.net/check_x509/
BuildRoot: %{_tmppath}/%{name}-buildroot
Requires: perl

%description
 check_x509 is a generic utility for checking X509 entities. It
 currently supports certificates and CRLs. It can be used as a
 stand-alone utility, a nagios/nrpe plugin, or in other scripts,
 applications, or cronjobs.

%prep
rm -rf $RPM_BUILD_ROOT
%setup

%install
make install PREFIX=$RPM_BUILD_ROOT/usr

%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(755, root, bin, 755)
/usr/bin/%{name}
/usr/man/man1/%{name}.1*
%doc README COPYING

