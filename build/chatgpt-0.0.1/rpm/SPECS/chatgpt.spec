Name:           chatgpt
Version:        0.0.1
Release:        1%{?dist}
Summary:        A simple command-line interface (CLI) for interacting with OpenAI's ChatGPT model.

License:        MIT
URL:            https://github.com/elias-ba/chatgpt-cli
Source0:        %{name}-%{version}.sh

BuildArch:      noarch

%description
A simple command-line interface (CLI) for interacting with OpenAI's ChatGPT model.

%prep
%setup -q -c -T

%install
install -D -m 755 %{SOURCE0} %{buildroot}/usr/bin/%{name}

%files
/usr/bin/%{name}

%changelog
* Thu Mar 03 2024 Elias W. BA <eliaswalyba@gmail.com> - 1.0-1
- Initial package
