Blueberry
=========

Blueberry is a GitHub Action that checks the coding style of your C/C++/Haskell
code, following EPITECH's coding style.

The action will fail if your project does not follow the coding style, telling
you what is wrong and where it is wrong.

Workflow
--------

This is an example of a workflow that uses Blueberry:

```
name: blueberry
run-name: Blueberry checker launched by @${{ github.actor }}

on: [push]

jobs:
  coding_style:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v3
      - name: Run blueberry
        uses: Jabolol/blueberry@main
```

License
-------

The project is licensed under the terms of the MIT license. See LICENSE for more
details.
