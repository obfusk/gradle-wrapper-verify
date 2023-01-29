<!-- SPDX-FileCopyrightText: 2023 FC Stegerman <flx@obfusk.net> -->
<!-- SPDX-License-Identifier: GPL-3.0-or-later -->

[![GPLv3+](https://img.shields.io/badge/license-GPLv3+-blue.svg)](https://www.gnu.org/licenses/gpl-3.0.html)

# gradle-wrapper-verify

## verify gradle-wrapper.jar sha256sum against published releases

```bash
$ gradle-wrapper-verify /path/to/gradle-wrapper.jar
checking /path/to/gradle-wrapper.jar ...
OK
$ gradle-wrapper-verify # w/o args looks for gradle-wrapper.jar in . and gradle/wrapper/
checking gradle/wrapper/gradle-wrapper.jar ...
OK
```

## update checksums

```bash
$ make
```

## License

[![GPLv3+](https://www.gnu.org/graphics/gplv3-127x51.png)](https://www.gnu.org/licenses/gpl-3.0.html)

<!-- vim: set tw=70 sw=2 sts=2 et fdm=marker : -->
