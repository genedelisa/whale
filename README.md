# Whale

N.B. I don't know what I'm doing. :)

Anyway, I'm running my C++ builds in this container.

The default cmake you get from apt-get is ancient.
So, I grabbed the current one, unpacked it and built it.
This took a long time.
Now I download the binary.

I've installed the current version of clang to mirror what I do on macOS.

Here they are.

```shell
root@af88ed8a4084:/# clang --version
clang version 8.0.0 (tags/RELEASE_800/final)
Target: x86_64-unknown-linux-gnu
Thread model: posix
InstalledDir: /usr/local/clang_8.0.0/bin
root@af88ed8a4084:/# cmake --version
cmake version 3.14.5

CMake suite maintained and supported by Kitware (kitware.com/cmake).
root@af88ed8a4084:/#
```

FWIW, the default version of gcc that's installed is this:


```
g++ (Ubuntu 7.4.0-1ubuntu1~18.04.1) 7.4.0
```

This version has most of C++17 implemented. Version 8+ has all of C++17 implemented.

## Feedback

Really, I just whacked this togehter.

If you are an expert and have suggestions on what to improve, I'd like to hear it.

- Gene
