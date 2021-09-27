# orgclone
a bashscript for clone all repos of an org
for example ,clone all repos of hobbymarks in github:
```console

hobbymarks@hma:./orGClone.sh -h
git clone all the repos of an organization.

Syntax: orgClone.sh [-l NAME | -r NAME |h]
options:
l     List all repos in the NAME organization one bye one.
r     Run git clone repo in the NAME organization one bye one.
h     Print this Help.


hobbymarks@hma:./orGClone.sh -l apple
********** all repos in apple:
-->1:llvm-project
-->2:foundationdb
-->3:swift-evolution
-->4:swift
-->5:servicetalk
-->6:swift-numerics
-->7:swift-package-manager
-->8:swift-corelibs-xctest
-->9:password-manager-resources
-->10:sourcekit-lsp
-->11:swift-tools-support-core
-->12:swift-driver
-->13:swift-syntax
-->14:indexstore-db
-->15:swift-stress-tester
-->16:swift-xcode-playground-support
-->17:swift-integration-tests
-->18:swift-cmark
-->19:swift-corelibs-libdispatch
-->20:swift-corelibs-foundation
-->21:swift-llbuild
-->22:swift-package-collection-generator
-->23:swift-format
-->24:swift-collections
-->25:swift-atomics
-->26:swift-installer-scripts
-->27:swift-system
-->28:cups
-->29:swift-source-compat-suite
-->30:ml-gsn

```
